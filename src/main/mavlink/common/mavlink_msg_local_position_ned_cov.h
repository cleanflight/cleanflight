// MESSAGE LOCAL_POSITION_NED_COV PACKING

#define MAVLINK_MSG_ID_LOCAL_POSITION_NED_COV 64

typedef struct __mavlink_local_position_ned_cov_t
{
 uint64_t time_utc; ///< Timestamp (microseconds since UNIX epoch) in UTC. 0 for unknown. Commonly filled by the precision time source of a GPS receiver.
 uint32_t time_boot_ms; ///< Timestamp (milliseconds since system boot). 0 for system without monotonic timestamp
 float x; ///< X Position
 float y; ///< Y Position
 float z; ///< Z Position
 float vx; ///< X Speed (m/s)
 float vy; ///< Y Speed (m/s)
 float vz; ///< Z Speed (m/s)
 float ax; ///< X Acceleration (m/s^2)
 float ay; ///< Y Acceleration (m/s^2)
 float az; ///< Z Acceleration (m/s^2)
 float covariance[45]; ///< Covariance matrix upper right triangular (first nine entries are the first ROW, next eight entries are the second row, etc.)
 uint8_t estimator_type; ///< Class id of the estimator this estimate originated from.
} mavlink_local_position_ned_cov_t;

#define MAVLINK_MSG_ID_LOCAL_POSITION_NED_COV_LEN 229
#define MAVLINK_MSG_ID_64_LEN 229

#define MAVLINK_MSG_ID_LOCAL_POSITION_NED_COV_CRC 59
#define MAVLINK_MSG_ID_64_CRC 59

#define MAVLINK_MSG_LOCAL_POSITION_NED_COV_FIELD_COVARIANCE_LEN 45

#define MAVLINK_MESSAGE_INFO_LOCAL_POSITION_NED_COV { \
	"LOCAL_POSITION_NED_COV", \
	13, \
	{  { "time_utc", NULL, MAVLINK_TYPE_UINT64_T, 0, 0, offsetof(mavlink_local_position_ned_cov_t, time_utc) }, \
         { "time_boot_ms", NULL, MAVLINK_TYPE_UINT32_T, 0, 8, offsetof(mavlink_local_position_ned_cov_t, time_boot_ms) }, \
         { "x", NULL, MAVLINK_TYPE_FLOAT, 0, 12, offsetof(mavlink_local_position_ned_cov_t, x) }, \
         { "y", NULL, MAVLINK_TYPE_FLOAT, 0, 16, offsetof(mavlink_local_position_ned_cov_t, y) }, \
         { "z", NULL, MAVLINK_TYPE_FLOAT, 0, 20, offsetof(mavlink_local_position_ned_cov_t, z) }, \
         { "vx", NULL, MAVLINK_TYPE_FLOAT, 0, 24, offsetof(mavlink_local_position_ned_cov_t, vx) }, \
         { "vy", NULL, MAVLINK_TYPE_FLOAT, 0, 28, offsetof(mavlink_local_position_ned_cov_t, vy) }, \
         { "vz", NULL, MAVLINK_TYPE_FLOAT, 0, 32, offsetof(mavlink_local_position_ned_cov_t, vz) }, \
         { "ax", NULL, MAVLINK_TYPE_FLOAT, 0, 36, offsetof(mavlink_local_position_ned_cov_t, ax) }, \
         { "ay", NULL, MAVLINK_TYPE_FLOAT, 0, 40, offsetof(mavlink_local_position_ned_cov_t, ay) }, \
         { "az", NULL, MAVLINK_TYPE_FLOAT, 0, 44, offsetof(mavlink_local_position_ned_cov_t, az) }, \
         { "covariance", NULL, MAVLINK_TYPE_FLOAT, 45, 48, offsetof(mavlink_local_position_ned_cov_t, covariance) }, \
         { "estimator_type", NULL, MAVLINK_TYPE_UINT8_T, 0, 228, offsetof(mavlink_local_position_ned_cov_t, estimator_type) }, \
         } \
}


