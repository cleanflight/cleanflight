/*
 * Author: Brendan Le Foll <brendan.le.foll@intel.com>
 * Copyright (c) 2015 Intel Corporation.
 *
 * Permission is hereby granted, free of charge, to any person obtaining
 * a copy of this software and associated documentation files (the
 * "Software"), to deal in the Software without restriction, including
 * without limitation the rights to use, copy, modify, merge, publish,
 * distribute, sublicense, and/or sell copies of the Software, and to
 * permit persons to whom the Software is furnished to do so, subject to
 * the following conditions:
 *
 * The above copyright notice and this permission notice shall be
 * included in all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
 * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
 * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
 * NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
 * LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
 * OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
 * WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 */

#include "iio.h"
#include "mraa_internal.h"
#include "dirent.h"
#include <string.h>
#include <poll.h>
#if defined(MSYS)
#define __USE_LINUX_IOCTL_DEFS
#endif
#include <sys/ioctl.h>
#include <sys/stat.h>

#define MAX_SIZE 128
#define IIO_DEVICE "iio:device"
#define IIO_SCAN_ELEM "scan_elements"
#define IIO_SLASH_DEV "/dev/" IIO_DEVICE
#define IIO_SYSFS_DEVICE "/sys/bus/iio/devices/" IIO_DEVICE
#define IIO_EVENTS "events"
#define IIO_CONFIGFS_TRIGGER "/sys/kernel/config/iio/triggers/"

mraa_iio_context
mraa_iio_init(int device)
{
    if (plat_iio->iio_device_count == 0 || device >= plat_iio->iio_device_count) {
        return NULL;
    }

    mraa_iio_get_channel_data(&plat_iio->iio_devices[device]);
    mraa_iio_get_event_data(&plat_iio->iio_devices[device]);

    return &plat_iio->iio_devices[device];
}

int
mraa_iio_read_size(mraa_iio_context dev)
{
    return dev->datasize;
}

mraa_iio_channel*
mraa_iio_get_channels(mraa_iio_context dev)
{
    return dev->channels;
}

int
mraa_iio_get_channel_count(mraa_iio_context dev)
{
    return dev->chan_num;
}

mraa_result_t
mraa_iio_get_channel_data(mraa_iio_context dev)
{
    const struct dirent* ent;
    DIR* dir;
    int chan_num = 0;
    char buf[MAX_SIZE];
    char readbuf[32];
    int fd;
    int ret = 0;
    int padint = 0;
    int curr_bytes = 0;
    char shortbuf, signchar;
    int i = 0;

    dev->datasize = 0;

    memset(buf, 0, MAX_SIZE);
    snprintf(buf, MAX_SIZE, IIO_SYSFS_DEVICE "%d/" IIO_SCAN_ELEM, dev->num);
    dir = opendir(buf);
    if (dir != NULL) {
        while ((ent = readdir(dir)) != NULL) {
            if (strcmp(ent->d_name + strlen(ent->d_name) - strlen("_en"), "_en") == 0) {
                chan_num++;
            }
        }
    }
    dev->chan_num = chan_num;
    // no need proceed if no channel found
    if (chan_num == 0) {
        closedir(dir);
        return MRAA_SUCCESS;
    }
    mraa_iio_channel* chan;
    dev->channels = calloc(chan_num, sizeof(mraa_iio_channel));
    seekdir(dir, 0);
    while ((ent = readdir(dir)) != NULL) {
        if (strcmp(ent->d_name + strlen(ent->d_name) - strlen("_index"), "_index") == 0) {
            snprintf(buf, MAX_SIZE, IIO_SYSFS_DEVICE "%d/" IIO_SCAN_ELEM "/%s", dev->num, ent->d_name);
            fd = open(buf, O_RDONLY);
            if (fd != -1) {
                if (read(fd, readbuf, 2 * sizeof(char)) != 2) {
                    close(fd);
                    break;
                }
                chan_num = ((int) strtol(readbuf, NULL, 10));
                chan = &dev->channels[chan_num];
                chan->index = chan_num;
                close(fd);

                buf[(strlen(buf) - 5)] = '\0';
                char* str = strdup(buf);
                // grab the type of the buffer
                snprintf(buf, MAX_SIZE, "%stype", str);
                fd = open(buf, O_RDONLY);
                if (fd != -1) {
                    read(fd, readbuf, 31 * sizeof(char));
                    ret = sscanf(readbuf, "%ce:%c%u/%u>>%u", &shortbuf, &signchar, &chan->bits_used,
                                 &padint, &chan->shift);
                    chan->bytes = padint / 8;
                    // probably should be 5?
                    if (ret < 0) {
                        // cleanup
                        free(str);
                        close(fd);
                        return MRAA_IO_SETUP_FAILURE;
                    }
                    chan->signedd = (signchar == 's');
                    chan->lendian = (shortbuf == 'l');
                    if (chan->bits_used == 64) {
                        chan->mask = ~0;
                    } else {
                        chan->mask = (1 << chan->bits_used) - 1;
                    }
                    close(fd);
                }
                // grab the enable flag of channel
                snprintf(buf, MAX_SIZE, "%sen", str);
                fd = open(buf, O_RDONLY);
                if (fd != -1) {
                    if (read(fd, readbuf, 2 * sizeof(char)) != 2) {
                        syslog(LOG_ERR, "iio: Failed to read a sensible value from sysfs");
                        free(str);
                        close(fd);
                        return -1;
                    }
                    chan->enabled = (int) strtol(readbuf, NULL, 10);
                    // only calculate enable buffer size for trigger buffer extract data
                    if (chan->enabled) {
                        dev->datasize += chan->bytes;
                    }
                    close(fd);
                }
                // clean up str var
                free(str);
            }
        }
    }
    closedir(dir);

    // channel location has to be done in channel index order so do it afetr we
    // have grabbed all the correct info
    for (i = 0; i < dev->chan_num; i++) {
	chan = &dev->channels[i];
        if (curr_bytes % chan->bytes == 0) {
            chan->location = curr_bytes;
        } else {
            chan->location = curr_bytes - curr_bytes % chan->bytes + chan->bytes;
        }
        curr_bytes = chan->location + chan->bytes;
    }

    return MRAA_SUCCESS;
}

