// MESSAGE GIMBAL_CONTROL PACKING

#define MAVLINK_MSG_ID_GIMBAL_CONTROL 201

typedef struct __mavlink_gimbal_control_t
{
 float demanded_rate_x; ///< Demanded angular rate X (rad/s)
 float demanded_rate_y; ///< Demanded angular rate Y (rad/s)
 float demanded_rate_z; ///< Demanded angular rate Z (rad/s)
 uint8_t target_system; ///< System ID
 uint8_t target_component; ///< Component ID
} mavlink_gimbal_control_t;

#define MAVLINK_MSG_ID_GIMBAL_CONTROL_LEN 14
#define MAVLINK_MSG_ID_201_LEN 14

#define MAVLINK_MSG_ID_GIMBAL_CONTROL_CRC 205
#define MAVLINK_MSG_ID_201_CRC 205



#define MAVLINK_MESSAGE_INFO_GIMBAL_CONTROL { \
	"GIMBAL_CONTROL", \
	5, \
	{  { "demanded_rate_x", NULL, MAVLINK_TYPE_FLOAT, 0, 0, offsetof(mavlink_gimbal_control_t, demanded_rate_x) }, \
         { "demanded_rate_y", NULL, MAVLINK_TYPE_FLOAT, 0, 4, offsetof(mavlink_gimbal_control_t, demanded_rate_y) }, \
         { "demanded_rate_z", NULL, MAVLINK_TYPE_FLOAT, 0, 8, offsetof(mavlink_gimbal_control_t, demanded_rate_z) }, \
         { "target_system", NULL, MAVLINK_TYPE_UINT8_T, 0, 12, offsetof(mavlink_gimbal_control_t, target_system) }, \
         { "target_component", NULL, MAVLINK_TYPE_UINT8_T, 0, 13, offsetof(mavlink_gimbal_control_t, target_component) }, \
         } \
}


/**
 * @brief Pack a gimbal_control message
 * @param system_id ID of this system
 * @param component_id ID of this component (e.g. 200 for IMU)
 * @param msg The MAVLink message to compress the data into
 *
 * @param target_system System ID
 * @param target_component Component ID
 * @param demanded_rate_x Demanded angular rate X (rad/s)
 * @param demanded_rate_y Demanded angular rate Y (rad/s)
 * @param demanded_rate_z Demanded angular rate Z (rad/s)
 * @return length of the message in bytes (excluding serial stream start sign)
 */
static inline uint16_t mavlink_msg_gimbal_control_pack(uint8_t system_id, uint8_t component_id, mavlink_message_t* msg,
						       uint8_t target_system, uint8_t target_component, float demanded_rate_x, float demanded_rate_y, float demanded_rate_z)
{
#if MAVLINK_NEED_BYTE_SWAP || !MAVLINK_ALIGNED_FIELDS
	char buf[MAVLINK_MSG_ID_GIMBAL_CONTROL_LEN];
	_mav_put_float(buf, 0, demanded_rate_x);
	_mav_put_float(buf, 4, demanded_rate_y);
	_mav_put_float(buf, 8, demanded_rate_z);
	_mav_put_uint8_t(buf, 12, target_system);
	_mav_put_uint8_t(buf, 13, target_component);

        memcpy(_MAV_PAYLOAD_NON_CONST(msg), buf, MAVLINK_MSG_ID_GIMBAL_CONTROL_LEN);
#else
	mavlink_gimbal_control_t packet;
	packet.demanded_rate_x = demanded_rate_x;
	packet.demanded_rate_y = demanded_rate_y;
	packet.demanded_rate_z = demanded_rate_z;
	packet.target_system = target_system;
	packet.target_component = target_component;

        memcpy(_MAV_PAYLOAD_NON_CONST(msg), &packet, MAVLINK_MSG_ID_GIMBAL_CONTROL_LEN);
#endif

	msg->msgid = MAVLINK_MSG_ID_GIMBAL_CONTROL;
#if MAVLINK_CRC_EXTRA
    return mavlink_finalize_message(msg, system_id, component_id, MAVLINK_MSG_ID_GIMBAL_CONTROL_LEN, MAVLINK_MSG_ID_GIMBAL_CONTROL_CRC);
#else
    return mavlink_finalize_message(msg, system_id, component_id, MAVLINK_MSG_ID_GIMBAL_CONTROL_LEN);
#endif
}