/**
 * @brief Pack a local_position_ned_cov message
 * @param system_id ID of this system
 * @param component_id ID of this component (e.g. 200 for IMU)
 * @param msg The MAVLink message to compress the data into
 *
 * @param time_boot_ms Timestamp (milliseconds since system boot). 0 for system without monotonic timestamp
 * @param time_utc Timestamp (microseconds since UNIX epoch) in UTC. 0 for unknown. Commonly filled by the precision time source of a GPS receiver.
 * @param estimator_type Class id of the estimator this estimate originated from.
 * @param x X Position
 * @param y Y Position
 * @param z Z Position
 * @param vx X Speed (m/s)
 * @param vy Y Speed (m/s)
 * @param vz Z Speed (m/s)
 * @param ax X Acceleration (m/s^2)
 * @param ay Y Acceleration (m/s^2)
 * @param az Z Acceleration (m/s^2)
 * @param covariance Covariance matrix upper right triangular (first nine entries are the first ROW, next eight entries are the second row, etc.)
 * @return length of the message in bytes (excluding serial stream start sign)
 */
static inline uint16_t mavlink_msg_local_position_ned_cov_pack(uint8_t system_id, uint8_t component_id, mavlink_message_t* msg,
						       uint32_t time_boot_ms, uint64_t time_utc, uint8_t estimator_type, float x, float y, float z, float vx, float vy, float vz, float ax, float ay, float az, const float *covariance)
{
#if MAVLINK_NEED_BYTE_SWAP || !MAVLINK_ALIGNED_FIELDS
	char buf[MAVLINK_MSG_ID_LOCAL_POSITION_NED_COV_LEN];
	_mav_put_uint64_t(buf, 0, time_utc);
	_mav_put_uint32_t(buf, 8, time_boot_ms);
	_mav_put_float(buf, 12, x);
	_mav_put_float(buf, 16, y);
	_mav_put_float(buf, 20, z);
	_mav_put_float(buf, 24, vx);
	_mav_put_float(buf, 28, vy);
	_mav_put_float(buf, 32, vz);
	_mav_put_float(buf, 36, ax);
	_mav_put_float(buf, 40, ay);
	_mav_put_float(buf, 44, az);
	_mav_put_uint8_t(buf, 228, estimator_type);
	_mav_put_float_array(buf, 48, covariance, 45);
        memcpy(_MAV_PAYLOAD_NON_CONST(msg), buf, MAVLINK_MSG_ID_LOCAL_POSITION_NED_COV_LEN);
#else
	mavlink_local_position_ned_cov_t packet;
	packet.time_utc = time_utc;
	packet.time_boot_ms = time_boot_ms;
	packet.x = x;
	packet.y = y;
	packet.z = z;
	packet.vx = vx;
	packet.vy = vy;
	packet.vz = vz;
	packet.ax = ax;
	packet.ay = ay;
	packet.az = az;
	packet.estimator_type = estimator_type;
	mav_array_memcpy(packet.covariance, covariance, sizeof(float)*45);
        memcpy(_MAV_PAYLOAD_NON_CONST(msg), &packet, MAVLINK_MSG_ID_LOCAL_POSITION_NED_COV_LEN);
#endif

	msg->msgid = MAVLINK_MSG_ID_LOCAL_POSITION_NED_COV;
#if MAVLINK_CRC_EXTRA
    return mavlink_finalize_message(msg, system_id, component_id, MAVLINK_MSG_ID_LOCAL_POSITION_NED_COV_LEN, MAVLINK_MSG_ID_LOCAL_POSITION_NED_COV_CRC);
#else
    return mavlink_finalize_message(msg, system_id, component_id, MAVLINK_MSG_ID_LOCAL_POSITION_NED_COV_LEN);
#endif
}