const char*
mraa_iio_get_device_name(mraa_iio_context dev)
{
    return dev->name;
}

int
mraa_iio_get_device_num_by_name(const char* name)
{
    int i;

    if (plat_iio == NULL) {
        syslog(LOG_ERR, "iio: platform IIO structure is not initialized");
        return -1;
    }

    if (name == NULL) {
        syslog(LOG_ERR, "iio: device name is NULL, unable to find its number");
        return -1;
    }

    for (i = 0; i < plat_iio->iio_device_count; i++) {
        struct _iio* device;
        device = &plat_iio->iio_devices[i];
        // we want to check for exact match
        if (strncmp(device->name, name, strlen(device->name) + 1) == 0) {
            return device->num;
        }
    }

    return -1;
}

mraa_result_t
mraa_iio_read_float(mraa_iio_context dev, const char* attr_name, float* data)
{
    char buf[MAX_SIZE];
    mraa_result_t result = mraa_iio_read_string(dev, attr_name, buf, MAX_SIZE-1);
    if (result != MRAA_SUCCESS)
        return result;
    int status = sscanf(buf, "%f", data);
    result = status == 1 ? MRAA_SUCCESS : MRAA_ERROR_UNSPECIFIED;
    return result;
}


mraa_result_t
mraa_iio_read_int(mraa_iio_context dev, const char* attr_name, int* data)
{
    char buf[MAX_SIZE];
    mraa_result_t result = mraa_iio_read_string(dev, attr_name, buf, MAX_SIZE-1);
    if (result != MRAA_SUCCESS)
        return result;
    int status = sscanf(buf, "%d", data);
    result = status == 1 ? MRAA_SUCCESS : MRAA_ERROR_UNSPECIFIED;
    return result;
}

mraa_result_t
mraa_iio_read_string(mraa_iio_context dev, const char* attr_name, char* data, int max_len)
{
    char buf[MAX_SIZE];
    mraa_result_t result = MRAA_ERROR_UNSPECIFIED;
    snprintf(buf, MAX_SIZE, IIO_SYSFS_DEVICE "%d/%s", dev->num, attr_name);
    int fd = open(buf, O_RDONLY);
    if (fd != -1) {
        ssize_t len = read(fd, data, max_len);
        if (len > 0)
            result = MRAA_SUCCESS;
        close(fd);
    }
    return result;

}

mraa_result_t
mraa_iio_write_float(mraa_iio_context dev, const char* attr_name, const float data)
{
    char buf[MAX_SIZE];
    snprintf(buf, MAX_SIZE, "%f", data);
    return mraa_iio_write_string(dev, attr_name, buf);
}

