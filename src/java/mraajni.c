/*
 * Author: Henry Bruce <henry.bruce@intel.com>
 * Copyright (c) 2016 Intel Corporation.
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

#include <pthread.h>
#include "java/mraajni.h"

static pthread_key_t env_key;
static pthread_once_t env_key_init = PTHREAD_ONCE_INIT;
static jmethodID runGlobal;
static JavaVM* globVM = NULL;


void
mraa_java_set_jvm(JavaVM* vm)
{
    globVM = vm;
}

static void
mraa_java_make_env_key(void)
{
    if (globVM != NULL) {
        JNIEnv* jenv;
        (*globVM)->GetEnv(globVM, (void**) &jenv, JNI_REQUIRED_VERSION);
        jclass rcls = (*jenv)->FindClass(jenv, "java/lang/Runnable");
        jmethodID runm = (*jenv)->GetMethodID(jenv, rcls, "run", "()V");
        runGlobal = (jmethodID)(*jenv)->NewGlobalRef(jenv, (jobject) runm);
        pthread_key_create(&env_key, NULL);
    }
}

void
mraa_java_isr_callback(void* data)
{
    JNIEnv* jenv = (JNIEnv*) pthread_getspecific(env_key);
    (*jenv)->CallVoidMethod(jenv, (jobject) data, runGlobal);
}

mraa_result_t
mraa_java_attach_thread()
{
    if (globVM != NULL) {
        JNIEnv* jenv;
        jint err = (*globVM)->AttachCurrentThreadAsDaemon(globVM, (void**) &jenv, NULL);
        if (err == JNI_OK) {
            pthread_once(&env_key_init, mraa_java_make_env_key);
            pthread_setspecific(env_key, jenv);
            return MRAA_SUCCESS;
        }
    }
    return MRAA_ERROR_UNSPECIFIED;
}

void
mraa_java_detach_thread()
{
    if (globVM != NULL)
        (*globVM)->DetachCurrentThread(globVM);
}

void*
mraa_java_create_global_ref(void* args)
{
    if (globVM != NULL) {
        JNIEnv* jenv;
        (*globVM)->GetEnv(globVM, (void**) &jenv, JNI_REQUIRED_VERSION);
        jobject grunnable = (*jenv)->NewGlobalRef(jenv, (jobject) args);
        return (void*) grunnable;
    } else
        return NULL;
}

void
mraa_java_delete_global_ref(void* ref)
{
    if (globVM != NULL) {
        JNIEnv* jenv;
        (*globVM)->GetEnv(globVM, (void**) &jenv, JNI_REQUIRED_VERSION);
        (*jenv)->DeleteGlobalRef(jenv, (jobject) ref);
    }
}