/**
 * @brief Pack a gimbal_control message on a channel
 * @param system_id ID of this system
 * @param component_id ID of this component (e.g. 200 for IMU)
 * @param chan The MAVLink channel this message will be sent over
 * @param msg The MAVLink message to compress the data into
 * @param target_system System ID
 * @param target_component Component ID
 * @param demanded_rate_x Demanded angular rate X (rad/s)
 * @param demanded_rate_y Demanded angular rate Y (rad/s)
 * @param demanded_rate_z Demanded angular rate Z (rad/s)
 * @return length of the message in bytes (excluding serial stream start sign)
 */
static inline uint16_t mavlink_msg_gimbal_control_pack_chan(uint8_t system_id, uint8_t component_id, uint8_t chan,
							   mavlink_message_t* msg,
						           uint8_t target_system,uint8_t target_component,float demanded_rate_x,float demanded_rate_y,float demanded_rate_z)
{
#if MAVLINK_NEED_BYTE_SWAP || !MAVLINK_ALIGNED_FIELDS
	char buf[MAVLINK_MSG_ID_GIMBAL_CONTROL_LEN];
	_mav_put_float(buf, 0, demanded_rate_x);
	_mav_put_float(buf, 4, demanded_rate_y);
	_mav_put_float(buf, 8, demanded_rate_z);
	_mav_put_uint8_t(buf, 12, target_system);
	_mav_put_uint8_t(buf, 13, target_component);

        memcpy(_MAV_PAYLOAD_NON_CONST(msg), buf, MAVLINK_MSG_ID_GIMBAL_CONTROL_LEN);
#else
	mavlink_gimbal_control_t packet;
	packet.demanded_rate_x = demanded_rate_x;
	packet.demanded_rate_y = demanded_rate_y;
	packet.demanded_rate_z = demanded_rate_z;
	packet.target_system = target_system;
	packet.target_component = target_component;

        memcpy(_MAV_PAYLOAD_NON_CONST(msg), &packet, MAVLINK_MSG_ID_GIMBAL_CONTROL_LEN);
#endif

	msg->msgid = MAVLINK_MSG_ID_GIMBAL_CONTROL;
#if MAVLINK_CRC_EXTRA
    return mavlink_finalize_message_chan(msg, system_id, component_id, chan, MAVLINK_MSG_ID_GIMBAL_CONTROL_LEN, MAVLINK_MSG_ID_GIMBAL_CONTROL_CRC);
#else
    return mavlink_finalize_message_chan(msg, system_id, component_id, chan, MAVLINK_MSG_ID_GIMBAL_CONTROL_LEN);
#endif
}

/**
 * @brief Encode a gimbal_control struct
 *
 * @param system_id ID of this system
 * @param component_id ID of this component (e.g. 200 for IMU)
 * @param msg The MAVLink message to compress the data into
 * @param gimbal_control C-struct to read the message contents from
 */
static inline uint16_t mavlink_msg_gimbal_control_encode(uint8_t system_id, uint8_t component_id, mavlink_message_t* msg, const mavlink_gimbal_control_t* gimbal_control)
{
	return mavlink_msg_gimbal_control_pack(system_id, component_id, msg, gimbal_control->target_system, gimbal_control->target_component, gimbal_control->demanded_rate_x, gimbal_control->demanded_rate_y, gimbal_control->demanded_rate_z);
}

/**
 * @brief Encode a gimbal_control struct on a channel
 *
 * @param system_id ID of this system
 * @param component_id ID of this component (e.g. 200 for IMU)
 * @param chan The MAVLink channel this message will be sent over
 * @param msg The MAVLink message to compress the data into
 * @param gimbal_control C-struct to read the message contents from
 */