mraa_result_t
mraa_iio_write_int(mraa_iio_context dev, const char* attr_name, const int data)
{
    char buf[MAX_SIZE];
    snprintf(buf, MAX_SIZE, "%d", data);
    return mraa_iio_write_string(dev, attr_name, buf);
}

mraa_result_t
mraa_iio_write_string(mraa_iio_context dev, const char* attr_name, const char* data)
{
    char buf[MAX_SIZE];
    mraa_result_t result = MRAA_ERROR_UNSPECIFIED;
    snprintf(buf, MAX_SIZE, IIO_SYSFS_DEVICE "%d/%s", dev->num, attr_name);
    int fd = open(buf, O_WRONLY);
    if (fd != -1) {
        int len = strlen(data);
        ssize_t status = write(fd, data, len);
        if (status == len)
             result = MRAA_SUCCESS;
        close(fd);
    }
    return result;
}

static mraa_result_t
mraa_iio_wait_event(int fd, char* data, int* read_size)
{
    struct pollfd pfd;

    if (fd < 0) {
        return MRAA_ERROR_INVALID_RESOURCE;
    }

    pfd.fd = fd;
    pfd.events = POLLIN;

    // Wait for it forever or until pthread_cancel
    // poll is a cancelable point like sleep()
    poll(&pfd, 1, -1);

    memset(data, 0, 100);
    *read_size = read(fd, data, 100);

    return MRAA_SUCCESS;
}

static void*
mraa_iio_trigger_handler(void* arg)
{
    mraa_iio_context dev = (mraa_iio_context) arg;
    int i;
    char data[MAX_SIZE * 100];
    int read_size;

    for (;;) {
        if (mraa_iio_wait_event(dev->fp, &data[0], &read_size) == MRAA_SUCCESS) {
#ifdef HAVE_PTHREAD_CANCEL
            pthread_setcancelstate(PTHREAD_CANCEL_DISABLE, NULL);
#endif
            // only can process if readsize >= enabled channel's datasize
            for (i = 0; i < (read_size / dev->datasize); i++) {
                dev->isr((void*)&data);
            }
#ifdef HAVE_PTHREAD_CANCEL
            pthread_setcancelstate(PTHREAD_CANCEL_ENABLE, NULL);
#endif
        } else {
            // we must have got an error code so die nicely
#ifdef HAVE_PTHREAD_CANCEL
            pthread_setcancelstate(PTHREAD_CANCEL_DISABLE, NULL);
#endif
            return NULL;
        }
    }
}

mraa_result_t
mraa_iio_trigger_buffer(mraa_iio_context dev, void (*fptr)(char* data), void* args)
{
    char bu[MAX_SIZE];
    if (dev->thread_id != 0) {
        return MRAA_ERROR_NO_RESOURCES;
    }

    sprintf(bu, IIO_SLASH_DEV "%d", dev->num);
    dev->fp = open(bu, O_RDONLY | O_NONBLOCK);
    if (dev->fp == -1) {
        return MRAA_ERROR_INVALID_RESOURCE;
    }

    dev->isr = fptr;
    pthread_create(&dev->thread_id, NULL, mraa_iio_trigger_handler, (void*) dev);

    return MRAA_SUCCESS;
}

mraa_result_t
mraa_iio_get_event_data(mraa_iio_context dev)
{
    const struct dirent* ent;
    DIR* dir;
    int event_num = 0;
    char buf[MAX_SIZE];
    char readbuf[32];
    int fd;

    memset(buf, 0, MAX_SIZE);
    memset(readbuf, 0, 32);
    snprintf(buf, MAX_SIZE, IIO_SYSFS_DEVICE "%d/" IIO_EVENTS, dev->num);
    dir = opendir(buf);
    if (dir != NULL) {
        while ((ent = readdir(dir)) != NULL) {
            if (strcmp(ent->d_name + strlen(ent->d_name) - strlen("_en"), "_en") == 0) {
                event_num++;
            }
        }
        dev->event_num = event_num;
        // no need proceed if no event found
        if (event_num == 0) {
            closedir(dir);
            return MRAA_SUCCESS;
        }
        mraa_iio_event* event;
        dev->events = calloc(event_num, sizeof(mraa_iio_event));
        if (dev->events == NULL) {
            closedir(dir);
            return MRAA_ERROR_UNSPECIFIED;
        }
        rewinddir(dir);
        event_num = 0;
        while ((ent = readdir(dir)) != NULL) {
            if (strcmp(ent->d_name + strlen(ent->d_name) - strlen("_en"), "_en") == 0) {
                event = &dev->events[event_num];
                event->name = strdup(ent->d_name);
                snprintf(buf, MAX_SIZE, IIO_SYSFS_DEVICE "%d/" IIO_EVENTS "/%s", dev->num, ent->d_name);
                fd = open(buf, O_RDONLY);
                if (fd != -1) {
                    if (read(fd, readbuf, 2 * sizeof(char)) != 2) {
                        close(fd);
                        break;
                    }
                    close(fd);
                }
                event->enabled = ((int) strtol(readbuf, NULL, 10));
                // Todo, read other event info.
                event_num++;
            }
        }
        closedir(dir);
    }
    return MRAA_SUCCESS;
}