/**
 * @brief Pack a local_position_ned_cov message on a channel
 * @param system_id ID of this system
 * @param component_id ID of this component (e.g. 200 for IMU)
 * @param chan The MAVLink channel this message will be sent over
 * @param msg The MAVLink message to compress the data into
 * @param time_boot_ms Timestamp (milliseconds since system boot). 0 for system without monotonic timestamp
 * @param time_utc Timestamp (microseconds since UNIX epoch) in UTC. 0 for unknown. Commonly filled by the precision time source of a GPS receiver.
 * @param estimator_type Class id of the estimator this estimate originated from.
 * @param x X Position
 * @param y Y Position
 * @param z Z Position
 * @param vx X Speed (m/s)
 * @param vy Y Speed (m/s)
 * @param vz Z Speed (m/s)
 * @param ax X Acceleration (m/s^2)
 * @param ay Y Acceleration (m/s^2)
 * @param az Z Acceleration (m/s^2)
 * @param covariance Covariance matrix upper right triangular (first nine entries are the first ROW, next eight entries are the second row, etc.)
 * @return length of the message in bytes (excluding serial stream start sign)
 */
static inline uint16_t mavlink_msg_local_position_ned_cov_pack_chan(uint8_t system_id, uint8_t component_id, uint8_t chan,
							   mavlink_message_t* msg,
						           uint32_t time_boot_ms,uint64_t time_utc,uint8_t estimator_type,float x,float y,float z,float vx,float vy,float vz,float ax,float ay,float az,const float *covariance)
{
#if MAVLINK_NEED_BYTE_SWAP || !MAVLINK_ALIGNED_FIELDS
	char buf[MAVLINK_MSG_ID_LOCAL_POSITION_NED_COV_LEN];
	_mav_put_uint64_t(buf, 0, time_utc);
	_mav_put_uint32_t(buf, 8, time_boot_ms);
	_mav_put_float(buf, 12, x);
	_mav_put_float(buf, 16, y);
	_mav_put_float(buf, 20, z);
	_mav_put_float(buf, 24, vx);
	_mav_put_float(buf, 28, vy);
	_mav_put_float(buf, 32, vz);
	_mav_put_float(buf, 36, ax);
	_mav_put_float(buf, 40, ay);
	_mav_put_float(buf, 44, az);
	_mav_put_uint8_t(buf, 228, estimator_type);
	_mav_put_float_array(buf, 48, covariance, 45);
        memcpy(_MAV_PAYLOAD_NON_CONST(msg), buf, MAVLINK_MSG_ID_LOCAL_POSITION_NED_COV_LEN);
#else
	mavlink_local_position_ned_cov_t packet;
	packet.time_utc = time_utc;
	packet.time_boot_ms = time_boot_ms;
	packet.x = x;
	packet.y = y;
	packet.z = z;
	packet.vx = vx;
	packet.vy = vy;
	packet.vz = vz;
	packet.ax = ax;
	packet.ay = ay;
	packet.az = az;
	packet.estimator_type = estimator_type;
	mav_array_memcpy(packet.covariance, covariance, sizeof(float)*45);
        memcpy(_MAV_PAYLOAD_NON_CONST(msg), &packet, MAVLINK_MSG_ID_LOCAL_POSITION_NED_COV_LEN);
#endif

	msg->msgid = MAVLINK_MSG_ID_LOCAL_POSITION_NED_COV;
#if MAVLINK_CRC_EXTRA
    return mavlink_finalize_message_chan(msg, system_id, component_id, chan, MAVLINK_MSG_ID_LOCAL_POSITION_NED_COV_LEN, MAVLINK_MSG_ID_LOCAL_POSITION_NED_COV_CRC);
#else
    return mavlink_finalize_message_chan(msg, system_id, component_id, chan, MAVLINK_MSG_ID_LOCAL_POSITION_NED_COV_LEN);
#endif
}