static inline uint16_t mavlink_msg_gimbal_control_encode_chan(uint8_t system_id, uint8_t component_id, uint8_t chan, mavlink_message_t* msg, const mavlink_gimbal_control_t* gimbal_control)
{
	return mavlink_msg_gimbal_control_pack_chan(system_id, component_id, chan, msg, gimbal_control->target_system, gimbal_control->target_component, gimbal_control->demanded_rate_x, gimbal_control->demanded_rate_y, gimbal_control->demanded_rate_z);
}

/**
 * @brief Send a gimbal_control message
 * @param chan MAVLink channel to send the message
 *
 * @param target_system System ID
 * @param target_component Component ID
 * @param demanded_rate_x Demanded angular rate X (rad/s)
 * @param demanded_rate_y Demanded angular rate Y (rad/s)
 * @param demanded_rate_z Demanded angular rate Z (rad/s)
 */
#ifdef MAVLINK_USE_CONVENIENCE_FUNCTIONS

static inline void mavlink_msg_gimbal_control_send(mavlink_channel_t chan, uint8_t target_system, uint8_t target_component, float demanded_rate_x, float demanded_rate_y, float demanded_rate_z)
{
#if MAVLINK_NEED_BYTE_SWAP || !MAVLINK_ALIGNED_FIELDS
	char buf[MAVLINK_MSG_ID_GIMBAL_CONTROL_LEN];
	_mav_put_float(buf, 0, demanded_rate_x);
	_mav_put_float(buf, 4, demanded_rate_y);
	_mav_put_float(buf, 8, demanded_rate_z);
	_mav_put_uint8_t(buf, 12, target_system);
	_mav_put_uint8_t(buf, 13, target_component);

#if MAVLINK_CRC_EXTRA
    _mav_finalize_message_chan_send(chan, MAVLINK_MSG_ID_GIMBAL_CONTROL, buf, MAVLINK_MSG_ID_GIMBAL_CONTROL_LEN, MAVLINK_MSG_ID_GIMBAL_CONTROL_CRC);
#else
    _mav_finalize_message_chan_send(chan, MAVLINK_MSG_ID_GIMBAL_CONTROL, buf, MAVLINK_MSG_ID_GIMBAL_CONTROL_LEN);
#endif
#else
	mavlink_gimbal_control_t packet;
	packet.demanded_rate_x = demanded_rate_x;
	packet.demanded_rate_y = demanded_rate_y;
	packet.demanded_rate_z = demanded_rate_z;
	packet.target_system = target_system;
	packet.target_component = target_component;

#if MAVLINK_CRC_EXTRA
    _mav_finalize_message_chan_send(chan, MAVLINK_MSG_ID_GIMBAL_CONTROL, (const char *)&packet, MAVLINK_MSG_ID_GIMBAL_CONTROL_LEN, MAVLINK_MSG_ID_GIMBAL_CONTROL_CRC);
#else
    _mav_finalize_message_chan_send(chan, MAVLINK_MSG_ID_GIMBAL_CONTROL, (const char *)&packet, MAVLINK_MSG_ID_GIMBAL_CONTROL_LEN);
#endif
#endif
}

#if MAVLINK_MSG_ID_GIMBAL_CONTROL_LEN <= MAVLINK_MAX_PAYLOAD_LEN
/*
  This varient of _send() can be used to save stack space by re-using
  memory from the receive buffer.  The caller provides a
  mavlink_message_t which is the size of a full mavlink message. This
  is usually the receive buffer for the channel, and allows a reply to an
  incoming message with minimum stack space usage.
 */