static mraa_result_t
mraa_iio_event_poll_nonblock(int fd, struct iio_event_data* data)
{
    struct pollfd pfd;

    if (fd < 0) {
        return MRAA_ERROR_INVALID_RESOURCE;
    }

    pfd.fd = fd;
    pfd.events = POLLIN;

    // Wait for it forever or until pthread_cancel
    // poll is a cancelable point like sleep()
    poll(&pfd, 1, -1);

    read(fd, data, sizeof(struct iio_event_data));

    return MRAA_SUCCESS;
}

mraa_result_t
mraa_iio_event_poll(mraa_iio_context dev, struct iio_event_data* data)
{
    char bu[MAX_SIZE];
    int ret;
    int event_fd;
    int fd;

    snprintf(bu, MAX_SIZE, IIO_SLASH_DEV "%d", dev->num);
    fd = open(bu, 0);
    if (fd != -1) {
        ret = ioctl(fd, IIO_GET_EVENT_FD_IOCTL, &event_fd);
        close(fd);
    } else {
        return MRAA_ERROR_UNSPECIFIED;
    }

    if (ret == -1 || event_fd == -1)
        return MRAA_ERROR_UNSPECIFIED;

    ret = read(event_fd, data, sizeof(struct iio_event_data));

    close(event_fd);
    return MRAA_SUCCESS;
}

static void*
mraa_iio_event_handler(void* arg)
{
    struct iio_event_data data;
    mraa_iio_context dev = (mraa_iio_context) arg;

    for (;;) {
        if (mraa_iio_event_poll_nonblock(dev->fp_event, &data) == MRAA_SUCCESS) {
#ifdef HAVE_PTHREAD_CANCEL
            pthread_setcancelstate(PTHREAD_CANCEL_DISABLE, NULL);
#endif
            dev->isr_event(&data, dev->isr_args);
#ifdef HAVE_PTHREAD_CANCEL
            pthread_setcancelstate(PTHREAD_CANCEL_ENABLE, NULL);
#endif
        } else {
            // we must have got an error code so die nicely
#ifdef HAVE_PTHREAD_CANCEL
            pthread_setcancelstate(PTHREAD_CANCEL_DISABLE, NULL);
#endif
            return NULL;
        }
    }
}

mraa_result_t
mraa_iio_event_setup_callback(mraa_iio_context dev, void (*fptr)(struct iio_event_data* data, void* args), void* args)
{
    int ret;
    char bu[MAX_SIZE];
    if (dev->thread_id != 0) {
        return MRAA_ERROR_NO_RESOURCES;
    }

    sprintf(bu, IIO_SLASH_DEV "%d", dev->num);
    dev->fp = open(bu, O_RDONLY | O_NONBLOCK);
    if (dev->fp == -1) {
        return MRAA_ERROR_INVALID_RESOURCE;
    }
    ret = ioctl(dev->fp, IIO_GET_EVENT_FD_IOCTL, &dev->fp_event);
    close(dev->fp);

    if (ret == -1 || dev->fp_event == -1) {
        return MRAA_ERROR_UNSPECIFIED;
    }

    dev->isr_event = fptr;
    dev->isr_args = args;
    pthread_create(&dev->thread_id, NULL, mraa_iio_event_handler, (void*) dev);

    return MRAA_SUCCESS;
}

mraa_result_t
mraa_iio_event_extract_event(struct iio_event_data* event,
                             int* chan_type,
                             int* modifier,
                             int* type,
                             int* direction,
                             int* channel,
                             int* channel2,
                             int* different)
{
    *chan_type = IIO_EVENT_CODE_EXTRACT_CHAN_TYPE(event->id);
    *modifier = IIO_EVENT_CODE_EXTRACT_MODIFIER(event->id);
    *type = IIO_EVENT_CODE_EXTRACT_TYPE(event->id);
    *direction = IIO_EVENT_CODE_EXTRACT_DIR(event->id);
    *channel = IIO_EVENT_CODE_EXTRACT_CHAN(event->id);
    *channel2 = IIO_EVENT_CODE_EXTRACT_CHAN2(event->id);
    *different = IIO_EVENT_CODE_EXTRACT_DIFF(event->id);
    return MRAA_SUCCESS;
}