/**
 * @brief Encode a local_position_ned_cov struct
 *
 * @param system_id ID of this system
 * @param component_id ID of this component (e.g. 200 for IMU)
 * @param msg The MAVLink message to compress the data into
 * @param local_position_ned_cov C-struct to read the message contents from
 */
static inline uint16_t mavlink_msg_local_position_ned_cov_encode(uint8_t system_id, uint8_t component_id, mavlink_message_t* msg, const mavlink_local_position_ned_cov_t* local_position_ned_cov)
{
	return mavlink_msg_local_position_ned_cov_pack(system_id, component_id, msg, local_position_ned_cov->time_boot_ms, local_position_ned_cov->time_utc, local_position_ned_cov->estimator_type, local_position_ned_cov->x, local_position_ned_cov->y, local_position_ned_cov->z, local_position_ned_cov->vx, local_position_ned_cov->vy, local_position_ned_cov->vz, local_position_ned_cov->ax, local_position_ned_cov->ay, local_position_ned_cov->az, local_position_ned_cov->covariance);
}

/**
 * @brief Encode a local_position_ned_cov struct on a channel
 *
 * @param system_id ID of this system
 * @param component_id ID of this component (e.g. 200 for IMU)
 * @param chan The MAVLink channel this message will be sent over
 * @param msg The MAVLink message to compress the data into
 * @param local_position_ned_cov C-struct to read the message contents from
 */
static inline uint16_t mavlink_msg_local_position_ned_cov_encode_chan(uint8_t system_id, uint8_t component_id, uint8_t chan, mavlink_message_t* msg, const mavlink_local_position_ned_cov_t* local_position_ned_cov)
{
	return mavlink_msg_local_position_ned_cov_pack_chan(system_id, component_id, chan, msg, local_position_ned_cov->time_boot_ms, local_position_ned_cov->time_utc, local_position_ned_cov->estimator_type, local_position_ned_cov->x, local_position_ned_cov->y, local_position_ned_cov->z, local_position_ned_cov->vx, local_position_ned_cov->vy, local_position_ned_cov->vz, local_position_ned_cov->ax, local_position_ned_cov->ay, local_position_ned_cov->az, local_position_ned_cov->covariance);
}

/**
 * @brief Send a local_position_ned_cov message
 * @param chan MAVLink channel to send the message
 *
 * @param time_boot_ms Timestamp (milliseconds since system boot). 0 for system without monotonic timestamp
 * @param time_utc Timestamp (microseconds since UNIX epoch) in UTC. 0 for unknown. Commonly filled by the precision time source of a GPS receiver.
 * @param estimator_type Class id of the estimator this estimate originated from.
 * @param x X Position
 * @param y Y Position
 * @param z Z Position
 * @param vx X Speed (m/s)
 * @param vy Y Speed (m/s)
 * @param vz Z Speed (m/s)
 * @param ax X Acceleration (m/s^2)
 * @param ay Y Acceleration (m/s^2)
 * @param az Z Acceleration (m/s^2)
 * @param covariance Covariance matrix upper right triangular (first nine entries are the first ROW, next eight entries are the second row, etc.)
 */
#ifdef MAVLINK_USE_CONVENIENCE_FUNCTIONS