static inline void mavlink_msg_gimbal_control_send_buf(mavlink_message_t *msgbuf, mavlink_channel_t chan,  uint8_t target_system, uint8_t target_component, float demanded_rate_x, float demanded_rate_y, float demanded_rate_z)
{
#if MAVLINK_NEED_BYTE_SWAP || !MAVLINK_ALIGNED_FIELDS
	char *buf = (char *)msgbuf;
	_mav_put_float(buf, 0, demanded_rate_x);
	_mav_put_float(buf, 4, demanded_rate_y);
	_mav_put_float(buf, 8, demanded_rate_z);
	_mav_put_uint8_t(buf, 12, target_system);
	_mav_put_uint8_t(buf, 13, target_component);

#if MAVLINK_CRC_EXTRA
    _mav_finalize_message_chan_send(chan, MAVLINK_MSG_ID_GIMBAL_CONTROL, buf, MAVLINK_MSG_ID_GIMBAL_CONTROL_LEN, MAVLINK_MSG_ID_GIMBAL_CONTROL_CRC);
#else
    _mav_finalize_message_chan_send(chan, MAVLINK_MSG_ID_GIMBAL_CONTROL, buf, MAVLINK_MSG_ID_GIMBAL_CONTROL_LEN);
#endif
#else
	mavlink_gimbal_control_t *packet = (mavlink_gimbal_control_t *)msgbuf;
	packet->demanded_rate_x = demanded_rate_x;
	packet->demanded_rate_y = demanded_rate_y;
	packet->demanded_rate_z = demanded_rate_z;
	packet->target_system = target_system;
	packet->target_component = target_component;

#if MAVLINK_CRC_EXTRA
    _mav_finalize_message_chan_send(chan, MAVLINK_MSG_ID_GIMBAL_CONTROL, (const char *)packet, MAVLINK_MSG_ID_GIMBAL_CONTROL_LEN, MAVLINK_MSG_ID_GIMBAL_CONTROL_CRC);
#else
    _mav_finalize_message_chan_send(chan, MAVLINK_MSG_ID_GIMBAL_CONTROL, (const char *)packet, MAVLINK_MSG_ID_GIMBAL_CONTROL_LEN);
#endif
#endif
}
#endif

#endif

// MESSAGE GIMBAL_CONTROL UNPACKING


/**
 * @brief Get field target_system from gimbal_control message
 *
 * @return System ID
 */
static inline uint8_t mavlink_msg_gimbal_control_get_target_system(const mavlink_message_t* msg)
{
	return _MAV_RETURN_uint8_t(msg,  12);
}

/**
 * @brief Get field target_component from gimbal_control message
 *
 * @return Component ID
 */
static inline uint8_t mavlink_msg_gimbal_control_get_target_component(const mavlink_message_t* msg)
{
	return _MAV_RETURN_uint8_t(msg,  13);
}

/**
 * @brief Get field demanded_rate_x from gimbal_control message
 *
 * @return Demanded angular rate X (rad/s)
 */
static inline float mavlink_msg_gimbal_control_get_demanded_rate_x(const mavlink_message_t* msg)
{
	return _MAV_RETURN_float(msg,  0);
}

/**
 * @brief Get field demanded_rate_y from gimbal_control message
 *
 * @return Demanded angular rate Y (rad/s)
 */
static inline float mavlink_msg_gimbal_control_get_demanded_rate_y(const mavlink_message_t* msg)
{
	return _MAV_RETURN_float(msg,  4);
}

/**
 * @brief Get field demanded_rate_z from gimbal_control message
 *
 * @return Demanded angular rate Z (rad/s)
 */
static inline float mavlink_msg_gimbal_control_get_demanded_rate_z(const mavlink_message_t* msg)
{
	return _MAV_RETURN_float(msg,  8);
}

/**
 * @brief Decode a gimbal_control message into a struct
 *
 * @param msg The message to decode
 * @param gimbal_control C-struct to decode the message contents into
 */
static inline void mavlink_msg_gimbal_control_decode(const mavlink_message_t* msg, mavlink_gimbal_control_t* gimbal_control)
{
#if MAVLINK_NEED_BYTE_SWAP
	gimbal_control->demanded_rate_x = mavlink_msg_gimbal_control_get_demanded_rate_x(msg);
	gimbal_control->demanded_rate_y = mavlink_msg_gimbal_control_get_demanded_rate_y(msg);
	gimbal_control->demanded_rate_z = mavlink_msg_gimbal_control_get_demanded_rate_z(msg);
	gimbal_control->target_system = mavlink_msg_gimbal_control_get_target_system(msg);
	gimbal_control->target_component = mavlink_msg_gimbal_control_get_target_component(msg);
#else
	memcpy(gimbal_control, _MAV_PAYLOAD(msg), MAVLINK_MSG_ID_GIMBAL_CONTROL_LEN);
#endif
}