mraa_result_t
mraa_iio_get_mount_matrix(mraa_iio_context dev, const char *sysfs_name, float mm[9])
{
    char buf[MAX_SIZE];
    FILE* fp;
    int ret;

    memset(buf, 0, MAX_SIZE);
    snprintf(buf, MAX_SIZE, IIO_SYSFS_DEVICE "%d/%s", dev->num, sysfs_name);
    fp = fopen(buf, "r");
    if (fp != NULL) {
        ret = fscanf(fp, "%f, %f, %f; %f, %f, %f; %f, %f, %f\n", &mm[0], &mm[1], &mm[2], &mm[3],
                     &mm[4], &mm[5],&mm[6], &mm[7], &mm[8]);
        fclose(fp);
        if (ret != 9) {
            return MRAA_ERROR_UNSPECIFIED;
        }
        return MRAA_SUCCESS;
    }
    return MRAA_ERROR_UNSPECIFIED;
}

mraa_result_t
mraa_iio_create_trigger(mraa_iio_context dev, const char* trigger)
{
    struct stat configfs_status;
    char buf[MAX_SIZE];

    if (stat(IIO_CONFIGFS_TRIGGER, &configfs_status) == 0) {
        memset(buf, 0, MAX_SIZE);
        snprintf(buf, MAX_SIZE, IIO_CONFIGFS_TRIGGER "%s", trigger);
        // we actually don't care if this doesn't succeed, as it just means
        // it's already been initialised
        mkdir(buf, configfs_status.st_mode);
    }

    return MRAA_ERROR_UNSPECIFIED;
}

mraa_result_t
mraa_iio_update_channels(mraa_iio_context dev)
{
    const struct dirent* ent;
    DIR* dir;
    int chan_num = 0;
    char buf[MAX_SIZE];
    char readbuf[32];
    int fd;
    mraa_iio_channel* chan;

    dev->datasize = 0;
    memset(buf, 0, MAX_SIZE);
    snprintf(buf, MAX_SIZE, IIO_SYSFS_DEVICE "%d/" IIO_SCAN_ELEM, dev->num);
    dir = opendir(buf);
    if (dir != NULL) {
        while ((ent = readdir(dir)) != NULL) {
            if (strcmp(ent->d_name + strlen(ent->d_name) - strlen("_index"), "_index") == 0) {
                snprintf(buf, MAX_SIZE, IIO_SYSFS_DEVICE "%d/" IIO_SCAN_ELEM "/%s", dev->num, ent->d_name);
                fd = open(buf, O_RDONLY);
                if (fd != -1) {
                    if (read(fd, readbuf, 2 * sizeof(char)) != 2) {
                        close(fd);
                        break;
                    }
                    chan_num = ((int) strtol(readbuf, NULL, 10));
                    if (chan_num >= 0 && chan_num < dev->chan_num) {
                        chan = &dev->channels[chan_num];
                        chan->index = chan_num;
                        close(fd);

                        buf[(strlen(buf) - 5)] = '\0';
                        char* str = strdup(buf);
                        // grab the enable flag of channel
                        snprintf(buf, MAX_SIZE, "%sen", str);
                        fd = open(buf, O_RDONLY);
                        if (fd != -1) {
                            if (read(fd, readbuf, 2 * sizeof(char)) != 2) {
                                syslog(LOG_ERR, "iio: Failed to read a sensible value from sysfs");
                                free(str);
                                close(fd);
                                closedir(dir);
                                return -1;
                            }
                            chan->enabled = (int) strtol(readbuf, NULL, 10);
                            // only calculate enable buffer size for trigger buffer extract data
                            if (chan->enabled) {
                                dev->datasize += chan->bytes;
                            }
                            close(fd);
                        }
                        // clean up str var
                        free(str);
                    }
                    else {
                        close(fd);
                    }
                }
            }
        }
        closedir(dir);
        return MRAA_SUCCESS;
    }

    return MRAA_ERROR_INVALID_HANDLE;
}

mraa_result_t
mraa_iio_close(mraa_iio_context dev)
{
    free(dev->channels);
    return MRAA_SUCCESS;
}