static inline void mavlink_msg_local_position_ned_cov_send(mavlink_channel_t chan, uint32_t time_boot_ms, uint64_t time_utc, uint8_t estimator_type, float x, float y, float z, float vx, float vy, float vz, float ax, float ay, float az, const float *covariance)
{
#if MAVLINK_NEED_BYTE_SWAP || !MAVLINK_ALIGNED_FIELDS
	char buf[MAVLINK_MSG_ID_LOCAL_POSITION_NED_COV_LEN];
	_mav_put_uint64_t(buf, 0, time_utc);
	_mav_put_uint32_t(buf, 8, time_boot_ms);
	_mav_put_float(buf, 12, x);
	_mav_put_float(buf, 16, y);
	_mav_put_float(buf, 20, z);
	_mav_put_float(buf, 24, vx);
	_mav_put_float(buf, 28, vy);
	_mav_put_float(buf, 32, vz);
	_mav_put_float(buf, 36, ax);
	_mav_put_float(buf, 40, ay);
	_mav_put_float(buf, 44, az);
	_mav_put_uint8_t(buf, 228, estimator_type);
	_mav_put_float_array(buf, 48, covariance, 45);
#if MAVLINK_CRC_EXTRA
    _mav_finalize_message_chan_send(chan, MAVLINK_MSG_ID_LOCAL_POSITION_NED_COV, buf, MAVLINK_MSG_ID_LOCAL_POSITION_NED_COV_LEN, MAVLINK_MSG_ID_LOCAL_POSITION_NED_COV_CRC);
#else
    _mav_finalize_message_chan_send(chan, MAVLINK_MSG_ID_LOCAL_POSITION_NED_COV, buf, MAVLINK_MSG_ID_LOCAL_POSITION_NED_COV_LEN);
#endif
#else
	mavlink_local_position_ned_cov_t packet;
	packet.time_utc = time_utc;
	packet.time_boot_ms = time_boot_ms;
	packet.x = x;
	packet.y = y;
	packet.z = z;
	packet.vx = vx;
	packet.vy = vy;
	packet.vz = vz;
	packet.ax = ax;
	packet.ay = ay;
	packet.az = az;
	packet.estimator_type = estimator_type;
	mav_array_memcpy(packet.covariance, covariance, sizeof(float)*45);
#if MAVLINK_CRC_EXTRA
    _mav_finalize_message_chan_send(chan, MAVLINK_MSG_ID_LOCAL_POSITION_NED_COV, (const char *)&packet, MAVLINK_MSG_ID_LOCAL_POSITION_NED_COV_LEN, MAVLINK_MSG_ID_LOCAL_POSITION_NED_COV_CRC);
#else
    _mav_finalize_message_chan_send(chan, MAVLINK_MSG_ID_LOCAL_POSITION_NED_COV, (const char *)&packet, MAVLINK_MSG_ID_LOCAL_POSITION_NED_COV_LEN);
#endif
#endif
}

#if MAVLINK_MSG_ID_LOCAL_POSITION_NED_COV_LEN <= MAVLINK_MAX_PAYLOAD_LEN
/*
  This varient of _send() can be used to save stack space by re-using
  memory from the receive buffer.  The caller provides a
  mavlink_message_t which is the size of a full mavlink message. This
  is usually the receive buffer for the channel, and allows a reply to an
  incoming message with minimum stack space usage.
 */
