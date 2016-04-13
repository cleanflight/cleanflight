/** @file
 *	@brief MAVLink comm protocol testsuite generated from ardupilotmega.xml
 *	@see http://qgroundcontrol.org/mavlink/
 */
#ifndef ARDUPILOTMEGA_TESTSUITE_H
#define ARDUPILOTMEGA_TESTSUITE_H

#ifdef __cplusplus
extern "C" {
#endif

#ifndef MAVLINK_TEST_ALL
#define MAVLINK_TEST_ALL
static void mavlink_test_common(uint8_t, uint8_t, mavlink_message_t *last_msg);
static void mavlink_test_ardupilotmega(uint8_t, uint8_t, mavlink_message_t *last_msg);

static void mavlink_test_all(uint8_t system_id, uint8_t component_id, mavlink_message_t *last_msg)
{
	mavlink_test_common(system_id, component_id, last_msg);
	mavlink_test_ardupilotmega(system_id, component_id, last_msg);
}
#endif

#include "../common/testsuite.h"


static void mavlink_test_sensor_offsets(uint8_t system_id, uint8_t component_id, mavlink_message_t *last_msg)
{
	mavlink_message_t msg;
        uint8_t buffer[MAVLINK_MAX_PACKET_LEN];
        uint16_t i;
	mavlink_sensor_offsets_t packet_in = {
		17.0,963497672,963497880,101.0,129.0,157.0,185.0,213.0,241.0,19107,19211,19315
    };
	mavlink_sensor_offsets_t packet1, packet2;
        memset(&packet1, 0, sizeof(packet1));
        	packet1.mag_declination = packet_in.mag_declination;
        	packet1.raw_press = packet_in.raw_press;
        	packet1.raw_temp = packet_in.raw_temp;
        	packet1.gyro_cal_x = packet_in.gyro_cal_x;
        	packet1.gyro_cal_y = packet_in.gyro_cal_y;
        	packet1.gyro_cal_z = packet_in.gyro_cal_z;
        	packet1.accel_cal_x = packet_in.accel_cal_x;
        	packet1.accel_cal_y = packet_in.accel_cal_y;
        	packet1.accel_cal_z = packet_in.accel_cal_z;
        	packet1.mag_ofs_x = packet_in.mag_ofs_x;
        	packet1.mag_ofs_y = packet_in.mag_ofs_y;
        	packet1.mag_ofs_z = packet_in.mag_ofs_z;
        
        

        memset(&packet2, 0, sizeof(packet2));
	mavlink_msg_sensor_offsets_encode(system_id, component_id, &msg, &packet1);
	mavlink_msg_sensor_offsets_decode(&msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);

        memset(&packet2, 0, sizeof(packet2));
	mavlink_msg_sensor_offsets_pack(system_id, component_id, &msg , packet1.mag_ofs_x , packet1.mag_ofs_y , packet1.mag_ofs_z , packet1.mag_declination , packet1.raw_press , packet1.raw_temp , packet1.gyro_cal_x , packet1.gyro_cal_y , packet1.gyro_cal_z , packet1.accel_cal_x , packet1.accel_cal_y , packet1.accel_cal_z );
	mavlink_msg_sensor_offsets_decode(&msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);

        memset(&packet2, 0, sizeof(packet2));
	mavlink_msg_sensor_offsets_pack_chan(system_id, component_id, MAVLINK_COMM_0, &msg , packet1.mag_ofs_x , packet1.mag_ofs_y , packet1.mag_ofs_z , packet1.mag_declination , packet1.raw_press , packet1.raw_temp , packet1.gyro_cal_x , packet1.gyro_cal_y , packet1.gyro_cal_z , packet1.accel_cal_x , packet1.accel_cal_y , packet1.accel_cal_z );
	mavlink_msg_sensor_offsets_decode(&msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);

        memset(&packet2, 0, sizeof(packet2));
        mavlink_msg_to_send_buffer(buffer, &msg);
        for (i=0; i<mavlink_msg_get_send_buffer_length(&msg); i++) {
        	comm_send_ch(MAVLINK_COMM_0, buffer[i]);
        }
	mavlink_msg_sensor_offsets_decode(last_msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);
        
        memset(&packet2, 0, sizeof(packet2));
	mavlink_msg_sensor_offsets_send(MAVLINK_COMM_1 , packet1.mag_ofs_x , packet1.mag_ofs_y , packet1.mag_ofs_z , packet1.mag_declination , packet1.raw_press , packet1.raw_temp , packet1.gyro_cal_x , packet1.gyro_cal_y , packet1.gyro_cal_z , packet1.accel_cal_x , packet1.accel_cal_y , packet1.accel_cal_z );
	mavlink_msg_sensor_offsets_decode(last_msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);
}

static void mavlink_test_set_mag_offsets(uint8_t system_id, uint8_t component_id, mavlink_message_t *last_msg)
{
	mavlink_message_t msg;
        uint8_t buffer[MAVLINK_MAX_PACKET_LEN];
        uint16_t i;
	mavlink_set_mag_offsets_t packet_in = {
		17235,17339,17443,151,218
    };
	mavlink_set_mag_offsets_t packet1, packet2;
        memset(&packet1, 0, sizeof(packet1));
        	packet1.mag_ofs_x = packet_in.mag_ofs_x;
        	packet1.mag_ofs_y = packet_in.mag_ofs_y;
        	packet1.mag_ofs_z = packet_in.mag_ofs_z;
        	packet1.target_system = packet_in.target_system;
        	packet1.target_component = packet_in.target_component;
        
        

        memset(&packet2, 0, sizeof(packet2));
	mavlink_msg_set_mag_offsets_encode(system_id, component_id, &msg, &packet1);
	mavlink_msg_set_mag_offsets_decode(&msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);

        memset(&packet2, 0, sizeof(packet2));
	mavlink_msg_set_mag_offsets_pack(system_id, component_id, &msg , packet1.target_system , packet1.target_component , packet1.mag_ofs_x , packet1.mag_ofs_y , packet1.mag_ofs_z );
	mavlink_msg_set_mag_offsets_decode(&msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);

        memset(&packet2, 0, sizeof(packet2));
	mavlink_msg_set_mag_offsets_pack_chan(system_id, component_id, MAVLINK_COMM_0, &msg , packet1.target_system , packet1.target_component , packet1.mag_ofs_x , packet1.mag_ofs_y , packet1.mag_ofs_z );
	mavlink_msg_set_mag_offsets_decode(&msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);

        memset(&packet2, 0, sizeof(packet2));
        mavlink_msg_to_send_buffer(buffer, &msg);
        for (i=0; i<mavlink_msg_get_send_buffer_length(&msg); i++) {
        	comm_send_ch(MAVLINK_COMM_0, buffer[i]);
        }
	mavlink_msg_set_mag_offsets_decode(last_msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);
        
        memset(&packet2, 0, sizeof(packet2));
	mavlink_msg_set_mag_offsets_send(MAVLINK_COMM_1 , packet1.target_system , packet1.target_component , packet1.mag_ofs_x , packet1.mag_ofs_y , packet1.mag_ofs_z );
	mavlink_msg_set_mag_offsets_decode(last_msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);
}

static void mavlink_test_meminfo(uint8_t system_id, uint8_t component_id, mavlink_message_t *last_msg)
{
	mavlink_message_t msg;
        uint8_t buffer[MAVLINK_MAX_PACKET_LEN];
        uint16_t i;
	mavlink_meminfo_t packet_in = {
		17235,17339
    };
	mavlink_meminfo_t packet1, packet2;
        memset(&packet1, 0, sizeof(packet1));
        	packet1.brkval = packet_in.brkval;
        	packet1.freemem = packet_in.freemem;
        
        

        memset(&packet2, 0, sizeof(packet2));
	mavlink_msg_meminfo_encode(system_id, component_id, &msg, &packet1);
	mavlink_msg_meminfo_decode(&msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);

        memset(&packet2, 0, sizeof(packet2));
	mavlink_msg_meminfo_pack(system_id, component_id, &msg , packet1.brkval , packet1.freemem );
	mavlink_msg_meminfo_decode(&msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);

        memset(&packet2, 0, sizeof(packet2));
	mavlink_msg_meminfo_pack_chan(system_id, component_id, MAVLINK_COMM_0, &msg , packet1.brkval , packet1.freemem );
	mavlink_msg_meminfo_decode(&msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);

        memset(&packet2, 0, sizeof(packet2));
        mavlink_msg_to_send_buffer(buffer, &msg);
        for (i=0; i<mavlink_msg_get_send_buffer_length(&msg); i++) {
        	comm_send_ch(MAVLINK_COMM_0, buffer[i]);
        }
	mavlink_msg_meminfo_decode(last_msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);
        
        memset(&packet2, 0, sizeof(packet2));
	mavlink_msg_meminfo_send(MAVLINK_COMM_1 , packet1.brkval , packet1.freemem );
	mavlink_msg_meminfo_decode(last_msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);
}

static void mavlink_test_ap_adc(uint8_t system_id, uint8_t component_id, mavlink_message_t *last_msg)
{
	mavlink_message_t msg;
        uint8_t buffer[MAVLINK_MAX_PACKET_LEN];
        uint16_t i;
	mavlink_ap_adc_t packet_in = {
		17235,17339,17443,17547,17651,17755
    };
	mavlink_ap_adc_t packet1, packet2;
        memset(&packet1, 0, sizeof(packet1));
        	packet1.adc1 = packet_in.adc1;
        	packet1.adc2 = packet_in.adc2;
        	packet1.adc3 = packet_in.adc3;
        	packet1.adc4 = packet_in.adc4;
        	packet1.adc5 = packet_in.adc5;
        	packet1.adc6 = packet_in.adc6;
        
        

        memset(&packet2, 0, sizeof(packet2));
	mavlink_msg_ap_adc_encode(system_id, component_id, &msg, &packet1);
	mavlink_msg_ap_adc_decode(&msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);

        memset(&packet2, 0, sizeof(packet2));
	mavlink_msg_ap_adc_pack(system_id, component_id, &msg , packet1.adc1 , packet1.adc2 , packet1.adc3 , packet1.adc4 , packet1.adc5 , packet1.adc6 );
	mavlink_msg_ap_adc_decode(&msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);

        memset(&packet2, 0, sizeof(packet2));
	mavlink_msg_ap_adc_pack_chan(system_id, component_id, MAVLINK_COMM_0, &msg , packet1.adc1 , packet1.adc2 , packet1.adc3 , packet1.adc4 , packet1.adc5 , packet1.adc6 );
	mavlink_msg_ap_adc_decode(&msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);

        memset(&packet2, 0, sizeof(packet2));
        mavlink_msg_to_send_buffer(buffer, &msg);
        for (i=0; i<mavlink_msg_get_send_buffer_length(&msg); i++) {
        	comm_send_ch(MAVLINK_COMM_0, buffer[i]);
        }
	mavlink_msg_ap_adc_decode(last_msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);
        
        memset(&packet2, 0, sizeof(packet2));
	mavlink_msg_ap_adc_send(MAVLINK_COMM_1 , packet1.adc1 , packet1.adc2 , packet1.adc3 , packet1.adc4 , packet1.adc5 , packet1.adc6 );
	mavlink_msg_ap_adc_decode(last_msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);
}

static void mavlink_test_digicam_configure(uint8_t system_id, uint8_t component_id, mavlink_message_t *last_msg)
{
	mavlink_message_t msg;
        uint8_t buffer[MAVLINK_MAX_PACKET_LEN];
        uint16_t i;
	mavlink_digicam_configure_t packet_in = {
		17.0,17443,151,218,29,96,163,230,41,108,175
    };
	mavlink_digicam_configure_t packet1, packet2;
        memset(&packet1, 0, sizeof(packet1));
        	packet1.extra_value = packet_in.extra_value;
        	packet1.shutter_speed = packet_in.shutter_speed;
        	packet1.target_system = packet_in.target_system;
        	packet1.target_component = packet_in.target_component;
        	packet1.mode = packet_in.mode;
        	packet1.aperture = packet_in.aperture;
        	packet1.iso = packet_in.iso;
        	packet1.exposure_type = packet_in.exposure_type;
        	packet1.command_id = packet_in.command_id;
        	packet1.engine_cut_off = packet_in.engine_cut_off;
        	packet1.extra_param = packet_in.extra_param;
        
        

        memset(&packet2, 0, sizeof(packet2));
	mavlink_msg_digicam_configure_encode(system_id, component_id, &msg, &packet1);
	mavlink_msg_digicam_configure_decode(&msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);

        memset(&packet2, 0, sizeof(packet2));
	mavlink_msg_digicam_configure_pack(system_id, component_id, &msg , packet1.target_system , packet1.target_component , packet1.mode , packet1.shutter_speed , packet1.aperture , packet1.iso , packet1.exposure_type , packet1.command_id , packet1.engine_cut_off , packet1.extra_param , packet1.extra_value );
	mavlink_msg_digicam_configure_decode(&msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);

        memset(&packet2, 0, sizeof(packet2));
	mavlink_msg_digicam_configure_pack_chan(system_id, component_id, MAVLINK_COMM_0, &msg , packet1.target_system , packet1.target_component , packet1.mode , packet1.shutter_speed , packet1.aperture , packet1.iso , packet1.exposure_type , packet1.command_id , packet1.engine_cut_off , packet1.extra_param , packet1.extra_value );
	mavlink_msg_digicam_configure_decode(&msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);

        memset(&packet2, 0, sizeof(packet2));
        mavlink_msg_to_send_buffer(buffer, &msg);
        for (i=0; i<mavlink_msg_get_send_buffer_length(&msg); i++) {
        	comm_send_ch(MAVLINK_COMM_0, buffer[i]);
        }
	mavlink_msg_digicam_configure_decode(last_msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);
        
        memset(&packet2, 0, sizeof(packet2));
	mavlink_msg_digicam_configure_send(MAVLINK_COMM_1 , packet1.target_system , packet1.target_component , packet1.mode , packet1.shutter_speed , packet1.aperture , packet1.iso , packet1.exposure_type , packet1.command_id , packet1.engine_cut_off , packet1.extra_param , packet1.extra_value );
	mavlink_msg_digicam_configure_decode(last_msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);
}

static void mavlink_test_digicam_control(uint8_t system_id, uint8_t component_id, mavlink_message_t *last_msg)
{
	mavlink_message_t msg;
        uint8_t buffer[MAVLINK_MAX_PACKET_LEN];
        uint16_t i;
	mavlink_digicam_control_t packet_in = {
		17.0,17,84,151,218,29,96,163,230,41
    };
	mavlink_digicam_control_t packet1, packet2;
        memset(&packet1, 0, sizeof(packet1));
        	packet1.extra_value = packet_in.extra_value;
        	packet1.target_system = packet_in.target_system;
        	packet1.target_component = packet_in.target_component;
        	packet1.session = packet_in.session;
        	packet1.zoom_pos = packet_in.zoom_pos;
        	packet1.zoom_step = packet_in.zoom_step;
        	packet1.focus_lock = packet_in.focus_lock;
        	packet1.shot = packet_in.shot;
        	packet1.command_id = packet_in.command_id;
        	packet1.extra_param = packet_in.extra_param;
        
        

        memset(&packet2, 0, sizeof(packet2));
	mavlink_msg_digicam_control_encode(system_id, component_id, &msg, &packet1);
	mavlink_msg_digicam_control_decode(&msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);

        memset(&packet2, 0, sizeof(packet2));
	mavlink_msg_digicam_control_pack(system_id, component_id, &msg , packet1.target_system , packet1.target_component , packet1.session , packet1.zoom_pos , packet1.zoom_step , packet1.focus_lock , packet1.shot , packet1.command_id , packet1.extra_param , packet1.extra_value );
	mavlink_msg_digicam_control_decode(&msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);

        memset(&packet2, 0, sizeof(packet2));
	mavlink_msg_digicam_control_pack_chan(system_id, component_id, MAVLINK_COMM_0, &msg , packet1.target_system , packet1.target_component , packet1.session , packet1.zoom_pos , packet1.zoom_step , packet1.focus_lock , packet1.shot , packet1.command_id , packet1.extra_param , packet1.extra_value );
	mavlink_msg_digicam_control_decode(&msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);

        memset(&packet2, 0, sizeof(packet2));
        mavlink_msg_to_send_buffer(buffer, &msg);
        for (i=0; i<mavlink_msg_get_send_buffer_length(&msg); i++) {
        	comm_send_ch(MAVLINK_COMM_0, buffer[i]);
        }
	mavlink_msg_digicam_control_decode(last_msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);
        
        memset(&packet2, 0, sizeof(packet2));
	mavlink_msg_digicam_control_send(MAVLINK_COMM_1 , packet1.target_system , packet1.target_component , packet1.session , packet1.zoom_pos , packet1.zoom_step , packet1.focus_lock , packet1.shot , packet1.command_id , packet1.extra_param , packet1.extra_value );
	mavlink_msg_digicam_control_decode(last_msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);
}

static void mavlink_test_mount_configure(uint8_t system_id, uint8_t component_id, mavlink_message_t *last_msg)
{
	mavlink_message_t msg;
        uint8_t buffer[MAVLINK_MAX_PACKET_LEN];
        uint16_t i;
	mavlink_mount_configure_t packet_in = {
		5,72,139,206,17,84
    };
	mavlink_mount_configure_t packet1, packet2;
        memset(&packet1, 0, sizeof(packet1));
        	packet1.target_system = packet_in.target_system;
        	packet1.target_component = packet_in.target_component;
        	packet1.mount_mode = packet_in.mount_mode;
        	packet1.stab_roll = packet_in.stab_roll;
        	packet1.stab_pitch = packet_in.stab_pitch;
        	packet1.stab_yaw = packet_in.stab_yaw;
        
        

        memset(&packet2, 0, sizeof(packet2));
	mavlink_msg_mount_configure_encode(system_id, component_id, &msg, &packet1);
	mavlink_msg_mount_configure_decode(&msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);

        memset(&packet2, 0, sizeof(packet2));
	mavlink_msg_mount_configure_pack(system_id, component_id, &msg , packet1.target_system , packet1.target_component , packet1.mount_mode , packet1.stab_roll , packet1.stab_pitch , packet1.stab_yaw );
	mavlink_msg_mount_configure_decode(&msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);

        memset(&packet2, 0, sizeof(packet2));
	mavlink_msg_mount_configure_pack_chan(system_id, component_id, MAVLINK_COMM_0, &msg , packet1.target_system , packet1.target_component , packet1.mount_mode , packet1.stab_roll , packet1.stab_pitch , packet1.stab_yaw );
	mavlink_msg_mount_configure_decode(&msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);

        memset(&packet2, 0, sizeof(packet2));
        mavlink_msg_to_send_buffer(buffer, &msg);
        for (i=0; i<mavlink_msg_get_send_buffer_length(&msg); i++) {
        	comm_send_ch(MAVLINK_COMM_0, buffer[i]);
        }
	mavlink_msg_mount_configure_decode(last_msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);
        
        memset(&packet2, 0, sizeof(packet2));
	mavlink_msg_mount_configure_send(MAVLINK_COMM_1 , packet1.target_system , packet1.target_component , packet1.mount_mode , packet1.stab_roll , packet1.stab_pitch , packet1.stab_yaw );
	mavlink_msg_mount_configure_decode(last_msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);
}

static void mavlink_test_mount_control(uint8_t system_id, uint8_t component_id, mavlink_message_t *last_msg)
{
	mavlink_message_t msg;
        uint8_t buffer[MAVLINK_MAX_PACKET_LEN];
        uint16_t i;
	mavlink_mount_control_t packet_in = {
		963497464,963497672,963497880,41,108,175
    };
	mavlink_mount_control_t packet1, packet2;
        memset(&packet1, 0, sizeof(packet1));
        	packet1.input_a = packet_in.input_a;
        	packet1.input_b = packet_in.input_b;
        	packet1.input_c = packet_in.input_c;
        	packet1.target_system = packet_in.target_system;
        	packet1.target_component = packet_in.target_component;
        	packet1.save_position = packet_in.save_position;
        
        

        memset(&packet2, 0, sizeof(packet2));
	mavlink_msg_mount_control_encode(system_id, component_id, &msg, &packet1);
	mavlink_msg_mount_control_decode(&msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);

        memset(&packet2, 0, sizeof(packet2));
	mavlink_msg_mount_control_pack(system_id, component_id, &msg , packet1.target_system , packet1.target_component , packet1.input_a , packet1.input_b , packet1.input_c , packet1.save_position );
	mavlink_msg_mount_control_decode(&msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);

        memset(&packet2, 0, sizeof(packet2));
	mavlink_msg_mount_control_pack_chan(system_id, component_id, MAVLINK_COMM_0, &msg , packet1.target_system , packet1.target_component , packet1.input_a , packet1.input_b , packet1.input_c , packet1.save_position );
	mavlink_msg_mount_control_decode(&msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);

        memset(&packet2, 0, sizeof(packet2));
        mavlink_msg_to_send_buffer(buffer, &msg);
        for (i=0; i<mavlink_msg_get_send_buffer_length(&msg); i++) {
        	comm_send_ch(MAVLINK_COMM_0, buffer[i]);
        }
	mavlink_msg_mount_control_decode(last_msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);
        
        memset(&packet2, 0, sizeof(packet2));
	mavlink_msg_mount_control_send(MAVLINK_COMM_1 , packet1.target_system , packet1.target_component , packet1.input_a , packet1.input_b , packet1.input_c , packet1.save_position );
	mavlink_msg_mount_control_decode(last_msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);
}

static void mavlink_test_mount_status(uint8_t system_id, uint8_t component_id, mavlink_message_t *last_msg)
{
	mavlink_message_t msg;
        uint8_t buffer[MAVLINK_MAX_PACKET_LEN];
        uint16_t i;
	mavlink_mount_status_t packet_in = {
		963497464,963497672,963497880,41,108
    };
	mavlink_mount_status_t packet1, packet2;
        memset(&packet1, 0, sizeof(packet1));
        	packet1.pointing_a = packet_in.pointing_a;
        	packet1.pointing_b = packet_in.pointing_b;
        	packet1.pointing_c = packet_in.pointing_c;
        	packet1.target_system = packet_in.target_system;
        	packet1.target_component = packet_in.target_component;
        
        

        memset(&packet2, 0, sizeof(packet2));
	mavlink_msg_mount_status_encode(system_id, component_id, &msg, &packet1);
	mavlink_msg_mount_status_decode(&msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);

        memset(&packet2, 0, sizeof(packet2));
	mavlink_msg_mount_status_pack(system_id, component_id, &msg , packet1.target_system , packet1.target_component , packet1.pointing_a , packet1.pointing_b , packet1.pointing_c );
	mavlink_msg_mount_status_decode(&msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);

        memset(&packet2, 0, sizeof(packet2));
	mavlink_msg_mount_status_pack_chan(system_id, component_id, MAVLINK_COMM_0, &msg , packet1.target_system , packet1.target_component , packet1.pointing_a , packet1.pointing_b , packet1.pointing_c );
	mavlink_msg_mount_status_decode(&msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);

        memset(&packet2, 0, sizeof(packet2));
        mavlink_msg_to_send_buffer(buffer, &msg);
        for (i=0; i<mavlink_msg_get_send_buffer_length(&msg); i++) {
        	comm_send_ch(MAVLINK_COMM_0, buffer[i]);
        }
	mavlink_msg_mount_status_decode(last_msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);
        
        memset(&packet2, 0, sizeof(packet2));
	mavlink_msg_mount_status_send(MAVLINK_COMM_1 , packet1.target_system , packet1.target_component , packet1.pointing_a , packet1.pointing_b , packet1.pointing_c );
	mavlink_msg_mount_status_decode(last_msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);
}

static void mavlink_test_fence_point(uint8_t system_id, uint8_t component_id, mavlink_message_t *last_msg)
{
	mavlink_message_t msg;
        uint8_t buffer[MAVLINK_MAX_PACKET_LEN];
        uint16_t i;
	mavlink_fence_point_t packet_in = {
		17.0,45.0,29,96,163,230
    };
	mavlink_fence_point_t packet1, packet2;
        memset(&packet1, 0, sizeof(packet1));
        	packet1.lat = packet_in.lat;
        	packet1.lng = packet_in.lng;
        	packet1.target_system = packet_in.target_system;
        	packet1.target_component = packet_in.target_component;
        	packet1.idx = packet_in.idx;
        	packet1.count = packet_in.count;
        
        

        memset(&packet2, 0, sizeof(packet2));
	mavlink_msg_fence_point_encode(system_id, component_id, &msg, &packet1);
	mavlink_msg_fence_point_decode(&msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);

        memset(&packet2, 0, sizeof(packet2));
	mavlink_msg_fence_point_pack(system_id, component_id, &msg , packet1.target_system , packet1.target_component , packet1.idx , packet1.count , packet1.lat , packet1.lng );
	mavlink_msg_fence_point_decode(&msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);

        memset(&packet2, 0, sizeof(packet2));
	mavlink_msg_fence_point_pack_chan(system_id, component_id, MAVLINK_COMM_0, &msg , packet1.target_system , packet1.target_component , packet1.idx , packet1.count , packet1.lat , packet1.lng );
	mavlink_msg_fence_point_decode(&msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);

        memset(&packet2, 0, sizeof(packet2));
        mavlink_msg_to_send_buffer(buffer, &msg);
        for (i=0; i<mavlink_msg_get_send_buffer_length(&msg); i++) {
        	comm_send_ch(MAVLINK_COMM_0, buffer[i]);
        }
	mavlink_msg_fence_point_decode(last_msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);
        
        memset(&packet2, 0, sizeof(packet2));
	mavlink_msg_fence_point_send(MAVLINK_COMM_1 , packet1.target_system , packet1.target_component , packet1.idx , packet1.count , packet1.lat , packet1.lng );
	mavlink_msg_fence_point_decode(last_msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);
}

static void mavlink_test_fence_fetch_point(uint8_t system_id, uint8_t component_id, mavlink_message_t *last_msg)
{
	mavlink_message_t msg;
        uint8_t buffer[MAVLINK_MAX_PACKET_LEN];
        uint16_t i;
	mavlink_fence_fetch_point_t packet_in = {
		5,72,139
    };
	mavlink_fence_fetch_point_t packet1, packet2;
        memset(&packet1, 0, sizeof(packet1));
        	packet1.target_system = packet_in.target_system;
        	packet1.target_component = packet_in.target_component;
        	packet1.idx = packet_in.idx;
        
        

        memset(&packet2, 0, sizeof(packet2));
	mavlink_msg_fence_fetch_point_encode(system_id, component_id, &msg, &packet1);
	mavlink_msg_fence_fetch_point_decode(&msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);

        memset(&packet2, 0, sizeof(packet2));
	mavlink_msg_fence_fetch_point_pack(system_id, component_id, &msg , packet1.target_system , packet1.target_component , packet1.idx );
	mavlink_msg_fence_fetch_point_decode(&msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);

        memset(&packet2, 0, sizeof(packet2));
	mavlink_msg_fence_fetch_point_pack_chan(system_id, component_id, MAVLINK_COMM_0, &msg , packet1.target_system , packet1.target_component , packet1.idx );
	mavlink_msg_fence_fetch_point_decode(&msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);

        memset(&packet2, 0, sizeof(packet2));
        mavlink_msg_to_send_buffer(buffer, &msg);
        for (i=0; i<mavlink_msg_get_send_buffer_length(&msg); i++) {
        	comm_send_ch(MAVLINK_COMM_0, buffer[i]);
        }
	mavlink_msg_fence_fetch_point_decode(last_msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);
        
        memset(&packet2, 0, sizeof(packet2));
	mavlink_msg_fence_fetch_point_send(MAVLINK_COMM_1 , packet1.target_system , packet1.target_component , packet1.idx );
	mavlink_msg_fence_fetch_point_decode(last_msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);
}

static void mavlink_test_fence_status(uint8_t system_id, uint8_t component_id, mavlink_message_t *last_msg)
{
	mavlink_message_t msg;
        uint8_t buffer[MAVLINK_MAX_PACKET_LEN];
        uint16_t i;
	mavlink_fence_status_t packet_in = {
		963497464,17443,151,218
    };
	mavlink_fence_status_t packet1, packet2;
        memset(&packet1, 0, sizeof(packet1));
        	packet1.breach_time = packet_in.breach_time;
        	packet1.breach_count = packet_in.breach_count;
        	packet1.breach_status = packet_in.breach_status;
        	packet1.breach_type = packet_in.breach_type;
        
        

        memset(&packet2, 0, sizeof(packet2));
	mavlink_msg_fence_status_encode(system_id, component_id, &msg, &packet1);
	mavlink_msg_fence_status_decode(&msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);

        memset(&packet2, 0, sizeof(packet2));
	mavlink_msg_fence_status_pack(system_id, component_id, &msg , packet1.breach_status , packet1.breach_count , packet1.breach_type , packet1.breach_time );
	mavlink_msg_fence_status_decode(&msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);

        memset(&packet2, 0, sizeof(packet2));
	mavlink_msg_fence_status_pack_chan(system_id, component_id, MAVLINK_COMM_0, &msg , packet1.breach_status , packet1.breach_count , packet1.breach_type , packet1.breach_time );
	mavlink_msg_fence_status_decode(&msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);

        memset(&packet2, 0, sizeof(packet2));
        mavlink_msg_to_send_buffer(buffer, &msg);
        for (i=0; i<mavlink_msg_get_send_buffer_length(&msg); i++) {
        	comm_send_ch(MAVLINK_COMM_0, buffer[i]);
        }
	mavlink_msg_fence_status_decode(last_msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);
        
        memset(&packet2, 0, sizeof(packet2));
	mavlink_msg_fence_status_send(MAVLINK_COMM_1 , packet1.breach_status , packet1.breach_count , packet1.breach_type , packet1.breach_time );
	mavlink_msg_fence_status_decode(last_msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);
}

static void mavlink_test_ahrs(uint8_t system_id, uint8_t component_id, mavlink_message_t *last_msg)
{
	mavlink_message_t msg;
        uint8_t buffer[MAVLINK_MAX_PACKET_LEN];
        uint16_t i;
	mavlink_ahrs_t packet_in = {
		17.0,45.0,73.0,101.0,129.0,157.0,185.0
    };
	mavlink_ahrs_t packet1, packet2;
        memset(&packet1, 0, sizeof(packet1));
        	packet1.omegaIx = packet_in.omegaIx;
        	packet1.omegaIy = packet_in.omegaIy;
        	packet1.omegaIz = packet_in.omegaIz;
        	packet1.accel_weight = packet_in.accel_weight;
        	packet1.renorm_val = packet_in.renorm_val;
        	packet1.error_rp = packet_in.error_rp;
        	packet1.error_yaw = packet_in.error_yaw;
        
        

        memset(&packet2, 0, sizeof(packet2));
	mavlink_msg_ahrs_encode(system_id, component_id, &msg, &packet1);
	mavlink_msg_ahrs_decode(&msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);

        memset(&packet2, 0, sizeof(packet2));
	mavlink_msg_ahrs_pack(system_id, component_id, &msg , packet1.omegaIx , packet1.omegaIy , packet1.omegaIz , packet1.accel_weight , packet1.renorm_val , packet1.error_rp , packet1.error_yaw );
	mavlink_msg_ahrs_decode(&msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);

        memset(&packet2, 0, sizeof(packet2));
	mavlink_msg_ahrs_pack_chan(system_id, component_id, MAVLINK_COMM_0, &msg , packet1.omegaIx , packet1.omegaIy , packet1.omegaIz , packet1.accel_weight , packet1.renorm_val , packet1.error_rp , packet1.error_yaw );
	mavlink_msg_ahrs_decode(&msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);

        memset(&packet2, 0, sizeof(packet2));
        mavlink_msg_to_send_buffer(buffer, &msg);
        for (i=0; i<mavlink_msg_get_send_buffer_length(&msg); i++) {
        	comm_send_ch(MAVLINK_COMM_0, buffer[i]);
        }
	mavlink_msg_ahrs_decode(last_msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);
        
        memset(&packet2, 0, sizeof(packet2));
	mavlink_msg_ahrs_send(MAVLINK_COMM_1 , packet1.omegaIx , packet1.omegaIy , packet1.omegaIz , packet1.accel_weight , packet1.renorm_val , packet1.error_rp , packet1.error_yaw );
	mavlink_msg_ahrs_decode(last_msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);
}

static void mavlink_test_simstate(uint8_t system_id, uint8_t component_id, mavlink_message_t *last_msg)
{
	mavlink_message_t msg;
        uint8_t buffer[MAVLINK_MAX_PACKET_LEN];
        uint16_t i;
	mavlink_simstate_t packet_in = {
		17.0,45.0,73.0,101.0,129.0,157.0,185.0,213.0,241.0,963499336,963499544
    };
	mavlink_simstate_t packet1, packet2;
        memset(&packet1, 0, sizeof(packet1));
        	packet1.roll = packet_in.roll;
        	packet1.pitch = packet_in.pitch;
        	packet1.yaw = packet_in.yaw;
        	packet1.xacc = packet_in.xacc;
        	packet1.yacc = packet_in.yacc;
        	packet1.zacc = packet_in.zacc;
        	packet1.xgyro = packet_in.xgyro;
        	packet1.ygyro = packet_in.ygyro;
        	packet1.zgyro = packet_in.zgyro;
        	packet1.lat = packet_in.lat;
        	packet1.lng = packet_in.lng;
        
        

        memset(&packet2, 0, sizeof(packet2));
	mavlink_msg_simstate_encode(system_id, component_id, &msg, &packet1);
	mavlink_msg_simstate_decode(&msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);

        memset(&packet2, 0, sizeof(packet2));
	mavlink_msg_simstate_pack(system_id, component_id, &msg , packet1.roll , packet1.pitch , packet1.yaw , packet1.xacc , packet1.yacc , packet1.zacc , packet1.xgyro , packet1.ygyro , packet1.zgyro , packet1.lat , packet1.lng );
	mavlink_msg_simstate_decode(&msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);

        memset(&packet2, 0, sizeof(packet2));
	mavlink_msg_simstate_pack_chan(system_id, component_id, MAVLINK_COMM_0, &msg , packet1.roll , packet1.pitch , packet1.yaw , packet1.xacc , packet1.yacc , packet1.zacc , packet1.xgyro , packet1.ygyro , packet1.zgyro , packet1.lat , packet1.lng );
	mavlink_msg_simstate_decode(&msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);

        memset(&packet2, 0, sizeof(packet2));
        mavlink_msg_to_send_buffer(buffer, &msg);
        for (i=0; i<mavlink_msg_get_send_buffer_length(&msg); i++) {
        	comm_send_ch(MAVLINK_COMM_0, buffer[i]);
        }
	mavlink_msg_simstate_decode(last_msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);
        
        memset(&packet2, 0, sizeof(packet2));
	mavlink_msg_simstate_send(MAVLINK_COMM_1 , packet1.roll , packet1.pitch , packet1.yaw , packet1.xacc , packet1.yacc , packet1.zacc , packet1.xgyro , packet1.ygyro , packet1.zgyro , packet1.lat , packet1.lng );
	mavlink_msg_simstate_decode(last_msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);
}

static void mavlink_test_hwstatus(uint8_t system_id, uint8_t component_id, mavlink_message_t *last_msg)
{
	mavlink_message_t msg;
        uint8_t buffer[MAVLINK_MAX_PACKET_LEN];
        uint16_t i;
	mavlink_hwstatus_t packet_in = {
		17235,139
    };
	mavlink_hwstatus_t packet1, packet2;
        memset(&packet1, 0, sizeof(packet1));
        	packet1.Vcc = packet_in.Vcc;
        	packet1.I2Cerr = packet_in.I2Cerr;
        
        

        memset(&packet2, 0, sizeof(packet2));
	mavlink_msg_hwstatus_encode(system_id, component_id, &msg, &packet1);
	mavlink_msg_hwstatus_decode(&msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);

        memset(&packet2, 0, sizeof(packet2));
	mavlink_msg_hwstatus_pack(system_id, component_id, &msg , packet1.Vcc , packet1.I2Cerr );
	mavlink_msg_hwstatus_decode(&msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);

        memset(&packet2, 0, sizeof(packet2));
	mavlink_msg_hwstatus_pack_chan(system_id, component_id, MAVLINK_COMM_0, &msg , packet1.Vcc , packet1.I2Cerr );
	mavlink_msg_hwstatus_decode(&msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);

        memset(&packet2, 0, sizeof(packet2));
        mavlink_msg_to_send_buffer(buffer, &msg);
        for (i=0; i<mavlink_msg_get_send_buffer_length(&msg); i++) {
        	comm_send_ch(MAVLINK_COMM_0, buffer[i]);
        }
	mavlink_msg_hwstatus_decode(last_msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);
        
        memset(&packet2, 0, sizeof(packet2));
	mavlink_msg_hwstatus_send(MAVLINK_COMM_1 , packet1.Vcc , packet1.I2Cerr );
	mavlink_msg_hwstatus_decode(last_msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);
}

static void mavlink_test_radio(uint8_t system_id, uint8_t component_id, mavlink_message_t *last_msg)
{
	mavlink_message_t msg;
        uint8_t buffer[MAVLINK_MAX_PACKET_LEN];
        uint16_t i;
	mavlink_radio_t packet_in = {
		17235,17339,17,84,151,218,29
    };
	mavlink_radio_t packet1, packet2;
        memset(&packet1, 0, sizeof(packet1));
        	packet1.rxerrors = packet_in.rxerrors;
        	packet1.fixed = packet_in.fixed;
        	packet1.rssi = packet_in.rssi;
        	packet1.remrssi = packet_in.remrssi;
        	packet1.txbuf = packet_in.txbuf;
        	packet1.noise = packet_in.noise;
        	packet1.remnoise = packet_in.remnoise;
        
        

        memset(&packet2, 0, sizeof(packet2));
	mavlink_msg_radio_encode(system_id, component_id, &msg, &packet1);
	mavlink_msg_radio_decode(&msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);

        memset(&packet2, 0, sizeof(packet2));
	mavlink_msg_radio_pack(system_id, component_id, &msg , packet1.rssi , packet1.remrssi , packet1.txbuf , packet1.noise , packet1.remnoise , packet1.rxerrors , packet1.fixed );
	mavlink_msg_radio_decode(&msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);

        memset(&packet2, 0, sizeof(packet2));
	mavlink_msg_radio_pack_chan(system_id, component_id, MAVLINK_COMM_0, &msg , packet1.rssi , packet1.remrssi , packet1.txbuf , packet1.noise , packet1.remnoise , packet1.rxerrors , packet1.fixed );
	mavlink_msg_radio_decode(&msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);

        memset(&packet2, 0, sizeof(packet2));
        mavlink_msg_to_send_buffer(buffer, &msg);
        for (i=0; i<mavlink_msg_get_send_buffer_length(&msg); i++) {
        	comm_send_ch(MAVLINK_COMM_0, buffer[i]);
        }
	mavlink_msg_radio_decode(last_msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);
        
        memset(&packet2, 0, sizeof(packet2));
	mavlink_msg_radio_send(MAVLINK_COMM_1 , packet1.rssi , packet1.remrssi , packet1.txbuf , packet1.noise , packet1.remnoise , packet1.rxerrors , packet1.fixed );
	mavlink_msg_radio_decode(last_msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);
}

static void mavlink_test_limits_status(uint8_t system_id, uint8_t component_id, mavlink_message_t *last_msg)
{
	mavlink_message_t msg;
        uint8_t buffer[MAVLINK_MAX_PACKET_LEN];
        uint16_t i;
	mavlink_limits_status_t packet_in = {
		963497464,963497672,963497880,963498088,18067,187,254,65,132
    };
	mavlink_limits_status_t packet1, packet2;
        memset(&packet1, 0, sizeof(packet1));
        	packet1.last_trigger = packet_in.last_trigger;
        	packet1.last_action = packet_in.last_action;
        	packet1.last_recovery = packet_in.last_recovery;
        	packet1.last_clear = packet_in.last_clear;
        	packet1.breach_count = packet_in.breach_count;
        	packet1.limits_state = packet_in.limits_state;
        	packet1.mods_enabled = packet_in.mods_enabled;
        	packet1.mods_required = packet_in.mods_required;
        	packet1.mods_triggered = packet_in.mods_triggered;
        
        

        memset(&packet2, 0, sizeof(packet2));
	mavlink_msg_limits_status_encode(system_id, component_id, &msg, &packet1);
	mavlink_msg_limits_status_decode(&msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);

        memset(&packet2, 0, sizeof(packet2));
	mavlink_msg_limits_status_pack(system_id, component_id, &msg , packet1.limits_state , packet1.last_trigger , packet1.last_action , packet1.last_recovery , packet1.last_clear , packet1.breach_count , packet1.mods_enabled , packet1.mods_required , packet1.mods_triggered );
	mavlink_msg_limits_status_decode(&msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);

        memset(&packet2, 0, sizeof(packet2));
	mavlink_msg_limits_status_pack_chan(system_id, component_id, MAVLINK_COMM_0, &msg , packet1.limits_state , packet1.last_trigger , packet1.last_action , packet1.last_recovery , packet1.last_clear , packet1.breach_count , packet1.mods_enabled , packet1.mods_required , packet1.mods_triggered );
	mavlink_msg_limits_status_decode(&msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);

        memset(&packet2, 0, sizeof(packet2));
        mavlink_msg_to_send_buffer(buffer, &msg);
        for (i=0; i<mavlink_msg_get_send_buffer_length(&msg); i++) {
        	comm_send_ch(MAVLINK_COMM_0, buffer[i]);
        }
	mavlink_msg_limits_status_decode(last_msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);
        
        memset(&packet2, 0, sizeof(packet2));
	mavlink_msg_limits_status_send(MAVLINK_COMM_1 , packet1.limits_state , packet1.last_trigger , packet1.last_action , packet1.last_recovery , packet1.last_clear , packet1.breach_count , packet1.mods_enabled , packet1.mods_required , packet1.mods_triggered );
	mavlink_msg_limits_status_decode(last_msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);
}

static void mavlink_test_wind(uint8_t system_id, uint8_t component_id, mavlink_message_t *last_msg)
{
	mavlink_message_t msg;
        uint8_t buffer[MAVLINK_MAX_PACKET_LEN];
        uint16_t i;
	mavlink_wind_t packet_in = {
		17.0,45.0,73.0
    };
	mavlink_wind_t packet1, packet2;
        memset(&packet1, 0, sizeof(packet1));
        	packet1.direction = packet_in.direction;
        	packet1.speed = packet_in.speed;
        	packet1.speed_z = packet_in.speed_z;
        
        

        memset(&packet2, 0, sizeof(packet2));
	mavlink_msg_wind_encode(system_id, component_id, &msg, &packet1);
	mavlink_msg_wind_decode(&msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);

        memset(&packet2, 0, sizeof(packet2));
	mavlink_msg_wind_pack(system_id, component_id, &msg , packet1.direction , packet1.speed , packet1.speed_z );
	mavlink_msg_wind_decode(&msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);

        memset(&packet2, 0, sizeof(packet2));
	mavlink_msg_wind_pack_chan(system_id, component_id, MAVLINK_COMM_0, &msg , packet1.direction , packet1.speed , packet1.speed_z );
	mavlink_msg_wind_decode(&msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);

        memset(&packet2, 0, sizeof(packet2));
        mavlink_msg_to_send_buffer(buffer, &msg);
        for (i=0; i<mavlink_msg_get_send_buffer_length(&msg); i++) {
        	comm_send_ch(MAVLINK_COMM_0, buffer[i]);
        }
	mavlink_msg_wind_decode(last_msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);
        
        memset(&packet2, 0, sizeof(packet2));
	mavlink_msg_wind_send(MAVLINK_COMM_1 , packet1.direction , packet1.speed , packet1.speed_z );
	mavlink_msg_wind_decode(last_msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);
}

static void mavlink_test_data16(uint8_t system_id, uint8_t component_id, mavlink_message_t *last_msg)
{
	mavlink_message_t msg;
        uint8_t buffer[MAVLINK_MAX_PACKET_LEN];
        uint16_t i;
	mavlink_data16_t packet_in = {
		5,72,{ 139, 140, 141, 142, 143, 144, 145, 146, 147, 148, 149, 150, 151, 152, 153, 154 }
    };
	mavlink_data16_t packet1, packet2;
        memset(&packet1, 0, sizeof(packet1));
        	packet1.type = packet_in.type;
        	packet1.len = packet_in.len;
        
        	mav_array_memcpy(packet1.data, packet_in.data, sizeof(uint8_t)*16);
        

        memset(&packet2, 0, sizeof(packet2));
	mavlink_msg_data16_encode(system_id, component_id, &msg, &packet1);
	mavlink_msg_data16_decode(&msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);

        memset(&packet2, 0, sizeof(packet2));
	mavlink_msg_data16_pack(system_id, component_id, &msg , packet1.type , packet1.len , packet1.data );
	mavlink_msg_data16_decode(&msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);

        memset(&packet2, 0, sizeof(packet2));
	mavlink_msg_data16_pack_chan(system_id, component_id, MAVLINK_COMM_0, &msg , packet1.type , packet1.len , packet1.data );
	mavlink_msg_data16_decode(&msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);

        memset(&packet2, 0, sizeof(packet2));
        mavlink_msg_to_send_buffer(buffer, &msg);
        for (i=0; i<mavlink_msg_get_send_buffer_length(&msg); i++) {
        	comm_send_ch(MAVLINK_COMM_0, buffer[i]);
        }
	mavlink_msg_data16_decode(last_msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);
        
        memset(&packet2, 0, sizeof(packet2));
	mavlink_msg_data16_send(MAVLINK_COMM_1 , packet1.type , packet1.len , packet1.data );
	mavlink_msg_data16_decode(last_msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);
}

static void mavlink_test_data32(uint8_t system_id, uint8_t component_id, mavlink_message_t *last_msg)
{
	mavlink_message_t msg;
        uint8_t buffer[MAVLINK_MAX_PACKET_LEN];
        uint16_t i;
	mavlink_data32_t packet_in = {
		5,72,{ 139, 140, 141, 142, 143, 144, 145, 146, 147, 148, 149, 150, 151, 152, 153, 154, 155, 156, 157, 158, 159, 160, 161, 162, 163, 164, 165, 166, 167, 168, 169, 170 }
    };
	mavlink_data32_t packet1, packet2;
        memset(&packet1, 0, sizeof(packet1));
        	packet1.type = packet_in.type;
        	packet1.len = packet_in.len;
        
        	mav_array_memcpy(packet1.data, packet_in.data, sizeof(uint8_t)*32);
        

        memset(&packet2, 0, sizeof(packet2));
	mavlink_msg_data32_encode(system_id, component_id, &msg, &packet1);
	mavlink_msg_data32_decode(&msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);

        memset(&packet2, 0, sizeof(packet2));
	mavlink_msg_data32_pack(system_id, component_id, &msg , packet1.type , packet1.len , packet1.data );
	mavlink_msg_data32_decode(&msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);

        memset(&packet2, 0, sizeof(packet2));
	mavlink_msg_data32_pack_chan(system_id, component_id, MAVLINK_COMM_0, &msg , packet1.type , packet1.len , packet1.data );
	mavlink_msg_data32_decode(&msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);

        memset(&packet2, 0, sizeof(packet2));
        mavlink_msg_to_send_buffer(buffer, &msg);
        for (i=0; i<mavlink_msg_get_send_buffer_length(&msg); i++) {
        	comm_send_ch(MAVLINK_COMM_0, buffer[i]);
        }
	mavlink_msg_data32_decode(last_msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);
        
        memset(&packet2, 0, sizeof(packet2));
	mavlink_msg_data32_send(MAVLINK_COMM_1 , packet1.type , packet1.len , packet1.data );
	mavlink_msg_data32_decode(last_msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);
}

static void mavlink_test_data64(uint8_t system_id, uint8_t component_id, mavlink_message_t *last_msg)
{
	mavlink_message_t msg;
        uint8_t buffer[MAVLINK_MAX_PACKET_LEN];
        uint16_t i;
	mavlink_data64_t packet_in = {
		5,72,{ 139, 140, 141, 142, 143, 144, 145, 146, 147, 148, 149, 150, 151, 152, 153, 154, 155, 156, 157, 158, 159, 160, 161, 162, 163, 164, 165, 166, 167, 168, 169, 170, 171, 172, 173, 174, 175, 176, 177, 178, 179, 180, 181, 182, 183, 184, 185, 186, 187, 188, 189, 190, 191, 192, 193, 194, 195, 196, 197, 198, 199, 200, 201, 202 }
    };
	mavlink_data64_t packet1, packet2;
        memset(&packet1, 0, sizeof(packet1));
        	packet1.type = packet_in.type;
        	packet1.len = packet_in.len;
        
        	mav_array_memcpy(packet1.data, packet_in.data, sizeof(uint8_t)*64);
        

        memset(&packet2, 0, sizeof(packet2));
	mavlink_msg_data64_encode(system_id, component_id, &msg, &packet1);
	mavlink_msg_data64_decode(&msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);

        memset(&packet2, 0, sizeof(packet2));
	mavlink_msg_data64_pack(system_id, component_id, &msg , packet1.type , packet1.len , packet1.data );
	mavlink_msg_data64_decode(&msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);

        memset(&packet2, 0, sizeof(packet2));
	mavlink_msg_data64_pack_chan(system_id, component_id, MAVLINK_COMM_0, &msg , packet1.type , packet1.len , packet1.data );
	mavlink_msg_data64_decode(&msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);

        memset(&packet2, 0, sizeof(packet2));
        mavlink_msg_to_send_buffer(buffer, &msg);
        for (i=0; i<mavlink_msg_get_send_buffer_length(&msg); i++) {
        	comm_send_ch(MAVLINK_COMM_0, buffer[i]);
        }
	mavlink_msg_data64_decode(last_msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);
        
        memset(&packet2, 0, sizeof(packet2));
	mavlink_msg_data64_send(MAVLINK_COMM_1 , packet1.type , packet1.len , packet1.data );
	mavlink_msg_data64_decode(last_msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);
}

static void mavlink_test_data96(uint8_t system_id, uint8_t component_id, mavlink_message_t *last_msg)
{
	mavlink_message_t msg;
        uint8_t buffer[MAVLINK_MAX_PACKET_LEN];
        uint16_t i;
	mavlink_data96_t packet_in = {
		5,72,{ 139, 140, 141, 142, 143, 144, 145, 146, 147, 148, 149, 150, 151, 152, 153, 154, 155, 156, 157, 158, 159, 160, 161, 162, 163, 164, 165, 166, 167, 168, 169, 170, 171, 172, 173, 174, 175, 176, 177, 178, 179, 180, 181, 182, 183, 184, 185, 186, 187, 188, 189, 190, 191, 192, 193, 194, 195, 196, 197, 198, 199, 200, 201, 202, 203, 204, 205, 206, 207, 208, 209, 210, 211, 212, 213, 214, 215, 216, 217, 218, 219, 220, 221, 222, 223, 224, 225, 226, 227, 228, 229, 230, 231, 232, 233, 234 }
    };
	mavlink_data96_t packet1, packet2;
        memset(&packet1, 0, sizeof(packet1));
        	packet1.type = packet_in.type;
        	packet1.len = packet_in.len;
        
        	mav_array_memcpy(packet1.data, packet_in.data, sizeof(uint8_t)*96);
        

        memset(&packet2, 0, sizeof(packet2));
	mavlink_msg_data96_encode(system_id, component_id, &msg, &packet1);
	mavlink_msg_data96_decode(&msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);

        memset(&packet2, 0, sizeof(packet2));
	mavlink_msg_data96_pack(system_id, component_id, &msg , packet1.type , packet1.len , packet1.data );
	mavlink_msg_data96_decode(&msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);

        memset(&packet2, 0, sizeof(packet2));
	mavlink_msg_data96_pack_chan(system_id, component_id, MAVLINK_COMM_0, &msg , packet1.type , packet1.len , packet1.data );
	mavlink_msg_data96_decode(&msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);

        memset(&packet2, 0, sizeof(packet2));
        mavlink_msg_to_send_buffer(buffer, &msg);
        for (i=0; i<mavlink_msg_get_send_buffer_length(&msg); i++) {
        	comm_send_ch(MAVLINK_COMM_0, buffer[i]);
        }
	mavlink_msg_data96_decode(last_msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);
        
        memset(&packet2, 0, sizeof(packet2));
	mavlink_msg_data96_send(MAVLINK_COMM_1 , packet1.type , packet1.len , packet1.data );
	mavlink_msg_data96_decode(last_msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);
}

static void mavlink_test_rangefinder(uint8_t system_id, uint8_t component_id, mavlink_message_t *last_msg)
{
	mavlink_message_t msg;
        uint8_t buffer[MAVLINK_MAX_PACKET_LEN];
        uint16_t i;
	mavlink_rangefinder_t packet_in = {
		17.0,45.0
    };
	mavlink_rangefinder_t packet1, packet2;
        memset(&packet1, 0, sizeof(packet1));
        	packet1.distance = packet_in.distance;
        	packet1.voltage = packet_in.voltage;
        
        

        memset(&packet2, 0, sizeof(packet2));
	mavlink_msg_rangefinder_encode(system_id, component_id, &msg, &packet1);
	mavlink_msg_rangefinder_decode(&msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);

        memset(&packet2, 0, sizeof(packet2));
	mavlink_msg_rangefinder_pack(system_id, component_id, &msg , packet1.distance , packet1.voltage );
	mavlink_msg_rangefinder_decode(&msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);

        memset(&packet2, 0, sizeof(packet2));
	mavlink_msg_rangefinder_pack_chan(system_id, component_id, MAVLINK_COMM_0, &msg , packet1.distance , packet1.voltage );
	mavlink_msg_rangefinder_decode(&msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);

        memset(&packet2, 0, sizeof(packet2));
        mavlink_msg_to_send_buffer(buffer, &msg);
        for (i=0; i<mavlink_msg_get_send_buffer_length(&msg); i++) {
        	comm_send_ch(MAVLINK_COMM_0, buffer[i]);
        }
	mavlink_msg_rangefinder_decode(last_msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);
        
        memset(&packet2, 0, sizeof(packet2));
	mavlink_msg_rangefinder_send(MAVLINK_COMM_1 , packet1.distance , packet1.voltage );
	mavlink_msg_rangefinder_decode(last_msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);
}

static void mavlink_test_airspeed_autocal(uint8_t system_id, uint8_t component_id, mavlink_message_t *last_msg)
{
	mavlink_message_t msg;
        uint8_t buffer[MAVLINK_MAX_PACKET_LEN];
        uint16_t i;
	mavlink_airspeed_autocal_t packet_in = {
		17.0,45.0,73.0,101.0,129.0,157.0,185.0,213.0,241.0,269.0,297.0,325.0
    };
	mavlink_airspeed_autocal_t packet1, packet2;
        memset(&packet1, 0, sizeof(packet1));
        	packet1.vx = packet_in.vx;
        	packet1.vy = packet_in.vy;
        	packet1.vz = packet_in.vz;
        	packet1.diff_pressure = packet_in.diff_pressure;
        	packet1.EAS2TAS = packet_in.EAS2TAS;
        	packet1.ratio = packet_in.ratio;
        	packet1.state_x = packet_in.state_x;
        	packet1.state_y = packet_in.state_y;
        	packet1.state_z = packet_in.state_z;
        	packet1.Pax = packet_in.Pax;
        	packet1.Pby = packet_in.Pby;
        	packet1.Pcz = packet_in.Pcz;
        
        

        memset(&packet2, 0, sizeof(packet2));
	mavlink_msg_airspeed_autocal_encode(system_id, component_id, &msg, &packet1);
	mavlink_msg_airspeed_autocal_decode(&msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);

        memset(&packet2, 0, sizeof(packet2));
	mavlink_msg_airspeed_autocal_pack(system_id, component_id, &msg , packet1.vx , packet1.vy , packet1.vz , packet1.diff_pressure , packet1.EAS2TAS , packet1.ratio , packet1.state_x , packet1.state_y , packet1.state_z , packet1.Pax , packet1.Pby , packet1.Pcz );
	mavlink_msg_airspeed_autocal_decode(&msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);

        memset(&packet2, 0, sizeof(packet2));
	mavlink_msg_airspeed_autocal_pack_chan(system_id, component_id, MAVLINK_COMM_0, &msg , packet1.vx , packet1.vy , packet1.vz , packet1.diff_pressure , packet1.EAS2TAS , packet1.ratio , packet1.state_x , packet1.state_y , packet1.state_z , packet1.Pax , packet1.Pby , packet1.Pcz );
	mavlink_msg_airspeed_autocal_decode(&msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);

        memset(&packet2, 0, sizeof(packet2));
        mavlink_msg_to_send_buffer(buffer, &msg);
        for (i=0; i<mavlink_msg_get_send_buffer_length(&msg); i++) {
        	comm_send_ch(MAVLINK_COMM_0, buffer[i]);
        }
	mavlink_msg_airspeed_autocal_decode(last_msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);
        
        memset(&packet2, 0, sizeof(packet2));
	mavlink_msg_airspeed_autocal_send(MAVLINK_COMM_1 , packet1.vx , packet1.vy , packet1.vz , packet1.diff_pressure , packet1.EAS2TAS , packet1.ratio , packet1.state_x , packet1.state_y , packet1.state_z , packet1.Pax , packet1.Pby , packet1.Pcz );
	mavlink_msg_airspeed_autocal_decode(last_msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);
}

static void mavlink_test_rally_point(uint8_t system_id, uint8_t component_id, mavlink_message_t *last_msg)
{
	mavlink_message_t msg;
        uint8_t buffer[MAVLINK_MAX_PACKET_LEN];
        uint16_t i;
	mavlink_rally_point_t packet_in = {
		963497464,963497672,17651,17755,17859,175,242,53,120,187
    };
	mavlink_rally_point_t packet1, packet2;
        memset(&packet1, 0, sizeof(packet1));
        	packet1.lat = packet_in.lat;
        	packet1.lng = packet_in.lng;
        	packet1.alt = packet_in.alt;
        	packet1.break_alt = packet_in.break_alt;
        	packet1.land_dir = packet_in.land_dir;
        	packet1.target_system = packet_in.target_system;
        	packet1.target_component = packet_in.target_component;
        	packet1.idx = packet_in.idx;
        	packet1.count = packet_in.count;
        	packet1.flags = packet_in.flags;
        
        

        memset(&packet2, 0, sizeof(packet2));
	mavlink_msg_rally_point_encode(system_id, component_id, &msg, &packet1);
	mavlink_msg_rally_point_decode(&msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);

        memset(&packet2, 0, sizeof(packet2));
	mavlink_msg_rally_point_pack(system_id, component_id, &msg , packet1.target_system , packet1.target_component , packet1.idx , packet1.count , packet1.lat , packet1.lng , packet1.alt , packet1.break_alt , packet1.land_dir , packet1.flags );
	mavlink_msg_rally_point_decode(&msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);

        memset(&packet2, 0, sizeof(packet2));
	mavlink_msg_rally_point_pack_chan(system_id, component_id, MAVLINK_COMM_0, &msg , packet1.target_system , packet1.target_component , packet1.idx , packet1.count , packet1.lat , packet1.lng , packet1.alt , packet1.break_alt , packet1.land_dir , packet1.flags );
	mavlink_msg_rally_point_decode(&msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);

        memset(&packet2, 0, sizeof(packet2));
        mavlink_msg_to_send_buffer(buffer, &msg);
        for (i=0; i<mavlink_msg_get_send_buffer_length(&msg); i++) {
        	comm_send_ch(MAVLINK_COMM_0, buffer[i]);
        }
	mavlink_msg_rally_point_decode(last_msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);
        
        memset(&packet2, 0, sizeof(packet2));
	mavlink_msg_rally_point_send(MAVLINK_COMM_1 , packet1.target_system , packet1.target_component , packet1.idx , packet1.count , packet1.lat , packet1.lng , packet1.alt , packet1.break_alt , packet1.land_dir , packet1.flags );
	mavlink_msg_rally_point_decode(last_msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);
}

static void mavlink_test_rally_fetch_point(uint8_t system_id, uint8_t component_id, mavlink_message_t *last_msg)
{
	mavlink_message_t msg;
        uint8_t buffer[MAVLINK_MAX_PACKET_LEN];
        uint16_t i;
	mavlink_rally_fetch_point_t packet_in = {
		5,72,139
    };
	mavlink_rally_fetch_point_t packet1, packet2;
        memset(&packet1, 0, sizeof(packet1));
        	packet1.target_system = packet_in.target_system;
        	packet1.target_component = packet_in.target_component;
        	packet1.idx = packet_in.idx;
        
        

        memset(&packet2, 0, sizeof(packet2));
	mavlink_msg_rally_fetch_point_encode(system_id, component_id, &msg, &packet1);
	mavlink_msg_rally_fetch_point_decode(&msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);

        memset(&packet2, 0, sizeof(packet2));
	mavlink_msg_rally_fetch_point_pack(system_id, component_id, &msg , packet1.target_system , packet1.target_component , packet1.idx );
	mavlink_msg_rally_fetch_point_decode(&msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);

        memset(&packet2, 0, sizeof(packet2));
	mavlink_msg_rally_fetch_point_pack_chan(system_id, component_id, MAVLINK_COMM_0, &msg , packet1.target_system , packet1.target_component , packet1.idx );
	mavlink_msg_rally_fetch_point_decode(&msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);

        memset(&packet2, 0, sizeof(packet2));
        mavlink_msg_to_send_buffer(buffer, &msg);
        for (i=0; i<mavlink_msg_get_send_buffer_length(&msg); i++) {
        	comm_send_ch(MAVLINK_COMM_0, buffer[i]);
        }
	mavlink_msg_rally_fetch_point_decode(last_msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);
        
        memset(&packet2, 0, sizeof(packet2));
	mavlink_msg_rally_fetch_point_send(MAVLINK_COMM_1 , packet1.target_system , packet1.target_component , packet1.idx );
	mavlink_msg_rally_fetch_point_decode(last_msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);
}

static void mavlink_test_compassmot_status(uint8_t system_id, uint8_t component_id, mavlink_message_t *last_msg)
{
	mavlink_message_t msg;
        uint8_t buffer[MAVLINK_MAX_PACKET_LEN];
        uint16_t i;
	mavlink_compassmot_status_t packet_in = {
		17.0,45.0,73.0,101.0,18067,18171
    };
	mavlink_compassmot_status_t packet1, packet2;
        memset(&packet1, 0, sizeof(packet1));
        	packet1.current = packet_in.current;
        	packet1.CompensationX = packet_in.CompensationX;
        	packet1.CompensationY = packet_in.CompensationY;
        	packet1.CompensationZ = packet_in.CompensationZ;
        	packet1.throttle = packet_in.throttle;
        	packet1.interference = packet_in.interference;
        
        

        memset(&packet2, 0, sizeof(packet2));
	mavlink_msg_compassmot_status_encode(system_id, component_id, &msg, &packet1);
	mavlink_msg_compassmot_status_decode(&msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);

        memset(&packet2, 0, sizeof(packet2));
	mavlink_msg_compassmot_status_pack(system_id, component_id, &msg , packet1.throttle , packet1.current , packet1.interference , packet1.CompensationX , packet1.CompensationY , packet1.CompensationZ );
	mavlink_msg_compassmot_status_decode(&msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);

        memset(&packet2, 0, sizeof(packet2));
	mavlink_msg_compassmot_status_pack_chan(system_id, component_id, MAVLINK_COMM_0, &msg , packet1.throttle , packet1.current , packet1.interference , packet1.CompensationX , packet1.CompensationY , packet1.CompensationZ );
	mavlink_msg_compassmot_status_decode(&msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);

        memset(&packet2, 0, sizeof(packet2));
        mavlink_msg_to_send_buffer(buffer, &msg);
        for (i=0; i<mavlink_msg_get_send_buffer_length(&msg); i++) {
        	comm_send_ch(MAVLINK_COMM_0, buffer[i]);
        }
	mavlink_msg_compassmot_status_decode(last_msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);
        
        memset(&packet2, 0, sizeof(packet2));
	mavlink_msg_compassmot_status_send(MAVLINK_COMM_1 , packet1.throttle , packet1.current , packet1.interference , packet1.CompensationX , packet1.CompensationY , packet1.CompensationZ );
	mavlink_msg_compassmot_status_decode(last_msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);
}

static void mavlink_test_ahrs2(uint8_t system_id, uint8_t component_id, mavlink_message_t *last_msg)
{
	mavlink_message_t msg;
        uint8_t buffer[MAVLINK_MAX_PACKET_LEN];
        uint16_t i;
	mavlink_ahrs2_t packet_in = {
		17.0,45.0,73.0,101.0,963498296,963498504
    };
	mavlink_ahrs2_t packet1, packet2;
        memset(&packet1, 0, sizeof(packet1));
        	packet1.roll = packet_in.roll;
        	packet1.pitch = packet_in.pitch;
        	packet1.yaw = packet_in.yaw;
        	packet1.altitude = packet_in.altitude;
        	packet1.lat = packet_in.lat;
        	packet1.lng = packet_in.lng;
        
        

        memset(&packet2, 0, sizeof(packet2));
	mavlink_msg_ahrs2_encode(system_id, component_id, &msg, &packet1);
	mavlink_msg_ahrs2_decode(&msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);

        memset(&packet2, 0, sizeof(packet2));
	mavlink_msg_ahrs2_pack(system_id, component_id, &msg , packet1.roll , packet1.pitch , packet1.yaw , packet1.altitude , packet1.lat , packet1.lng );
	mavlink_msg_ahrs2_decode(&msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);

        memset(&packet2, 0, sizeof(packet2));
	mavlink_msg_ahrs2_pack_chan(system_id, component_id, MAVLINK_COMM_0, &msg , packet1.roll , packet1.pitch , packet1.yaw , packet1.altitude , packet1.lat , packet1.lng );
	mavlink_msg_ahrs2_decode(&msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);

        memset(&packet2, 0, sizeof(packet2));
        mavlink_msg_to_send_buffer(buffer, &msg);
        for (i=0; i<mavlink_msg_get_send_buffer_length(&msg); i++) {
        	comm_send_ch(MAVLINK_COMM_0, buffer[i]);
        }
	mavlink_msg_ahrs2_decode(last_msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);
        
        memset(&packet2, 0, sizeof(packet2));
	mavlink_msg_ahrs2_send(MAVLINK_COMM_1 , packet1.roll , packet1.pitch , packet1.yaw , packet1.altitude , packet1.lat , packet1.lng );
	mavlink_msg_ahrs2_decode(last_msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);
}

static void mavlink_test_camera_status(uint8_t system_id, uint8_t component_id, mavlink_message_t *last_msg)
{
	mavlink_message_t msg;
        uint8_t buffer[MAVLINK_MAX_PACKET_LEN];
        uint16_t i;
	mavlink_camera_status_t packet_in = {
		93372036854775807ULL,73.0,101.0,129.0,157.0,18483,211,22,89
    };
	mavlink_camera_status_t packet1, packet2;
        memset(&packet1, 0, sizeof(packet1));
        	packet1.time_usec = packet_in.time_usec;
        	packet1.p1 = packet_in.p1;
        	packet1.p2 = packet_in.p2;
        	packet1.p3 = packet_in.p3;
        	packet1.p4 = packet_in.p4;
        	packet1.img_idx = packet_in.img_idx;
        	packet1.target_system = packet_in.target_system;
        	packet1.cam_idx = packet_in.cam_idx;
        	packet1.event_id = packet_in.event_id;
        
        

        memset(&packet2, 0, sizeof(packet2));
	mavlink_msg_camera_status_encode(system_id, component_id, &msg, &packet1);
	mavlink_msg_camera_status_decode(&msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);

        memset(&packet2, 0, sizeof(packet2));
	mavlink_msg_camera_status_pack(system_id, component_id, &msg , packet1.time_usec , packet1.target_system , packet1.cam_idx , packet1.img_idx , packet1.event_id , packet1.p1 , packet1.p2 , packet1.p3 , packet1.p4 );
	mavlink_msg_camera_status_decode(&msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);

        memset(&packet2, 0, sizeof(packet2));
	mavlink_msg_camera_status_pack_chan(system_id, component_id, MAVLINK_COMM_0, &msg , packet1.time_usec , packet1.target_system , packet1.cam_idx , packet1.img_idx , packet1.event_id , packet1.p1 , packet1.p2 , packet1.p3 , packet1.p4 );
	mavlink_msg_camera_status_decode(&msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);

        memset(&packet2, 0, sizeof(packet2));
        mavlink_msg_to_send_buffer(buffer, &msg);
        for (i=0; i<mavlink_msg_get_send_buffer_length(&msg); i++) {
        	comm_send_ch(MAVLINK_COMM_0, buffer[i]);
        }
	mavlink_msg_camera_status_decode(last_msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);
        
        memset(&packet2, 0, sizeof(packet2));
	mavlink_msg_camera_status_send(MAVLINK_COMM_1 , packet1.time_usec , packet1.target_system , packet1.cam_idx , packet1.img_idx , packet1.event_id , packet1.p1 , packet1.p2 , packet1.p3 , packet1.p4 );
	mavlink_msg_camera_status_decode(last_msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);
}

static void mavlink_test_camera_feedback(uint8_t system_id, uint8_t component_id, mavlink_message_t *last_msg)
{
	mavlink_message_t msg;
        uint8_t buffer[MAVLINK_MAX_PACKET_LEN];
        uint16_t i;
	mavlink_camera_feedback_t packet_in = {
		93372036854775807ULL,963497880,963498088,129.0,157.0,185.0,213.0,241.0,269.0,19315,3,70,137
    };
	mavlink_camera_feedback_t packet1, packet2;
        memset(&packet1, 0, sizeof(packet1));
        	packet1.time_usec = packet_in.time_usec;
        	packet1.lat = packet_in.lat;
        	packet1.lng = packet_in.lng;
        	packet1.alt_msl = packet_in.alt_msl;
        	packet1.alt_rel = packet_in.alt_rel;
        	packet1.roll = packet_in.roll;
        	packet1.pitch = packet_in.pitch;
        	packet1.yaw = packet_in.yaw;
        	packet1.foc_len = packet_in.foc_len;
        	packet1.img_idx = packet_in.img_idx;
        	packet1.target_system = packet_in.target_system;
        	packet1.cam_idx = packet_in.cam_idx;
        	packet1.flags = packet_in.flags;
        
        

        memset(&packet2, 0, sizeof(packet2));
	mavlink_msg_camera_feedback_encode(system_id, component_id, &msg, &packet1);
	mavlink_msg_camera_feedback_decode(&msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);

        memset(&packet2, 0, sizeof(packet2));
	mavlink_msg_camera_feedback_pack(system_id, component_id, &msg , packet1.time_usec , packet1.target_system , packet1.cam_idx , packet1.img_idx , packet1.lat , packet1.lng , packet1.alt_msl , packet1.alt_rel , packet1.roll , packet1.pitch , packet1.yaw , packet1.foc_len , packet1.flags );
	mavlink_msg_camera_feedback_decode(&msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);

        memset(&packet2, 0, sizeof(packet2));
	mavlink_msg_camera_feedback_pack_chan(system_id, component_id, MAVLINK_COMM_0, &msg , packet1.time_usec , packet1.target_system , packet1.cam_idx , packet1.img_idx , packet1.lat , packet1.lng , packet1.alt_msl , packet1.alt_rel , packet1.roll , packet1.pitch , packet1.yaw , packet1.foc_len , packet1.flags );
	mavlink_msg_camera_feedback_decode(&msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);

        memset(&packet2, 0, sizeof(packet2));
        mavlink_msg_to_send_buffer(buffer, &msg);
        for (i=0; i<mavlink_msg_get_send_buffer_length(&msg); i++) {
        	comm_send_ch(MAVLINK_COMM_0, buffer[i]);
        }
	mavlink_msg_camera_feedback_decode(last_msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);
        
        memset(&packet2, 0, sizeof(packet2));
	mavlink_msg_camera_feedback_send(MAVLINK_COMM_1 , packet1.time_usec , packet1.target_system , packet1.cam_idx , packet1.img_idx , packet1.lat , packet1.lng , packet1.alt_msl , packet1.alt_rel , packet1.roll , packet1.pitch , packet1.yaw , packet1.foc_len , packet1.flags );
	mavlink_msg_camera_feedback_decode(last_msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);
}

static void mavlink_test_battery2(uint8_t system_id, uint8_t component_id, mavlink_message_t *last_msg)
{
	mavlink_message_t msg;
        uint8_t buffer[MAVLINK_MAX_PACKET_LEN];
        uint16_t i;
	mavlink_battery2_t packet_in = {
		17235,17339
    };
	mavlink_battery2_t packet1, packet2;
        memset(&packet1, 0, sizeof(packet1));
        	packet1.voltage = packet_in.voltage;
        	packet1.current_battery = packet_in.current_battery;
        
        

        memset(&packet2, 0, sizeof(packet2));
	mavlink_msg_battery2_encode(system_id, component_id, &msg, &packet1);
	mavlink_msg_battery2_decode(&msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);

        memset(&packet2, 0, sizeof(packet2));
	mavlink_msg_battery2_pack(system_id, component_id, &msg , packet1.voltage , packet1.current_battery );
	mavlink_msg_battery2_decode(&msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);

        memset(&packet2, 0, sizeof(packet2));
	mavlink_msg_battery2_pack_chan(system_id, component_id, MAVLINK_COMM_0, &msg , packet1.voltage , packet1.current_battery );
	mavlink_msg_battery2_decode(&msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);

        memset(&packet2, 0, sizeof(packet2));
        mavlink_msg_to_send_buffer(buffer, &msg);
        for (i=0; i<mavlink_msg_get_send_buffer_length(&msg); i++) {
        	comm_send_ch(MAVLINK_COMM_0, buffer[i]);
        }
	mavlink_msg_battery2_decode(last_msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);
        
        memset(&packet2, 0, sizeof(packet2));
	mavlink_msg_battery2_send(MAVLINK_COMM_1 , packet1.voltage , packet1.current_battery );
	mavlink_msg_battery2_decode(last_msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);
}

static void mavlink_test_ahrs3(uint8_t system_id, uint8_t component_id, mavlink_message_t *last_msg)
{
	mavlink_message_t msg;
        uint8_t buffer[MAVLINK_MAX_PACKET_LEN];
        uint16_t i;
	mavlink_ahrs3_t packet_in = {
		17.0,45.0,73.0,101.0,963498296,963498504,185.0,213.0,241.0,269.0
    };
	mavlink_ahrs3_t packet1, packet2;
        memset(&packet1, 0, sizeof(packet1));
        	packet1.roll = packet_in.roll;
        	packet1.pitch = packet_in.pitch;
        	packet1.yaw = packet_in.yaw;
        	packet1.altitude = packet_in.altitude;
        	packet1.lat = packet_in.lat;
        	packet1.lng = packet_in.lng;
        	packet1.v1 = packet_in.v1;
        	packet1.v2 = packet_in.v2;
        	packet1.v3 = packet_in.v3;
        	packet1.v4 = packet_in.v4;
        
        

        memset(&packet2, 0, sizeof(packet2));
	mavlink_msg_ahrs3_encode(system_id, component_id, &msg, &packet1);
	mavlink_msg_ahrs3_decode(&msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);

        memset(&packet2, 0, sizeof(packet2));
	mavlink_msg_ahrs3_pack(system_id, component_id, &msg , packet1.roll , packet1.pitch , packet1.yaw , packet1.altitude , packet1.lat , packet1.lng , packet1.v1 , packet1.v2 , packet1.v3 , packet1.v4 );
	mavlink_msg_ahrs3_decode(&msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);

        memset(&packet2, 0, sizeof(packet2));
	mavlink_msg_ahrs3_pack_chan(system_id, component_id, MAVLINK_COMM_0, &msg , packet1.roll , packet1.pitch , packet1.yaw , packet1.altitude , packet1.lat , packet1.lng , packet1.v1 , packet1.v2 , packet1.v3 , packet1.v4 );
	mavlink_msg_ahrs3_decode(&msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);

        memset(&packet2, 0, sizeof(packet2));
        mavlink_msg_to_send_buffer(buffer, &msg);
        for (i=0; i<mavlink_msg_get_send_buffer_length(&msg); i++) {
        	comm_send_ch(MAVLINK_COMM_0, buffer[i]);
        }
	mavlink_msg_ahrs3_decode(last_msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);
        
        memset(&packet2, 0, sizeof(packet2));
	mavlink_msg_ahrs3_send(MAVLINK_COMM_1 , packet1.roll , packet1.pitch , packet1.yaw , packet1.altitude , packet1.lat , packet1.lng , packet1.v1 , packet1.v2 , packet1.v3 , packet1.v4 );
	mavlink_msg_ahrs3_decode(last_msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);
}

static void mavlink_test_autopilot_version_request(uint8_t system_id, uint8_t component_id, mavlink_message_t *last_msg)
{
	mavlink_message_t msg;
        uint8_t buffer[MAVLINK_MAX_PACKET_LEN];
        uint16_t i;
	mavlink_autopilot_version_request_t packet_in = {
		5,72
    };
	mavlink_autopilot_version_request_t packet1, packet2;
        memset(&packet1, 0, sizeof(packet1));
        	packet1.target_system = packet_in.target_system;
        	packet1.target_component = packet_in.target_component;
        
        

        memset(&packet2, 0, sizeof(packet2));
	mavlink_msg_autopilot_version_request_encode(system_id, component_id, &msg, &packet1);
	mavlink_msg_autopilot_version_request_decode(&msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);

        memset(&packet2, 0, sizeof(packet2));
	mavlink_msg_autopilot_version_request_pack(system_id, component_id, &msg , packet1.target_system , packet1.target_component );
	mavlink_msg_autopilot_version_request_decode(&msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);

        memset(&packet2, 0, sizeof(packet2));
	mavlink_msg_autopilot_version_request_pack_chan(system_id, component_id, MAVLINK_COMM_0, &msg , packet1.target_system , packet1.target_component );
	mavlink_msg_autopilot_version_request_decode(&msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);

        memset(&packet2, 0, sizeof(packet2));
        mavlink_msg_to_send_buffer(buffer, &msg);
        for (i=0; i<mavlink_msg_get_send_buffer_length(&msg); i++) {
        	comm_send_ch(MAVLINK_COMM_0, buffer[i]);
        }
	mavlink_msg_autopilot_version_request_decode(last_msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);
        
        memset(&packet2, 0, sizeof(packet2));
	mavlink_msg_autopilot_version_request_send(MAVLINK_COMM_1 , packet1.target_system , packet1.target_component );
	mavlink_msg_autopilot_version_request_decode(last_msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);
}

static void mavlink_test_led_control(uint8_t system_id, uint8_t component_id, mavlink_message_t *last_msg)
{
	mavlink_message_t msg;
        uint8_t buffer[MAVLINK_MAX_PACKET_LEN];
        uint16_t i;
	mavlink_led_control_t packet_in = {
		5,72,139,206,17,{ 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99, 100, 101, 102, 103, 104, 105, 106, 107 }
    };
	mavlink_led_control_t packet1, packet2;
        memset(&packet1, 0, sizeof(packet1));
        	packet1.target_system = packet_in.target_system;
        	packet1.target_component = packet_in.target_component;
        	packet1.instance = packet_in.instance;
        	packet1.pattern = packet_in.pattern;
        	packet1.custom_len = packet_in.custom_len;
        
        	mav_array_memcpy(packet1.custom_bytes, packet_in.custom_bytes, sizeof(uint8_t)*24);
        

        memset(&packet2, 0, sizeof(packet2));
	mavlink_msg_led_control_encode(system_id, component_id, &msg, &packet1);
	mavlink_msg_led_control_decode(&msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);

        memset(&packet2, 0, sizeof(packet2));
	mavlink_msg_led_control_pack(system_id, component_id, &msg , packet1.target_system , packet1.target_component , packet1.instance , packet1.pattern , packet1.custom_len , packet1.custom_bytes );
	mavlink_msg_led_control_decode(&msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);

        memset(&packet2, 0, sizeof(packet2));
	mavlink_msg_led_control_pack_chan(system_id, component_id, MAVLINK_COMM_0, &msg , packet1.target_system , packet1.target_component , packet1.instance , packet1.pattern , packet1.custom_len , packet1.custom_bytes );
	mavlink_msg_led_control_decode(&msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);

        memset(&packet2, 0, sizeof(packet2));
        mavlink_msg_to_send_buffer(buffer, &msg);
        for (i=0; i<mavlink_msg_get_send_buffer_length(&msg); i++) {
        	comm_send_ch(MAVLINK_COMM_0, buffer[i]);
        }
	mavlink_msg_led_control_decode(last_msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);
        
        memset(&packet2, 0, sizeof(packet2));
	mavlink_msg_led_control_send(MAVLINK_COMM_1 , packet1.target_system , packet1.target_component , packet1.instance , packet1.pattern , packet1.custom_len , packet1.custom_bytes );
	mavlink_msg_led_control_decode(last_msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);
}

static void mavlink_test_mag_cal_progress(uint8_t system_id, uint8_t component_id, mavlink_message_t *last_msg)
{
	mavlink_message_t msg;
        uint8_t buffer[MAVLINK_MAX_PACKET_LEN];
        uint16_t i;
	mavlink_mag_cal_progress_t packet_in = {
		17.0,45.0,73.0,41,108,175,242,53,{ 120, 121, 122, 123, 124, 125, 126, 127, 128, 129 }
    };
	mavlink_mag_cal_progress_t packet1, packet2;
        memset(&packet1, 0, sizeof(packet1));
        	packet1.direction_x = packet_in.direction_x;
        	packet1.direction_y = packet_in.direction_y;
        	packet1.direction_z = packet_in.direction_z;
        	packet1.compass_id = packet_in.compass_id;
        	packet1.cal_mask = packet_in.cal_mask;
        	packet1.cal_status = packet_in.cal_status;
        	packet1.attempt = packet_in.attempt;
        	packet1.completion_pct = packet_in.completion_pct;
        
        	mav_array_memcpy(packet1.completion_mask, packet_in.completion_mask, sizeof(uint8_t)*10);
        

        memset(&packet2, 0, sizeof(packet2));
	mavlink_msg_mag_cal_progress_encode(system_id, component_id, &msg, &packet1);
	mavlink_msg_mag_cal_progress_decode(&msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);

        memset(&packet2, 0, sizeof(packet2));
	mavlink_msg_mag_cal_progress_pack(system_id, component_id, &msg , packet1.compass_id , packet1.cal_mask , packet1.cal_status , packet1.attempt , packet1.completion_pct , packet1.completion_mask , packet1.direction_x , packet1.direction_y , packet1.direction_z );
	mavlink_msg_mag_cal_progress_decode(&msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);

        memset(&packet2, 0, sizeof(packet2));
	mavlink_msg_mag_cal_progress_pack_chan(system_id, component_id, MAVLINK_COMM_0, &msg , packet1.compass_id , packet1.cal_mask , packet1.cal_status , packet1.attempt , packet1.completion_pct , packet1.completion_mask , packet1.direction_x , packet1.direction_y , packet1.direction_z );
	mavlink_msg_mag_cal_progress_decode(&msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);

        memset(&packet2, 0, sizeof(packet2));
        mavlink_msg_to_send_buffer(buffer, &msg);
        for (i=0; i<mavlink_msg_get_send_buffer_length(&msg); i++) {
        	comm_send_ch(MAVLINK_COMM_0, buffer[i]);
        }
	mavlink_msg_mag_cal_progress_decode(last_msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);
        
        memset(&packet2, 0, sizeof(packet2));
	mavlink_msg_mag_cal_progress_send(MAVLINK_COMM_1 , packet1.compass_id , packet1.cal_mask , packet1.cal_status , packet1.attempt , packet1.completion_pct , packet1.completion_mask , packet1.direction_x , packet1.direction_y , packet1.direction_z );
	mavlink_msg_mag_cal_progress_decode(last_msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);
}

static void mavlink_test_mag_cal_report(uint8_t system_id, uint8_t component_id, mavlink_message_t *last_msg)
{
	mavlink_message_t msg;
        uint8_t buffer[MAVLINK_MAX_PACKET_LEN];
        uint16_t i;
	mavlink_mag_cal_report_t packet_in = {
		17.0,45.0,73.0,101.0,129.0,157.0,185.0,213.0,241.0,269.0,125,192,3,70
    };
	mavlink_mag_cal_report_t packet1, packet2;
        memset(&packet1, 0, sizeof(packet1));
        	packet1.fitness = packet_in.fitness;
        	packet1.ofs_x = packet_in.ofs_x;
        	packet1.ofs_y = packet_in.ofs_y;
        	packet1.ofs_z = packet_in.ofs_z;
        	packet1.diag_x = packet_in.diag_x;
        	packet1.diag_y = packet_in.diag_y;
        	packet1.diag_z = packet_in.diag_z;
        	packet1.offdiag_x = packet_in.offdiag_x;
        	packet1.offdiag_y = packet_in.offdiag_y;
        	packet1.offdiag_z = packet_in.offdiag_z;
        	packet1.compass_id = packet_in.compass_id;
        	packet1.cal_mask = packet_in.cal_mask;
        	packet1.cal_status = packet_in.cal_status;
        	packet1.autosaved = packet_in.autosaved;
        
        

        memset(&packet2, 0, sizeof(packet2));
	mavlink_msg_mag_cal_report_encode(system_id, component_id, &msg, &packet1);
	mavlink_msg_mag_cal_report_decode(&msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);

        memset(&packet2, 0, sizeof(packet2));
	mavlink_msg_mag_cal_report_pack(system_id, component_id, &msg , packet1.compass_id , packet1.cal_mask , packet1.cal_status , packet1.autosaved , packet1.fitness , packet1.ofs_x , packet1.ofs_y , packet1.ofs_z , packet1.diag_x , packet1.diag_y , packet1.diag_z , packet1.offdiag_x , packet1.offdiag_y , packet1.offdiag_z );
	mavlink_msg_mag_cal_report_decode(&msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);

        memset(&packet2, 0, sizeof(packet2));
	mavlink_msg_mag_cal_report_pack_chan(system_id, component_id, MAVLINK_COMM_0, &msg , packet1.compass_id , packet1.cal_mask , packet1.cal_status , packet1.autosaved , packet1.fitness , packet1.ofs_x , packet1.ofs_y , packet1.ofs_z , packet1.diag_x , packet1.diag_y , packet1.diag_z , packet1.offdiag_x , packet1.offdiag_y , packet1.offdiag_z );
	mavlink_msg_mag_cal_report_decode(&msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);

        memset(&packet2, 0, sizeof(packet2));
        mavlink_msg_to_send_buffer(buffer, &msg);
        for (i=0; i<mavlink_msg_get_send_buffer_length(&msg); i++) {
        	comm_send_ch(MAVLINK_COMM_0, buffer[i]);
        }
	mavlink_msg_mag_cal_report_decode(last_msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);
        
        memset(&packet2, 0, sizeof(packet2));
	mavlink_msg_mag_cal_report_send(MAVLINK_COMM_1 , packet1.compass_id , packet1.cal_mask , packet1.cal_status , packet1.autosaved , packet1.fitness , packet1.ofs_x , packet1.ofs_y , packet1.ofs_z , packet1.diag_x , packet1.diag_y , packet1.diag_z , packet1.offdiag_x , packet1.offdiag_y , packet1.offdiag_z );
	mavlink_msg_mag_cal_report_decode(last_msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);
}

static void mavlink_test_ekf_status_report(uint8_t system_id, uint8_t component_id, mavlink_message_t *last_msg)
{
	mavlink_message_t msg;
        uint8_t buffer[MAVLINK_MAX_PACKET_LEN];
        uint16_t i;
	mavlink_ekf_status_report_t packet_in = {
		17.0,45.0,73.0,101.0,129.0,18275
    };
	mavlink_ekf_status_report_t packet1, packet2;
        memset(&packet1, 0, sizeof(packet1));
        	packet1.velocity_variance = packet_in.velocity_variance;
        	packet1.pos_horiz_variance = packet_in.pos_horiz_variance;
        	packet1.pos_vert_variance = packet_in.pos_vert_variance;
        	packet1.compass_variance = packet_in.compass_variance;
        	packet1.terrain_alt_variance = packet_in.terrain_alt_variance;
        	packet1.flags = packet_in.flags;
        
        

        memset(&packet2, 0, sizeof(packet2));
	mavlink_msg_ekf_status_report_encode(system_id, component_id, &msg, &packet1);
	mavlink_msg_ekf_status_report_decode(&msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);

        memset(&packet2, 0, sizeof(packet2));
	mavlink_msg_ekf_status_report_pack(system_id, component_id, &msg , packet1.flags , packet1.velocity_variance , packet1.pos_horiz_variance , packet1.pos_vert_variance , packet1.compass_variance , packet1.terrain_alt_variance );
	mavlink_msg_ekf_status_report_decode(&msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);

        memset(&packet2, 0, sizeof(packet2));
	mavlink_msg_ekf_status_report_pack_chan(system_id, component_id, MAVLINK_COMM_0, &msg , packet1.flags , packet1.velocity_variance , packet1.pos_horiz_variance , packet1.pos_vert_variance , packet1.compass_variance , packet1.terrain_alt_variance );
	mavlink_msg_ekf_status_report_decode(&msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);

        memset(&packet2, 0, sizeof(packet2));
        mavlink_msg_to_send_buffer(buffer, &msg);
        for (i=0; i<mavlink_msg_get_send_buffer_length(&msg); i++) {
        	comm_send_ch(MAVLINK_COMM_0, buffer[i]);
        }
	mavlink_msg_ekf_status_report_decode(last_msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);
        
        memset(&packet2, 0, sizeof(packet2));
	mavlink_msg_ekf_status_report_send(MAVLINK_COMM_1 , packet1.flags , packet1.velocity_variance , packet1.pos_horiz_variance , packet1.pos_vert_variance , packet1.compass_variance , packet1.terrain_alt_variance );
	mavlink_msg_ekf_status_report_decode(last_msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);
}

static void mavlink_test_gimbal_report(uint8_t system_id, uint8_t component_id, mavlink_message_t *last_msg)
{
	mavlink_message_t msg;
        uint8_t buffer[MAVLINK_MAX_PACKET_LEN];
        uint16_t i;
	mavlink_gimbal_report_t packet_in = {
		17.0,45.0,73.0,101.0,129.0,157.0,185.0,213.0,241.0,269.0,125,192
    };
	mavlink_gimbal_report_t packet1, packet2;
        memset(&packet1, 0, sizeof(packet1));
        	packet1.delta_time = packet_in.delta_time;
        	packet1.delta_angle_x = packet_in.delta_angle_x;
        	packet1.delta_angle_y = packet_in.delta_angle_y;
        	packet1.delta_angle_z = packet_in.delta_angle_z;
        	packet1.delta_velocity_x = packet_in.delta_velocity_x;
        	packet1.delta_velocity_y = packet_in.delta_velocity_y;
        	packet1.delta_velocity_z = packet_in.delta_velocity_z;
        	packet1.joint_roll = packet_in.joint_roll;
        	packet1.joint_el = packet_in.joint_el;
        	packet1.joint_az = packet_in.joint_az;
        	packet1.target_system = packet_in.target_system;
        	packet1.target_component = packet_in.target_component;
        
        

        memset(&packet2, 0, sizeof(packet2));
	mavlink_msg_gimbal_report_encode(system_id, component_id, &msg, &packet1);
	mavlink_msg_gimbal_report_decode(&msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);

        memset(&packet2, 0, sizeof(packet2));
	mavlink_msg_gimbal_report_pack(system_id, component_id, &msg , packet1.target_system , packet1.target_component , packet1.delta_time , packet1.delta_angle_x , packet1.delta_angle_y , packet1.delta_angle_z , packet1.delta_velocity_x , packet1.delta_velocity_y , packet1.delta_velocity_z , packet1.joint_roll , packet1.joint_el , packet1.joint_az );
	mavlink_msg_gimbal_report_decode(&msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);

        memset(&packet2, 0, sizeof(packet2));
	mavlink_msg_gimbal_report_pack_chan(system_id, component_id, MAVLINK_COMM_0, &msg , packet1.target_system , packet1.target_component , packet1.delta_time , packet1.delta_angle_x , packet1.delta_angle_y , packet1.delta_angle_z , packet1.delta_velocity_x , packet1.delta_velocity_y , packet1.delta_velocity_z , packet1.joint_roll , packet1.joint_el , packet1.joint_az );
	mavlink_msg_gimbal_report_decode(&msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);

        memset(&packet2, 0, sizeof(packet2));
        mavlink_msg_to_send_buffer(buffer, &msg);
        for (i=0; i<mavlink_msg_get_send_buffer_length(&msg); i++) {
        	comm_send_ch(MAVLINK_COMM_0, buffer[i]);
        }
	mavlink_msg_gimbal_report_decode(last_msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);
        
        memset(&packet2, 0, sizeof(packet2));
	mavlink_msg_gimbal_report_send(MAVLINK_COMM_1 , packet1.target_system , packet1.target_component , packet1.delta_time , packet1.delta_angle_x , packet1.delta_angle_y , packet1.delta_angle_z , packet1.delta_velocity_x , packet1.delta_velocity_y , packet1.delta_velocity_z , packet1.joint_roll , packet1.joint_el , packet1.joint_az );
	mavlink_msg_gimbal_report_decode(last_msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);
}

static void mavlink_test_gimbal_control(uint8_t system_id, uint8_t component_id, mavlink_message_t *last_msg)
{
	mavlink_message_t msg;
        uint8_t buffer[MAVLINK_MAX_PACKET_LEN];
        uint16_t i;
	mavlink_gimbal_control_t packet_in = {
		17.0,45.0,73.0,41,108
    };
	mavlink_gimbal_control_t packet1, packet2;
        memset(&packet1, 0, sizeof(packet1));
        	packet1.demanded_rate_x = packet_in.demanded_rate_x;
        	packet1.demanded_rate_y = packet_in.demanded_rate_y;
        	packet1.demanded_rate_z = packet_in.demanded_rate_z;
        	packet1.target_system = packet_in.target_system;
        	packet1.target_component = packet_in.target_component;
        
        

        memset(&packet2, 0, sizeof(packet2));
	mavlink_msg_gimbal_control_encode(system_id, component_id, &msg, &packet1);
	mavlink_msg_gimbal_control_decode(&msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);

        memset(&packet2, 0, sizeof(packet2));
	mavlink_msg_gimbal_control_pack(system_id, component_id, &msg , packet1.target_system , packet1.target_component , packet1.demanded_rate_x , packet1.demanded_rate_y , packet1.demanded_rate_z );
	mavlink_msg_gimbal_control_decode(&msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);

        memset(&packet2, 0, sizeof(packet2));
	mavlink_msg_gimbal_control_pack_chan(system_id, component_id, MAVLINK_COMM_0, &msg , packet1.target_system , packet1.target_component , packet1.demanded_rate_x , packet1.demanded_rate_y , packet1.demanded_rate_z );
	mavlink_msg_gimbal_control_decode(&msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);

        memset(&packet2, 0, sizeof(packet2));
        mavlink_msg_to_send_buffer(buffer, &msg);
        for (i=0; i<mavlink_msg_get_send_buffer_length(&msg); i++) {
        	comm_send_ch(MAVLINK_COMM_0, buffer[i]);
        }
	mavlink_msg_gimbal_control_decode(last_msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);
        
        memset(&packet2, 0, sizeof(packet2));
	mavlink_msg_gimbal_control_send(MAVLINK_COMM_1 , packet1.target_system , packet1.target_component , packet1.demanded_rate_x , packet1.demanded_rate_y , packet1.demanded_rate_z );
	mavlink_msg_gimbal_control_decode(last_msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);
}

static void mavlink_test_gimbal_reset(uint8_t system_id, uint8_t component_id, mavlink_message_t *last_msg)
{
	mavlink_message_t msg;
        uint8_t buffer[MAVLINK_MAX_PACKET_LEN];
        uint16_t i;
	mavlink_gimbal_reset_t packet_in = {
		5,72
    };
	mavlink_gimbal_reset_t packet1, packet2;
        memset(&packet1, 0, sizeof(packet1));
        	packet1.target_system = packet_in.target_system;
        	packet1.target_component = packet_in.target_component;
        
        

        memset(&packet2, 0, sizeof(packet2));
	mavlink_msg_gimbal_reset_encode(system_id, component_id, &msg, &packet1);
	mavlink_msg_gimbal_reset_decode(&msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);

        memset(&packet2, 0, sizeof(packet2));
	mavlink_msg_gimbal_reset_pack(system_id, component_id, &msg , packet1.target_system , packet1.target_component );
	mavlink_msg_gimbal_reset_decode(&msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);

        memset(&packet2, 0, sizeof(packet2));
	mavlink_msg_gimbal_reset_pack_chan(system_id, component_id, MAVLINK_COMM_0, &msg , packet1.target_system , packet1.target_component );
	mavlink_msg_gimbal_reset_decode(&msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);

        memset(&packet2, 0, sizeof(packet2));
        mavlink_msg_to_send_buffer(buffer, &msg);
        for (i=0; i<mavlink_msg_get_send_buffer_length(&msg); i++) {
        	comm_send_ch(MAVLINK_COMM_0, buffer[i]);
        }
	mavlink_msg_gimbal_reset_decode(last_msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);
        
        memset(&packet2, 0, sizeof(packet2));
	mavlink_msg_gimbal_reset_send(MAVLINK_COMM_1 , packet1.target_system , packet1.target_component );
	mavlink_msg_gimbal_reset_decode(last_msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);
}

static void mavlink_test_gimbal_axis_calibration_progress(uint8_t system_id, uint8_t component_id, mavlink_message_t *last_msg)
{
	mavlink_message_t msg;
        uint8_t buffer[MAVLINK_MAX_PACKET_LEN];
        uint16_t i;
	mavlink_gimbal_axis_calibration_progress_t packet_in = {
		5,72,139
    };
	mavlink_gimbal_axis_calibration_progress_t packet1, packet2;
        memset(&packet1, 0, sizeof(packet1));
        	packet1.calibration_axis = packet_in.calibration_axis;
        	packet1.calibration_progress = packet_in.calibration_progress;
        	packet1.calibration_status = packet_in.calibration_status;
        
        

        memset(&packet2, 0, sizeof(packet2));
	mavlink_msg_gimbal_axis_calibration_progress_encode(system_id, component_id, &msg, &packet1);
	mavlink_msg_gimbal_axis_calibration_progress_decode(&msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);

        memset(&packet2, 0, sizeof(packet2));
	mavlink_msg_gimbal_axis_calibration_progress_pack(system_id, component_id, &msg , packet1.calibration_axis , packet1.calibration_progress , packet1.calibration_status );
	mavlink_msg_gimbal_axis_calibration_progress_decode(&msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);

        memset(&packet2, 0, sizeof(packet2));
	mavlink_msg_gimbal_axis_calibration_progress_pack_chan(system_id, component_id, MAVLINK_COMM_0, &msg , packet1.calibration_axis , packet1.calibration_progress , packet1.calibration_status );
	mavlink_msg_gimbal_axis_calibration_progress_decode(&msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);

        memset(&packet2, 0, sizeof(packet2));
        mavlink_msg_to_send_buffer(buffer, &msg);
        for (i=0; i<mavlink_msg_get_send_buffer_length(&msg); i++) {
        	comm_send_ch(MAVLINK_COMM_0, buffer[i]);
        }
	mavlink_msg_gimbal_axis_calibration_progress_decode(last_msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);
        
        memset(&packet2, 0, sizeof(packet2));
	mavlink_msg_gimbal_axis_calibration_progress_send(MAVLINK_COMM_1 , packet1.calibration_axis , packet1.calibration_progress , packet1.calibration_status );
	mavlink_msg_gimbal_axis_calibration_progress_decode(last_msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);
}

static void mavlink_test_gimbal_set_home_offsets(uint8_t system_id, uint8_t component_id, mavlink_message_t *last_msg)
{
	mavlink_message_t msg;
        uint8_t buffer[MAVLINK_MAX_PACKET_LEN];
        uint16_t i;
	mavlink_gimbal_set_home_offsets_t packet_in = {
		5,72
    };
	mavlink_gimbal_set_home_offsets_t packet1, packet2;
        memset(&packet1, 0, sizeof(packet1));
        	packet1.target_system = packet_in.target_system;
        	packet1.target_component = packet_in.target_component;
        
        

        memset(&packet2, 0, sizeof(packet2));
	mavlink_msg_gimbal_set_home_offsets_encode(system_id, component_id, &msg, &packet1);
	mavlink_msg_gimbal_set_home_offsets_decode(&msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);

        memset(&packet2, 0, sizeof(packet2));
	mavlink_msg_gimbal_set_home_offsets_pack(system_id, component_id, &msg , packet1.target_system , packet1.target_component );
	mavlink_msg_gimbal_set_home_offsets_decode(&msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);

        memset(&packet2, 0, sizeof(packet2));
	mavlink_msg_gimbal_set_home_offsets_pack_chan(system_id, component_id, MAVLINK_COMM_0, &msg , packet1.target_system , packet1.target_component );
	mavlink_msg_gimbal_set_home_offsets_decode(&msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);

        memset(&packet2, 0, sizeof(packet2));
        mavlink_msg_to_send_buffer(buffer, &msg);
        for (i=0; i<mavlink_msg_get_send_buffer_length(&msg); i++) {
        	comm_send_ch(MAVLINK_COMM_0, buffer[i]);
        }
	mavlink_msg_gimbal_set_home_offsets_decode(last_msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);
        
        memset(&packet2, 0, sizeof(packet2));
	mavlink_msg_gimbal_set_home_offsets_send(MAVLINK_COMM_1 , packet1.target_system , packet1.target_component );
	mavlink_msg_gimbal_set_home_offsets_decode(last_msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);
}

static void mavlink_test_gimbal_home_offset_calibration_result(uint8_t system_id, uint8_t component_id, mavlink_message_t *last_msg)
{
	mavlink_message_t msg;
        uint8_t buffer[MAVLINK_MAX_PACKET_LEN];
        uint16_t i;
	mavlink_gimbal_home_offset_calibration_result_t packet_in = {
		5
    };
	mavlink_gimbal_home_offset_calibration_result_t packet1, packet2;
        memset(&packet1, 0, sizeof(packet1));
        	packet1.calibration_result = packet_in.calibration_result;
        
        

        memset(&packet2, 0, sizeof(packet2));
	mavlink_msg_gimbal_home_offset_calibration_result_encode(system_id, component_id, &msg, &packet1);
	mavlink_msg_gimbal_home_offset_calibration_result_decode(&msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);

        memset(&packet2, 0, sizeof(packet2));
	mavlink_msg_gimbal_home_offset_calibration_result_pack(system_id, component_id, &msg , packet1.calibration_result );
	mavlink_msg_gimbal_home_offset_calibration_result_decode(&msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);

        memset(&packet2, 0, sizeof(packet2));
	mavlink_msg_gimbal_home_offset_calibration_result_pack_chan(system_id, component_id, MAVLINK_COMM_0, &msg , packet1.calibration_result );
	mavlink_msg_gimbal_home_offset_calibration_result_decode(&msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);

        memset(&packet2, 0, sizeof(packet2));
        mavlink_msg_to_send_buffer(buffer, &msg);
        for (i=0; i<mavlink_msg_get_send_buffer_length(&msg); i++) {
        	comm_send_ch(MAVLINK_COMM_0, buffer[i]);
        }
	mavlink_msg_gimbal_home_offset_calibration_result_decode(last_msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);
        
        memset(&packet2, 0, sizeof(packet2));
	mavlink_msg_gimbal_home_offset_calibration_result_send(MAVLINK_COMM_1 , packet1.calibration_result );
	mavlink_msg_gimbal_home_offset_calibration_result_decode(last_msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);
}

static void mavlink_test_gimbal_set_factory_parameters(uint8_t system_id, uint8_t component_id, mavlink_message_t *last_msg)
{
	mavlink_message_t msg;
        uint8_t buffer[MAVLINK_MAX_PACKET_LEN];
        uint16_t i;
	mavlink_gimbal_set_factory_parameters_t packet_in = {
		963497464,963497672,963497880,963498088,963498296,963498504,18483,211,22,89,156,223,34,101
    };
	mavlink_gimbal_set_factory_parameters_t packet1, packet2;
        memset(&packet1, 0, sizeof(packet1));
        	packet1.magic_1 = packet_in.magic_1;
        	packet1.magic_2 = packet_in.magic_2;
        	packet1.magic_3 = packet_in.magic_3;
        	packet1.serial_number_pt_1 = packet_in.serial_number_pt_1;
        	packet1.serial_number_pt_2 = packet_in.serial_number_pt_2;
        	packet1.serial_number_pt_3 = packet_in.serial_number_pt_3;
        	packet1.assembly_year = packet_in.assembly_year;
        	packet1.target_system = packet_in.target_system;
        	packet1.target_component = packet_in.target_component;
        	packet1.assembly_month = packet_in.assembly_month;
        	packet1.assembly_day = packet_in.assembly_day;
        	packet1.assembly_hour = packet_in.assembly_hour;
        	packet1.assembly_minute = packet_in.assembly_minute;
        	packet1.assembly_second = packet_in.assembly_second;
        
        

        memset(&packet2, 0, sizeof(packet2));
	mavlink_msg_gimbal_set_factory_parameters_encode(system_id, component_id, &msg, &packet1);
	mavlink_msg_gimbal_set_factory_parameters_decode(&msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);

        memset(&packet2, 0, sizeof(packet2));
	mavlink_msg_gimbal_set_factory_parameters_pack(system_id, component_id, &msg , packet1.target_system , packet1.target_component , packet1.magic_1 , packet1.magic_2 , packet1.magic_3 , packet1.assembly_year , packet1.assembly_month , packet1.assembly_day , packet1.assembly_hour , packet1.assembly_minute , packet1.assembly_second , packet1.serial_number_pt_1 , packet1.serial_number_pt_2 , packet1.serial_number_pt_3 );
	mavlink_msg_gimbal_set_factory_parameters_decode(&msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);

        memset(&packet2, 0, sizeof(packet2));
	mavlink_msg_gimbal_set_factory_parameters_pack_chan(system_id, component_id, MAVLINK_COMM_0, &msg , packet1.target_system , packet1.target_component , packet1.magic_1 , packet1.magic_2 , packet1.magic_3 , packet1.assembly_year , packet1.assembly_month , packet1.assembly_day , packet1.assembly_hour , packet1.assembly_minute , packet1.assembly_second , packet1.serial_number_pt_1 , packet1.serial_number_pt_2 , packet1.serial_number_pt_3 );
	mavlink_msg_gimbal_set_factory_parameters_decode(&msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);

        memset(&packet2, 0, sizeof(packet2));
        mavlink_msg_to_send_buffer(buffer, &msg);
        for (i=0; i<mavlink_msg_get_send_buffer_length(&msg); i++) {
        	comm_send_ch(MAVLINK_COMM_0, buffer[i]);
        }
	mavlink_msg_gimbal_set_factory_parameters_decode(last_msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);
        
        memset(&packet2, 0, sizeof(packet2));
	mavlink_msg_gimbal_set_factory_parameters_send(MAVLINK_COMM_1 , packet1.target_system , packet1.target_component , packet1.magic_1 , packet1.magic_2 , packet1.magic_3 , packet1.assembly_year , packet1.assembly_month , packet1.assembly_day , packet1.assembly_hour , packet1.assembly_minute , packet1.assembly_second , packet1.serial_number_pt_1 , packet1.serial_number_pt_2 , packet1.serial_number_pt_3 );
	mavlink_msg_gimbal_set_factory_parameters_decode(last_msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);
}

static void mavlink_test_gimbal_factory_parameters_loaded(uint8_t system_id, uint8_t component_id, mavlink_message_t *last_msg)
{
	mavlink_message_t msg;
        uint8_t buffer[MAVLINK_MAX_PACKET_LEN];
        uint16_t i;
	mavlink_gimbal_factory_parameters_loaded_t packet_in = {
		5
    };
	mavlink_gimbal_factory_parameters_loaded_t packet1, packet2;
        memset(&packet1, 0, sizeof(packet1));
        	packet1.dummy = packet_in.dummy;
        
        

        memset(&packet2, 0, sizeof(packet2));
	mavlink_msg_gimbal_factory_parameters_loaded_encode(system_id, component_id, &msg, &packet1);
	mavlink_msg_gimbal_factory_parameters_loaded_decode(&msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);

        memset(&packet2, 0, sizeof(packet2));
	mavlink_msg_gimbal_factory_parameters_loaded_pack(system_id, component_id, &msg , packet1.dummy );
	mavlink_msg_gimbal_factory_parameters_loaded_decode(&msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);

        memset(&packet2, 0, sizeof(packet2));
	mavlink_msg_gimbal_factory_parameters_loaded_pack_chan(system_id, component_id, MAVLINK_COMM_0, &msg , packet1.dummy );
	mavlink_msg_gimbal_factory_parameters_loaded_decode(&msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);

        memset(&packet2, 0, sizeof(packet2));
        mavlink_msg_to_send_buffer(buffer, &msg);
        for (i=0; i<mavlink_msg_get_send_buffer_length(&msg); i++) {
        	comm_send_ch(MAVLINK_COMM_0, buffer[i]);
        }
	mavlink_msg_gimbal_factory_parameters_loaded_decode(last_msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);
        
        memset(&packet2, 0, sizeof(packet2));
	mavlink_msg_gimbal_factory_parameters_loaded_send(MAVLINK_COMM_1 , packet1.dummy );
	mavlink_msg_gimbal_factory_parameters_loaded_decode(last_msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);
}

static void mavlink_test_gimbal_erase_firmware_and_config(uint8_t system_id, uint8_t component_id, mavlink_message_t *last_msg)
{
	mavlink_message_t msg;
        uint8_t buffer[MAVLINK_MAX_PACKET_LEN];
        uint16_t i;
	mavlink_gimbal_erase_firmware_and_config_t packet_in = {
		963497464,17,84
    };
	mavlink_gimbal_erase_firmware_and_config_t packet1, packet2;
        memset(&packet1, 0, sizeof(packet1));
        	packet1.knock = packet_in.knock;
        	packet1.target_system = packet_in.target_system;
        	packet1.target_component = packet_in.target_component;
        
        

        memset(&packet2, 0, sizeof(packet2));
	mavlink_msg_gimbal_erase_firmware_and_config_encode(system_id, component_id, &msg, &packet1);
	mavlink_msg_gimbal_erase_firmware_and_config_decode(&msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);

        memset(&packet2, 0, sizeof(packet2));
	mavlink_msg_gimbal_erase_firmware_and_config_pack(system_id, component_id, &msg , packet1.target_system , packet1.target_component , packet1.knock );
	mavlink_msg_gimbal_erase_firmware_and_config_decode(&msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);

        memset(&packet2, 0, sizeof(packet2));
	mavlink_msg_gimbal_erase_firmware_and_config_pack_chan(system_id, component_id, MAVLINK_COMM_0, &msg , packet1.target_system , packet1.target_component , packet1.knock );
	mavlink_msg_gimbal_erase_firmware_and_config_decode(&msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);

        memset(&packet2, 0, sizeof(packet2));
        mavlink_msg_to_send_buffer(buffer, &msg);
        for (i=0; i<mavlink_msg_get_send_buffer_length(&msg); i++) {
        	comm_send_ch(MAVLINK_COMM_0, buffer[i]);
        }
	mavlink_msg_gimbal_erase_firmware_and_config_decode(last_msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);
        
        memset(&packet2, 0, sizeof(packet2));
	mavlink_msg_gimbal_erase_firmware_and_config_send(MAVLINK_COMM_1 , packet1.target_system , packet1.target_component , packet1.knock );
	mavlink_msg_gimbal_erase_firmware_and_config_decode(last_msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);
}

static void mavlink_test_gimbal_perform_factory_tests(uint8_t system_id, uint8_t component_id, mavlink_message_t *last_msg)
{
	mavlink_message_t msg;
        uint8_t buffer[MAVLINK_MAX_PACKET_LEN];
        uint16_t i;
	mavlink_gimbal_perform_factory_tests_t packet_in = {
		5,72
    };
	mavlink_gimbal_perform_factory_tests_t packet1, packet2;
        memset(&packet1, 0, sizeof(packet1));
        	packet1.target_system = packet_in.target_system;
        	packet1.target_component = packet_in.target_component;
        
        

        memset(&packet2, 0, sizeof(packet2));
	mavlink_msg_gimbal_perform_factory_tests_encode(system_id, component_id, &msg, &packet1);
	mavlink_msg_gimbal_perform_factory_tests_decode(&msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);

        memset(&packet2, 0, sizeof(packet2));
	mavlink_msg_gimbal_perform_factory_tests_pack(system_id, component_id, &msg , packet1.target_system , packet1.target_component );
	mavlink_msg_gimbal_perform_factory_tests_decode(&msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);

        memset(&packet2, 0, sizeof(packet2));
	mavlink_msg_gimbal_perform_factory_tests_pack_chan(system_id, component_id, MAVLINK_COMM_0, &msg , packet1.target_system , packet1.target_component );
	mavlink_msg_gimbal_perform_factory_tests_decode(&msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);

        memset(&packet2, 0, sizeof(packet2));
        mavlink_msg_to_send_buffer(buffer, &msg);
        for (i=0; i<mavlink_msg_get_send_buffer_length(&msg); i++) {
        	comm_send_ch(MAVLINK_COMM_0, buffer[i]);
        }
	mavlink_msg_gimbal_perform_factory_tests_decode(last_msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);
        
        memset(&packet2, 0, sizeof(packet2));
	mavlink_msg_gimbal_perform_factory_tests_send(MAVLINK_COMM_1 , packet1.target_system , packet1.target_component );
	mavlink_msg_gimbal_perform_factory_tests_decode(last_msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);
}

static void mavlink_test_gimbal_report_factory_tests_progress(uint8_t system_id, uint8_t component_id, mavlink_message_t *last_msg)
{
	mavlink_message_t msg;
        uint8_t buffer[MAVLINK_MAX_PACKET_LEN];
        uint16_t i;
	mavlink_gimbal_report_factory_tests_progress_t packet_in = {
		5,72,139,206
    };
	mavlink_gimbal_report_factory_tests_progress_t packet1, packet2;
        memset(&packet1, 0, sizeof(packet1));
        	packet1.test = packet_in.test;
        	packet1.test_section = packet_in.test_section;
        	packet1.test_section_progress = packet_in.test_section_progress;
        	packet1.test_status = packet_in.test_status;
        
        

        memset(&packet2, 0, sizeof(packet2));
	mavlink_msg_gimbal_report_factory_tests_progress_encode(system_id, component_id, &msg, &packet1);
	mavlink_msg_gimbal_report_factory_tests_progress_decode(&msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);

        memset(&packet2, 0, sizeof(packet2));
	mavlink_msg_gimbal_report_factory_tests_progress_pack(system_id, component_id, &msg , packet1.test , packet1.test_section , packet1.test_section_progress , packet1.test_status );
	mavlink_msg_gimbal_report_factory_tests_progress_decode(&msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);

        memset(&packet2, 0, sizeof(packet2));
	mavlink_msg_gimbal_report_factory_tests_progress_pack_chan(system_id, component_id, MAVLINK_COMM_0, &msg , packet1.test , packet1.test_section , packet1.test_section_progress , packet1.test_status );
	mavlink_msg_gimbal_report_factory_tests_progress_decode(&msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);

        memset(&packet2, 0, sizeof(packet2));
        mavlink_msg_to_send_buffer(buffer, &msg);
        for (i=0; i<mavlink_msg_get_send_buffer_length(&msg); i++) {
        	comm_send_ch(MAVLINK_COMM_0, buffer[i]);
        }
	mavlink_msg_gimbal_report_factory_tests_progress_decode(last_msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);
        
        memset(&packet2, 0, sizeof(packet2));
	mavlink_msg_gimbal_report_factory_tests_progress_send(MAVLINK_COMM_1 , packet1.test , packet1.test_section , packet1.test_section_progress , packet1.test_status );
	mavlink_msg_gimbal_report_factory_tests_progress_decode(last_msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);
}

static void mavlink_test_gopro_power_on(uint8_t system_id, uint8_t component_id, mavlink_message_t *last_msg)
{
	mavlink_message_t msg;
        uint8_t buffer[MAVLINK_MAX_PACKET_LEN];
        uint16_t i;
	mavlink_gopro_power_on_t packet_in = {
		5,72
    };
	mavlink_gopro_power_on_t packet1, packet2;
        memset(&packet1, 0, sizeof(packet1));
        	packet1.target_system = packet_in.target_system;
        	packet1.target_component = packet_in.target_component;
        
        

        memset(&packet2, 0, sizeof(packet2));
	mavlink_msg_gopro_power_on_encode(system_id, component_id, &msg, &packet1);
	mavlink_msg_gopro_power_on_decode(&msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);

        memset(&packet2, 0, sizeof(packet2));
	mavlink_msg_gopro_power_on_pack(system_id, component_id, &msg , packet1.target_system , packet1.target_component );
	mavlink_msg_gopro_power_on_decode(&msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);

        memset(&packet2, 0, sizeof(packet2));
	mavlink_msg_gopro_power_on_pack_chan(system_id, component_id, MAVLINK_COMM_0, &msg , packet1.target_system , packet1.target_component );
	mavlink_msg_gopro_power_on_decode(&msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);

        memset(&packet2, 0, sizeof(packet2));
        mavlink_msg_to_send_buffer(buffer, &msg);
        for (i=0; i<mavlink_msg_get_send_buffer_length(&msg); i++) {
        	comm_send_ch(MAVLINK_COMM_0, buffer[i]);
        }
	mavlink_msg_gopro_power_on_decode(last_msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);
        
        memset(&packet2, 0, sizeof(packet2));
	mavlink_msg_gopro_power_on_send(MAVLINK_COMM_1 , packet1.target_system , packet1.target_component );
	mavlink_msg_gopro_power_on_decode(last_msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);
}

static void mavlink_test_gopro_power_off(uint8_t system_id, uint8_t component_id, mavlink_message_t *last_msg)
{
	mavlink_message_t msg;
        uint8_t buffer[MAVLINK_MAX_PACKET_LEN];
        uint16_t i;
	mavlink_gopro_power_off_t packet_in = {
		5,72
    };
	mavlink_gopro_power_off_t packet1, packet2;
        memset(&packet1, 0, sizeof(packet1));
        	packet1.target_system = packet_in.target_system;
        	packet1.target_component = packet_in.target_component;
        
        

        memset(&packet2, 0, sizeof(packet2));
	mavlink_msg_gopro_power_off_encode(system_id, component_id, &msg, &packet1);
	mavlink_msg_gopro_power_off_decode(&msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);

        memset(&packet2, 0, sizeof(packet2));
	mavlink_msg_gopro_power_off_pack(system_id, component_id, &msg , packet1.target_system , packet1.target_component );
	mavlink_msg_gopro_power_off_decode(&msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);

        memset(&packet2, 0, sizeof(packet2));
	mavlink_msg_gopro_power_off_pack_chan(system_id, component_id, MAVLINK_COMM_0, &msg , packet1.target_system , packet1.target_component );
	mavlink_msg_gopro_power_off_decode(&msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);

        memset(&packet2, 0, sizeof(packet2));
        mavlink_msg_to_send_buffer(buffer, &msg);
        for (i=0; i<mavlink_msg_get_send_buffer_length(&msg); i++) {
        	comm_send_ch(MAVLINK_COMM_0, buffer[i]);
        }
	mavlink_msg_gopro_power_off_decode(last_msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);
        
        memset(&packet2, 0, sizeof(packet2));
	mavlink_msg_gopro_power_off_send(MAVLINK_COMM_1 , packet1.target_system , packet1.target_component );
	mavlink_msg_gopro_power_off_decode(last_msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);
}

static void mavlink_test_gopro_command(uint8_t system_id, uint8_t component_id, mavlink_message_t *last_msg)
{
	mavlink_message_t msg;
        uint8_t buffer[MAVLINK_MAX_PACKET_LEN];
        uint16_t i;
	mavlink_gopro_command_t packet_in = {
		5,72,139,206,17
    };
	mavlink_gopro_command_t packet1, packet2;
        memset(&packet1, 0, sizeof(packet1));
        	packet1.target_system = packet_in.target_system;
        	packet1.target_component = packet_in.target_component;
        	packet1.gp_cmd_name_1 = packet_in.gp_cmd_name_1;
        	packet1.gp_cmd_name_2 = packet_in.gp_cmd_name_2;
        	packet1.gp_cmd_parm = packet_in.gp_cmd_parm;
        
        

        memset(&packet2, 0, sizeof(packet2));
	mavlink_msg_gopro_command_encode(system_id, component_id, &msg, &packet1);
	mavlink_msg_gopro_command_decode(&msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);

        memset(&packet2, 0, sizeof(packet2));
	mavlink_msg_gopro_command_pack(system_id, component_id, &msg , packet1.target_system , packet1.target_component , packet1.gp_cmd_name_1 , packet1.gp_cmd_name_2 , packet1.gp_cmd_parm );
	mavlink_msg_gopro_command_decode(&msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);

        memset(&packet2, 0, sizeof(packet2));
	mavlink_msg_gopro_command_pack_chan(system_id, component_id, MAVLINK_COMM_0, &msg , packet1.target_system , packet1.target_component , packet1.gp_cmd_name_1 , packet1.gp_cmd_name_2 , packet1.gp_cmd_parm );
	mavlink_msg_gopro_command_decode(&msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);

        memset(&packet2, 0, sizeof(packet2));
        mavlink_msg_to_send_buffer(buffer, &msg);
        for (i=0; i<mavlink_msg_get_send_buffer_length(&msg); i++) {
        	comm_send_ch(MAVLINK_COMM_0, buffer[i]);
        }
	mavlink_msg_gopro_command_decode(last_msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);
        
        memset(&packet2, 0, sizeof(packet2));
	mavlink_msg_gopro_command_send(MAVLINK_COMM_1 , packet1.target_system , packet1.target_component , packet1.gp_cmd_name_1 , packet1.gp_cmd_name_2 , packet1.gp_cmd_parm );
	mavlink_msg_gopro_command_decode(last_msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);
}

static void mavlink_test_gopro_response(uint8_t system_id, uint8_t component_id, mavlink_message_t *last_msg)
{
	mavlink_message_t msg;
        uint8_t buffer[MAVLINK_MAX_PACKET_LEN];
        uint16_t i;
	mavlink_gopro_response_t packet_in = {
		17235,139,206,17,84
    };
	mavlink_gopro_response_t packet1, packet2;
        memset(&packet1, 0, sizeof(packet1));
        	packet1.gp_cmd_result = packet_in.gp_cmd_result;
        	packet1.gp_cmd_name_1 = packet_in.gp_cmd_name_1;
        	packet1.gp_cmd_name_2 = packet_in.gp_cmd_name_2;
        	packet1.gp_cmd_response_status = packet_in.gp_cmd_response_status;
        	packet1.gp_cmd_response_argument = packet_in.gp_cmd_response_argument;
        
        

        memset(&packet2, 0, sizeof(packet2));
	mavlink_msg_gopro_response_encode(system_id, component_id, &msg, &packet1);
	mavlink_msg_gopro_response_decode(&msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);

        memset(&packet2, 0, sizeof(packet2));
	mavlink_msg_gopro_response_pack(system_id, component_id, &msg , packet1.gp_cmd_name_1 , packet1.gp_cmd_name_2 , packet1.gp_cmd_response_status , packet1.gp_cmd_response_argument , packet1.gp_cmd_result );
	mavlink_msg_gopro_response_decode(&msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);

        memset(&packet2, 0, sizeof(packet2));
	mavlink_msg_gopro_response_pack_chan(system_id, component_id, MAVLINK_COMM_0, &msg , packet1.gp_cmd_name_1 , packet1.gp_cmd_name_2 , packet1.gp_cmd_response_status , packet1.gp_cmd_response_argument , packet1.gp_cmd_result );
	mavlink_msg_gopro_response_decode(&msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);

        memset(&packet2, 0, sizeof(packet2));
        mavlink_msg_to_send_buffer(buffer, &msg);
        for (i=0; i<mavlink_msg_get_send_buffer_length(&msg); i++) {
        	comm_send_ch(MAVLINK_COMM_0, buffer[i]);
        }
	mavlink_msg_gopro_response_decode(last_msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);
        
        memset(&packet2, 0, sizeof(packet2));
	mavlink_msg_gopro_response_send(MAVLINK_COMM_1 , packet1.gp_cmd_name_1 , packet1.gp_cmd_name_2 , packet1.gp_cmd_response_status , packet1.gp_cmd_response_argument , packet1.gp_cmd_result );
	mavlink_msg_gopro_response_decode(last_msg, &packet2);
        MAVLINK_ASSERT(memcmp(&packet1, &packet2, sizeof(packet1)) == 0);
}

static void mavlink_test_ardupilotmega(uint8_t system_id, uint8_t component_id, mavlink_message_t *last_msg)
{
	mavlink_test_sensor_offsets(system_id, component_id, last_msg);
	mavlink_test_set_mag_offsets(system_id, component_id, last_msg);
	mavlink_test_meminfo(system_id, component_id, last_msg);
	mavlink_test_ap_adc(system_id, component_id, last_msg);
	mavlink_test_digicam_configure(system_id, component_id, last_msg);
	mavlink_test_digicam_control(system_id, component_id, last_msg);
	mavlink_test_mount_configure(system_id, component_id, last_msg);
	mavlink_test_mount_control(system_id, component_id, last_msg);
	mavlink_test_mount_status(system_id, component_id, last_msg);
	mavlink_test_fence_point(system_id, component_id, last_msg);
	mavlink_test_fence_fetch_point(system_id, component_id, last_msg);
	mavlink_test_fence_status(system_id, component_id, last_msg);
	mavlink_test_ahrs(system_id, component_id, last_msg);
	mavlink_test_simstate(system_id, component_id, last_msg);
	mavlink_test_hwstatus(system_id, component_id, last_msg);
	mavlink_test_radio(system_id, component_id, last_msg);
	mavlink_test_limits_status(system_id, component_id, last_msg);
	mavlink_test_wind(system_id, component_id, last_msg);
	mavlink_test_data16(system_id, component_id, last_msg);
	mavlink_test_data32(system_id, component_id, last_msg);
	mavlink_test_data64(system_id, component_id, last_msg);
	mavlink_test_data96(system_id, component_id, last_msg);
	mavlink_test_rangefinder(system_id, component_id, last_msg);
	mavlink_test_airspeed_autocal(system_id, component_id, last_msg);
	mavlink_test_rally_point(system_id, component_id, last_msg);
	mavlink_test_rally_fetch_point(system_id, component_id, last_msg);
	mavlink_test_compassmot_status(system_id, component_id, last_msg);
	mavlink_test_ahrs2(system_id, component_id, last_msg);
	mavlink_test_camera_status(system_id, component_id, last_msg);
	mavlink_test_camera_feedback(system_id, component_id, last_msg);
	mavlink_test_battery2(system_id, component_id, last_msg);
	mavlink_test_ahrs3(system_id, component_id, last_msg);
	mavlink_test_autopilot_version_request(system_id, component_id, last_msg);
	mavlink_test_led_control(system_id, component_id, last_msg);
	mavlink_test_mag_cal_progress(system_id, component_id, last_msg);
	mavlink_test_mag_cal_report(system_id, component_id, last_msg);
	mavlink_test_ekf_status_report(system_id, component_id, last_msg);
	mavlink_test_gimbal_report(system_id, component_id, last_msg);
	mavlink_test_gimbal_control(system_id, component_id, last_msg);
	mavlink_test_gimbal_reset(system_id, component_id, last_msg);
	mavlink_test_gimbal_axis_calibration_progress(system_id, component_id, last_msg);
	mavlink_test_gimbal_set_home_offsets(system_id, component_id, last_msg);
	mavlink_test_gimbal_home_offset_calibration_result(system_id, component_id, last_msg);
	mavlink_test_gimbal_set_factory_parameters(system_id, component_id, last_msg);
	mavlink_test_gimbal_factory_parameters_loaded(system_id, component_id, last_msg);
	mavlink_test_gimbal_erase_firmware_and_config(system_id, component_id, last_msg);
	mavlink_test_gimbal_perform_factory_tests(system_id, component_id, last_msg);
	mavlink_test_gimbal_report_factory_tests_progress(system_id, component_id, last_msg);
	mavlink_test_gopro_power_on(system_id, component_id, last_msg);
	mavlink_test_gopro_power_off(system_id, component_id, last_msg);
	mavlink_test_gopro_command(system_id, component_id, last_msg);
	mavlink_test_gopro_response(system_id, component_id, last_msg);
}

#ifdef __cplusplus
}
#endif // __cplusplus
#endif // ARDUPILOTMEGA_TESTSUITE_H