static inline void mavlink_msg_local_position_ned_cov_send_buf(mavlink_message_t *msgbuf, mavlink_channel_t chan,  uint32_t time_boot_ms, uint64_t time_utc, uint8_t estimator_type, float x, float y, float z, float vx, float vy, float vz, float ax, float ay, float az, const float *covariance)
{
#if MAVLINK_NEED_BYTE_SWAP || !MAVLINK_ALIGNED_FIELDS
	char *buf = (char *)msgbuf;
	_mav_put_uint64_t(buf, 0, time_utc);
	_mav_put_uint32_t(buf, 8, time_boot_ms);
	_mav_put_float(buf, 12, x);
	_mav_put_float(buf, 16, y);
	_mav_put_float(buf, 20, z);
	_mav_put_float(buf, 24, vx);
	_mav_put_float(buf, 28, vy);
	_mav_put_float(buf, 32, vz);
	_mav_put_float(buf, 36, ax);
	_mav_put_float(buf, 40, ay);
	_mav_put_float(buf, 44, az);
	_mav_put_uint8_t(buf, 228, estimator_type);
	_mav_put_float_array(buf, 48, covariance, 45);
#if MAVLINK_CRC_EXTRA
    _mav_finalize_message_chan_send(chan, MAVLINK_MSG_ID_LOCAL_POSITION_NED_COV, buf, MAVLINK_MSG_ID_LOCAL_POSITION_NED_COV_LEN, MAVLINK_MSG_ID_LOCAL_POSITION_NED_COV_CRC);
#else
    _mav_finalize_message_chan_send(chan, MAVLINK_MSG_ID_LOCAL_POSITION_NED_COV, buf, MAVLINK_MSG_ID_LOCAL_POSITION_NED_COV_LEN);
#endif
#else
	mavlink_local_position_ned_cov_t *packet = (mavlink_local_position_ned_cov_t *)msgbuf;
	packet->time_utc = time_utc;
	packet->time_boot_ms = time_boot_ms;
	packet->x = x;
	packet->y = y;
	packet->z = z;
	packet->vx = vx;
	packet->vy = vy;
	packet->vz = vz;
	packet->ax = ax;
	packet->ay = ay;
	packet->az = az;
	packet->estimator_type = estimator_type;
	mav_array_memcpy(packet->covariance, covariance, sizeof(float)*45);
#if MAVLINK_CRC_EXTRA
    _mav_finalize_message_chan_send(chan, MAVLINK_MSG_ID_LOCAL_POSITION_NED_COV, (const char *)packet, MAVLINK_MSG_ID_LOCAL_POSITION_NED_COV_LEN, MAVLINK_MSG_ID_LOCAL_POSITION_NED_COV_CRC);
#else
    _mav_finalize_message_chan_send(chan, MAVLINK_MSG_ID_LOCAL_POSITION_NED_COV, (const char *)packet, MAVLINK_MSG_ID_LOCAL_POSITION_NED_COV_LEN);
#endif
#endif
}
#endif

#endif

// MESSAGE LOCAL_POSITION_NED_COV UNPACKING


/**
 * @brief Get field time_boot_ms from local_position_ned_cov message
 *
 * @return Timestamp (milliseconds since system boot). 0 for system without monotonic timestamp
 */
static inline uint32_t mavlink_msg_local_position_ned_cov_get_time_boot_ms(const mavlink_message_t* msg)
{
	return _MAV_RETURN_uint32_t(msg,  8);
}

/**
 * @brief Get field time_utc from local_position_ned_cov message
 *
 * @return Timestamp (microseconds since UNIX epoch) in UTC. 0 for unknown. Commonly filled by the precision time source of a GPS receiver.
 */
static inline uint64_t mavlink_msg_local_position_ned_cov_get_time_utc(const mavlink_message_t* msg)
{
	return _MAV_RETURN_uint64_t(msg,  0);
}

/**
 * @brief Get field estimator_type from local_position_ned_cov message
 *
 * @return Class id of the estimator this estimate originated from.
 */
static inline uint8_t mavlink_msg_local_position_ned_cov_get_estimator_type(const mavlink_message_t* msg)
{
	return _MAV_RETURN_uint8_t(msg,  228);
}

/**
 * @brief Get field x from local_position_ned_cov message
 *
 * @return X Position
 */
static inline float mavlink_msg_local_position_ned_cov_get_x(const mavlink_message_t* msg)
{
	return _MAV_RETURN_float(msg,  12);
}

/**
 * @brief Get field y from local_position_ned_cov message
 *
 * @return Y Position
 */
static inline float mavlink_msg_local_position_ned_cov_get_y(const mavlink_message_t* msg)
{
	return _MAV_RETURN_float(msg,  16);
}

/**
 * @brief Get field z from local_position_ned_cov message
 *
 * @return Z Position
 */
static inline float mavlink_msg_local_position_ned_cov_get_z(const mavlink_message_t* msg)
{
	return _MAV_RETURN_float(msg,  20);
}

/**
 * @brief Get field vx from local_position_ned_cov message
 *
 * @return X Speed (m/s)
 */
static inline float mavlink_msg_local_position_ned_cov_get_vx(const mavlink_message_t* msg)
{
	return _MAV_RETURN_float(msg,  24);
}

/**
 * @brief Get field vy from local_position_ned_cov message
 *
 * @return Y Speed (m/s)
 */
static inline float mavlink_msg_local_position_ned_cov_get_vy(const mavlink_message_t* msg)
{
	return _MAV_RETURN_float(msg,  28);
}

/**
 * @brief Get field vz from local_position_ned_cov message
 *
 * @return Z Speed (m/s)
 */
static inline float mavlink_msg_local_position_ned_cov_get_vz(const mavlink_message_t* msg)
{
	return _MAV_RETURN_float(msg,  32);
}

/**
 * @brief Get field ax from local_position_ned_cov message
 *
 * @return X Acceleration (m/s^2)
 */
static inline float mavlink_msg_local_position_ned_cov_get_ax(const mavlink_message_t* msg)
{
	return _MAV_RETURN_float(msg,  36);
}

/**
 * @brief Get field ay from local_position_ned_cov message
 *
 * @return Y Acceleration (m/s^2)
 */
static inline float mavlink_msg_local_position_ned_cov_get_ay(const mavlink_message_t* msg)
{
	return _MAV_RETURN_float(msg,  40);
}

/**
 * @brief Get field az from local_position_ned_cov message
 *
 * @return Z Acceleration (m/s^2)
 */
static inline float mavlink_msg_local_position_ned_cov_get_az(const mavlink_message_t* msg)
{
	return _MAV_RETURN_float(msg,  44);
}

/**
 * @brief Get field covariance from local_position_ned_cov message
 *
 * @return Covariance matrix upper right triangular (first nine entries are the first ROW, next eight entries are the second row, etc.)
 */
static inline uint16_t mavlink_msg_local_position_ned_cov_get_covariance(const mavlink_message_t* msg, float *covariance)
{
	return _MAV_RETURN_float_array(msg, covariance, 45,  48);
}

/**
 * @brief Decode a local_position_ned_cov message into a struct
 *
 * @param msg The message to decode
 * @param local_position_ned_cov C-struct to decode the message contents into
 */
static inline void mavlink_msg_local_position_ned_cov_decode(const mavlink_message_t* msg, mavlink_local_position_ned_cov_t* local_position_ned_cov)
{
#if MAVLINK_NEED_BYTE_SWAP
	local_position_ned_cov->time_utc = mavlink_msg_local_position_ned_cov_get_time_utc(msg);
	local_position_ned_cov->time_boot_ms = mavlink_msg_local_position_ned_cov_get_time_boot_ms(msg);
	local_position_ned_cov->x = mavlink_msg_local_position_ned_cov_get_x(msg);
	local_position_ned_cov->y = mavlink_msg_local_position_ned_cov_get_y(msg);
	local_position_ned_cov->z = mavlink_msg_local_position_ned_cov_get_z(msg);
	local_position_ned_cov->vx = mavlink_msg_local_position_ned_cov_get_vx(msg);
	local_position_ned_cov->vy = mavlink_msg_local_position_ned_cov_get_vy(msg);
	local_position_ned_cov->vz = mavlink_msg_local_position_ned_cov_get_vz(msg);
	local_position_ned_cov->ax = mavlink_msg_local_position_ned_cov_get_ax(msg);
	local_position_ned_cov->ay = mavlink_msg_local_position_ned_cov_get_ay(msg);
	local_position_ned_cov->az = mavlink_msg_local_position_ned_cov_get_az(msg);
	mavlink_msg_local_position_ned_cov_get_covariance(msg, local_position_ned_cov->covariance);
	local_position_ned_cov->estimator_type = mavlink_msg_local_position_ned_cov_get_estimator_type(msg);
#else
	memcpy(local_position_ned_cov, _MAV_PAYLOAD(msg), MAVLINK_MSG_ID_LOCAL_POSITION_NED_COV_LEN);
#endif
}
