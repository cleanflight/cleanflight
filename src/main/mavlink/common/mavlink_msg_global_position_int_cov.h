// MESSAGE GLOBAL_POSITION_INT_COV PACKING

#define MAVLINK_MSG_ID_GLOBAL_POSITION_INT_COV 63

typedef struct __mavlink_global_position_int_cov_t
{
 uint64_t time_utc; ///< Timestamp (microseconds since UNIX epoch) in UTC. 0 for unknown. Commonly filled by the precision time source of a GPS receiver.
 uint32_t time_boot_ms; ///< Timestamp (milliseconds since system boot)
 int32_t lat; ///< Latitude, expressed as degrees * 1E7
 int32_t lon; ///< Longitude, expressed as degrees * 1E7
 int32_t alt; ///< Altitude in meters, expressed as * 1000 (millimeters), above MSL
 int32_t relative_alt; ///< Altitude above ground in meters, expressed as * 1000 (millimeters)
 float vx; ///< Ground X Speed (Latitude), expressed as m/s
 float vy; ///< Ground Y Speed (Longitude), expressed as m/s
 float vz; ///< Ground Z Speed (Altitude), expressed as m/s
 float covariance[36]; ///< Covariance matrix (first six entries are the first ROW, next six entries are the second row, etc.)
 uint8_t estimator_type; ///< Class id of the estimator this estimate originated from.
} mavlink_global_position_int_cov_t;

#define MAVLINK_MSG_ID_GLOBAL_POSITION_INT_COV_LEN 185
#define MAVLINK_MSG_ID_63_LEN 185

#define MAVLINK_MSG_ID_GLOBAL_POSITION_INT_COV_CRC 51
#define MAVLINK_MSG_ID_63_CRC 51

#define MAVLINK_MSG_GLOBAL_POSITION_INT_COV_FIELD_COVARIANCE_LEN 36

#define MAVLINK_MESSAGE_INFO_GLOBAL_POSITION_INT_COV { \
	"GLOBAL_POSITION_INT_COV", \
	11, \
	{  { "time_utc", NULL, MAVLINK_TYPE_UINT64_T, 0, 0, offsetof(mavlink_global_position_int_cov_t, time_utc) }, \
         { "time_boot_ms", NULL, MAVLINK_TYPE_UINT32_T, 0, 8, offsetof(mavlink_global_position_int_cov_t, time_boot_ms) }, \
         { "lat", NULL, MAVLINK_TYPE_INT32_T, 0, 12, offsetof(mavlink_global_position_int_cov_t, lat) }, \
         { "lon", NULL, MAVLINK_TYPE_INT32_T, 0, 16, offsetof(mavlink_global_position_int_cov_t, lon) }, \
         { "alt", NULL, MAVLINK_TYPE_INT32_T, 0, 20, offsetof(mavlink_global_position_int_cov_t, alt) }, \
         { "relative_alt", NULL, MAVLINK_TYPE_INT32_T, 0, 24, offsetof(mavlink_global_position_int_cov_t, relative_alt) }, \
         { "vx", NULL, MAVLINK_TYPE_FLOAT, 0, 28, offsetof(mavlink_global_position_int_cov_t, vx) }, \
         { "vy", NULL, MAVLINK_TYPE_FLOAT, 0, 32, offsetof(mavlink_global_position_int_cov_t, vy) }, \
         { "vz", NULL, MAVLINK_TYPE_FLOAT, 0, 36, offsetof(mavlink_global_position_int_cov_t, vz) }, \
         { "covariance", NULL, MAVLINK_TYPE_FLOAT, 36, 40, offsetof(mavlink_global_position_int_cov_t, covariance) }, \
         { "estimator_type", NULL, MAVLINK_TYPE_UINT8_T, 0, 184, offsetof(mavlink_global_position_int_cov_t, estimator_type) }, \
         } \
}


/**
 * @brief Pack a global_position_int_cov message
 * @param system_id ID of this system
 * @param component_id ID of this component (e.g. 200 for IMU)
 * @param msg The MAVLink message to compress the data into
 *
 * @param time_boot_ms Timestamp (milliseconds since system boot)
 * @param time_utc Timestamp (microseconds since UNIX epoch) in UTC. 0 for unknown. Commonly filled by the precision time source of a GPS receiver.
 * @param estimator_type Class id of the estimator this estimate originated from.
 * @param lat Latitude, expressed as degrees * 1E7
 * @param lon Longitude, expressed as degrees * 1E7
 * @param alt Altitude in meters, expressed as * 1000 (millimeters), above MSL
 * @param relative_alt Altitude above ground in meters, expressed as * 1000 (millimeters)
 * @param vx Ground X Speed (Latitude), expressed as m/s
 * @param vy Ground Y Speed (Longitude), expressed as m/s
 * @param vz Ground Z Speed (Altitude), expressed as m/s
 * @param covariance Covariance matrix (first six entries are the first ROW, next six entries are the second row, etc.)
 * @return length of the message in bytes (excluding serial stream start sign)
 */
static inline uint16_t mavlink_msg_global_position_int_cov_pack(uint8_t system_id, uint8_t component_id, mavlink_message_t* msg,
						       uint32_t time_boot_ms, uint64_t time_utc, uint8_t estimator_type, int32_t lat, int32_t lon, int32_t alt, int32_t relative_alt, float vx, float vy, float vz, const float *covariance)
{
#if MAVLINK_NEED_BYTE_SWAP || !MAVLINK_ALIGNED_FIELDS
	char buf[MAVLINK_MSG_ID_GLOBAL_POSITION_INT_COV_LEN];
	_mav_put_uint64_t(buf, 0, time_utc);
	_mav_put_uint32_t(buf, 8, time_boot_ms);
	_mav_put_int32_t(buf, 12, lat);
	_mav_put_int32_t(buf, 16, lon);
	_mav_put_int32_t(buf, 20, alt);
	_mav_put_int32_t(buf, 24, relative_alt);
	_mav_put_float(buf, 28, vx);
	_mav_put_float(buf, 32, vy);
	_mav_put_float(buf, 36, vz);
	_mav_put_uint8_t(buf, 184, estimator_type);
	_mav_put_float_array(buf, 40, covariance, 36);
        memcpy(_MAV_PAYLOAD_NON_CONST(msg), buf, MAVLINK_MSG_ID_GLOBAL_POSITION_INT_COV_LEN);
#else
	mavlink_global_position_int_cov_t packet;
	packet.time_utc = time_utc;
	packet.time_boot_ms = time_boot_ms;
	packet.lat = lat;
	packet.lon = lon;
	packet.alt = alt;
	packet.relative_alt = relative_alt;
	packet.vx = vx;
	packet.vy = vy;
	packet.vz = vz;
	packet.estimator_type = estimator_type;
	mav_array_memcpy(packet.covariance, covariance, sizeof(float)*36);
        memcpy(_MAV_PAYLOAD_NON_CONST(msg), &packet, MAVLINK_MSG_ID_GLOBAL_POSITION_INT_COV_LEN);
#endif

	msg->msgid = MAVLINK_MSG_ID_GLOBAL_POSITION_INT_COV;
#if MAVLINK_CRC_EXTRA
    return mavlink_finalize_message(msg, system_id, component_id, MAVLINK_MSG_ID_GLOBAL_POSITION_INT_COV_LEN, MAVLINK_MSG_ID_GLOBAL_POSITION_INT_COV_CRC);
#else
    return mavlink_finalize_message(msg, system_id, component_id, MAVLINK_MSG_ID_GLOBAL_POSITION_INT_COV_LEN);
#endif
}

/**
 * @brief Pack a global_position_int_cov message on a channel
 * @param system_id ID of this system
 * @param component_id ID of this component (e.g. 200 for IMU)
 * @param chan The MAVLink channel this message will be sent over
 * @param msg The MAVLink message to compress the data into
 * @param time_boot_ms Timestamp (milliseconds since system boot)
 * @param time_utc Timestamp (microseconds since UNIX epoch) in UTC. 0 for unknown. Commonly filled by the precision time source of a GPS receiver.
 * @param estimator_type Class id of the estimator this estimate originated from.
 * @param lat Latitude, expressed as degrees * 1E7
 * @param lon Longitude, expressed as degrees * 1E7
 * @param alt Altitude in meters, expressed as * 1000 (millimeters), above MSL
 * @param relative_alt Altitude above ground in meters, expressed as * 1000 (millimeters)
 * @param vx Ground X Speed (Latitude), expressed as m/s
 * @param vy Ground Y Speed (Longitude), expressed as m/s
 * @param vz Ground Z Speed (Altitude), expressed as m/s
 * @param covariance Covariance matrix (first six entries are the first ROW, next six entries are the second row, etc.)
 * @return length of the message in bytes (excluding serial stream start sign)
 */
static inline uint16_t mavlink_msg_global_position_int_cov_pack_chan(uint8_t system_id, uint8_t component_id, uint8_t chan,
							   mavlink_message_t* msg,
						           uint32_t time_boot_ms,uint64_t time_utc,uint8_t estimator_type,int32_t lat,int32_t lon,int32_t alt,int32_t relative_alt,float vx,float vy,float vz,const float *covariance)
{
#if MAVLINK_NEED_BYTE_SWAP || !MAVLINK_ALIGNED_FIELDS
	char buf[MAVLINK_MSG_ID_GLOBAL_POSITION_INT_COV_LEN];
	_mav_put_uint64_t(buf, 0, time_utc);
	_mav_put_uint32_t(buf, 8, time_boot_ms);
	_mav_put_int32_t(buf, 12, lat);
	_mav_put_int32_t(buf, 16, lon);
	_mav_put_int32_t(buf, 20, alt);
	_mav_put_int32_t(buf, 24, relative_alt);
	_mav_put_float(buf, 28, vx);
	_mav_put_float(buf, 32, vy);
	_mav_put_float(buf, 36, vz);
	_mav_put_uint8_t(buf, 184, estimator_type);
	_mav_put_float_array(buf, 40, covariance, 36);
        memcpy(_MAV_PAYLOAD_NON_CONST(msg), buf, MAVLINK_MSG_ID_GLOBAL_POSITION_INT_COV_LEN);
#else
	mavlink_global_position_int_cov_t packet;
	packet.time_utc = time_utc;
	packet.time_boot_ms = time_boot_ms;
	packet.lat = lat;
	packet.lon = lon;
	packet.alt = alt;
	packet.relative_alt = relative_alt;
	packet.vx = vx;
	packet.vy = vy;
	packet.vz = vz;
	packet.estimator_type = estimator_type;
	mav_array_memcpy(packet.covariance, covariance, sizeof(float)*36);
        memcpy(_MAV_PAYLOAD_NON_CONST(msg), &packet, MAVLINK_MSG_ID_GLOBAL_POSITION_INT_COV_LEN);
#endif

	msg->msgid = MAVLINK_MSG_ID_GLOBAL_POSITION_INT_COV;
#if MAVLINK_CRC_EXTRA
    return mavlink_finalize_message_chan(msg, system_id, component_id, chan, MAVLINK_MSG_ID_GLOBAL_POSITION_INT_COV_LEN, MAVLINK_MSG_ID_GLOBAL_POSITION_INT_COV_CRC);
#else
    return mavlink_finalize_message_chan(msg, system_id, component_id, chan, MAVLINK_MSG_ID_GLOBAL_POSITION_INT_COV_LEN);
#endif
}

/**
 * @brief Encode a global_position_int_cov struct
 *
 * @param system_id ID of this system
 * @param component_id ID of this component (e.g. 200 for IMU)
 * @param msg The MAVLink message to compress the data into
 * @param global_position_int_cov C-struct to read the message contents from
 */
static inline uint16_t mavlink_msg_global_position_int_cov_encode(uint8_t system_id, uint8_t component_id, mavlink_message_t* msg, const mavlink_global_position_int_cov_t* global_position_int_cov)
{
	return mavlink_msg_global_position_int_cov_pack(system_id, component_id, msg, global_position_int_cov->time_boot_ms, global_position_int_cov->time_utc, global_position_int_cov->estimator_type, global_position_int_cov->lat, global_position_int_cov->lon, global_position_int_cov->alt, global_position_int_cov->relative_alt, global_position_int_cov->vx, global_position_int_cov->vy, global_position_int_cov->vz, global_position_int_cov->covariance);
}

/**
 * @brief Encode a global_position_int_cov struct on a channel
 *
 * @param system_id ID of this system
 * @param component_id ID of this component (e.g. 200 for IMU)
 * @param chan The MAVLink channel this message will be sent over
 * @param msg The MAVLink message to compress the data into
 * @param global_position_int_cov C-struct to read the message contents from
 */
static inline uint16_t mavlink_msg_global_position_int_cov_encode_chan(uint8_t system_id, uint8_t component_id, uint8_t chan, mavlink_message_t* msg, const mavlink_global_position_int_cov_t* global_position_int_cov)
{
	return mavlink_msg_global_position_int_cov_pack_chan(system_id, component_id, chan, msg, global_position_int_cov->time_boot_ms, global_position_int_cov->time_utc, global_position_int_cov->estimator_type, global_position_int_cov->lat, global_position_int_cov->lon, global_position_int_cov->alt, global_position_int_cov->relative_alt, global_position_int_cov->vx, global_position_int_cov->vy, global_position_int_cov->vz, global_position_int_cov->covariance);
}

/**
 * @brief Send a global_position_int_cov message
 * @param chan MAVLink channel to send the message
 *
 * @param time_boot_ms Timestamp (milliseconds since system boot)
 * @param time_utc Timestamp (microseconds since UNIX epoch) in UTC. 0 for unknown. Commonly filled by the precision time source of a GPS receiver.
 * @param estimator_type Class id of the estimator this estimate originated from.
 * @param lat Latitude, expressed as degrees * 1E7
 * @param lon Longitude, expressed as degrees * 1E7
 * @param alt Altitude in meters, expressed as * 1000 (millimeters), above MSL
 * @param relative_alt Altitude above ground in meters, expressed as * 1000 (millimeters)
 * @param vx Ground X Speed (Latitude), expressed as m/s
 * @param vy Ground Y Speed (Longitude), expressed as m/s
 * @param vz Ground Z Speed (Altitude), expressed as m/s
 * @param covariance Covariance matrix (first six entries are the first ROW, next six entries are the second row, etc.)
 */
#ifdef MAVLINK_USE_CONVENIENCE_FUNCTIONS

static inline void mavlink_msg_global_position_int_cov_send(mavlink_channel_t chan, uint32_t time_boot_ms, uint64_t time_utc, uint8_t estimator_type, int32_t lat, int32_t lon, int32_t alt, int32_t relative_alt, float vx, float vy, float vz, const float *covariance)
{
#if MAVLINK_NEED_BYTE_SWAP || !MAVLINK_ALIGNED_FIELDS
	char buf[MAVLINK_MSG_ID_GLOBAL_POSITION_INT_COV_LEN];
	_mav_put_uint64_t(buf, 0, time_utc);
	_mav_put_uint32_t(buf, 8, time_boot_ms);
	_mav_put_int32_t(buf, 12, lat);
	_mav_put_int32_t(buf, 16, lon);
	_mav_put_int32_t(buf, 20, alt);
	_mav_put_int32_t(buf, 24, relative_alt);
	_mav_put_float(buf, 28, vx);
	_mav_put_float(buf, 32, vy);
	_mav_put_float(buf, 36, vz);
	_mav_put_uint8_t(buf, 184, estimator_type);
	_mav_put_float_array(buf, 40, covariance, 36);
#if MAVLINK_CRC_EXTRA
    _mav_finalize_message_chan_send(chan, MAVLINK_MSG_ID_GLOBAL_POSITION_INT_COV, buf, MAVLINK_MSG_ID_GLOBAL_POSITION_INT_COV_LEN, MAVLINK_MSG_ID_GLOBAL_POSITION_INT_COV_CRC);
#else
    _mav_finalize_message_chan_send(chan, MAVLINK_MSG_ID_GLOBAL_POSITION_INT_COV, buf, MAVLINK_MSG_ID_GLOBAL_POSITION_INT_COV_LEN);
#endif
#else
	mavlink_global_position_int_cov_t packet;
	packet.time_utc = time_utc;
	packet.time_boot_ms = time_boot_ms;
	packet.lat = lat;
	packet.lon = lon;
	packet.alt = alt;
	packet.relative_alt = relative_alt;
	packet.vx = vx;
	packet.vy = vy;
	packet.vz = vz;
	packet.estimator_type = estimator_type;
	mav_array_memcpy(packet.covariance, covariance, sizeof(float)*36);
#if MAVLINK_CRC_EXTRA
    _mav_finalize_message_chan_send(chan, MAVLINK_MSG_ID_GLOBAL_POSITION_INT_COV, (const char *)&packet, MAVLINK_MSG_ID_GLOBAL_POSITION_INT_COV_LEN, MAVLINK_MSG_ID_GLOBAL_POSITION_INT_COV_CRC);
#else
    _mav_finalize_message_chan_send(chan, MAVLINK_MSG_ID_GLOBAL_POSITION_INT_COV, (const char *)&packet, MAVLINK_MSG_ID_GLOBAL_POSITION_INT_COV_LEN);
#endif
#endif
}

#if MAVLINK_MSG_ID_GLOBAL_POSITION_INT_COV_LEN <= MAVLINK_MAX_PAYLOAD_LEN
/*
  This varient of _send() can be used to save stack space by re-using
  memory from the receive buffer.  The caller provides a
  mavlink_message_t which is the size of a full mavlink message. This
  is usually the receive buffer for the channel, and allows a reply to an
  incoming message with minimum stack space usage.
 */
static inline void mavlink_msg_global_position_int_cov_send_buf(mavlink_message_t *msgbuf, mavlink_channel_t chan,  uint32_t time_boot_ms, uint64_t time_utc, uint8_t estimator_type, int32_t lat, int32_t lon, int32_t alt, int32_t relative_alt, float vx, float vy, float vz, const float *covariance)
{
#if MAVLINK_NEED_BYTE_SWAP || !MAVLINK_ALIGNED_FIELDS
	char *buf = (char *)msgbuf;
	_mav_put_uint64_t(buf, 0, time_utc);
	_mav_put_uint32_t(buf, 8, time_boot_ms);
	_mav_put_int32_t(buf, 12, lat);
	_mav_put_int32_t(buf, 16, lon);
	_mav_put_int32_t(buf, 20, alt);
	_mav_put_int32_t(buf, 24, relative_alt);
	_mav_put_float(buf, 28, vx);
	_mav_put_float(buf, 32, vy);
	_mav_put_float(buf, 36, vz);
	_mav_put_uint8_t(buf, 184, estimator_type);
	_mav_put_float_array(buf, 40, covariance, 36);
#if MAVLINK_CRC_EXTRA
    _mav_finalize_message_chan_send(chan, MAVLINK_MSG_ID_GLOBAL_POSITION_INT_COV, buf, MAVLINK_MSG_ID_GLOBAL_POSITION_INT_COV_LEN, MAVLINK_MSG_ID_GLOBAL_POSITION_INT_COV_CRC);
#else
    _mav_finalize_message_chan_send(chan, MAVLINK_MSG_ID_GLOBAL_POSITION_INT_COV, buf, MAVLINK_MSG_ID_GLOBAL_POSITION_INT_COV_LEN);
#endif
#else
	mavlink_global_position_int_cov_t *packet = (mavlink_global_position_int_cov_t *)msgbuf;
	packet->time_utc = time_utc;
	packet->time_boot_ms = time_boot_ms;
	packet->lat = lat;
	packet->lon = lon;
	packet->alt = alt;
	packet->relative_alt = relative_alt;
	packet->vx = vx;
	packet->vy = vy;
	packet->vz = vz;
	packet->estimator_type = estimator_type;
	mav_array_memcpy(packet->covariance, covariance, sizeof(float)*36);
#if MAVLINK_CRC_EXTRA
    _mav_finalize_message_chan_send(chan, MAVLINK_MSG_ID_GLOBAL_POSITION_INT_COV, (const char *)packet, MAVLINK_MSG_ID_GLOBAL_POSITION_INT_COV_LEN, MAVLINK_MSG_ID_GLOBAL_POSITION_INT_COV_CRC);
#else
    _mav_finalize_message_chan_send(chan, MAVLINK_MSG_ID_GLOBAL_POSITION_INT_COV, (const char *)packet, MAVLINK_MSG_ID_GLOBAL_POSITION_INT_COV_LEN);
#endif
#endif
}
#endif

#endif

// MESSAGE GLOBAL_POSITION_INT_COV UNPACKING


/**
 * @brief Get field time_boot_ms from global_position_int_cov message
 *
 * @return Timestamp (milliseconds since system boot)
 */
static inline uint32_t mavlink_msg_global_position_int_cov_get_time_boot_ms(const mavlink_message_t* msg)
{
	return _MAV_RETURN_uint32_t(msg,  8);
}

/**
 * @brief Get field time_utc from global_position_int_cov message
 *
 * @return Timestamp (microseconds since UNIX epoch) in UTC. 0 for unknown. Commonly filled by the precision time source of a GPS receiver.
 */
static inline uint64_t mavlink_msg_global_position_int_cov_get_time_utc(const mavlink_message_t* msg)
{
	return _MAV_RETURN_uint64_t(msg,  0);
}

/**
 * @brief Get field estimator_type from global_position_int_cov message
 *
 * @return Class id of the estimator this estimate originated from.
 */
static inline uint8_t mavlink_msg_global_position_int_cov_get_estimator_type(const mavlink_message_t* msg)
{
	return _MAV_RETURN_uint8_t(msg,  184);
}

/**
 * @brief Get field lat from global_position_int_cov message
 *
 * @return Latitude, expressed as degrees * 1E7
 */
static inline int32_t mavlink_msg_global_position_int_cov_get_lat(const mavlink_message_t* msg)
{
	return _MAV_RETURN_int32_t(msg,  12);
}

/**
 * @brief Get field lon from global_position_int_cov message
 *
 * @return Longitude, expressed as degrees * 1E7
 */
static inline int32_t mavlink_msg_global_position_int_cov_get_lon(const mavlink_message_t* msg)
{
	return _MAV_RETURN_int32_t(msg,  16);
}

/**
 * @brief Get field alt from global_position_int_cov message
 *
 * @return Altitude in meters, expressed as * 1000 (millimeters), above MSL
 */
static inline int32_t mavlink_msg_global_position_int_cov_get_alt(const mavlink_message_t* msg)
{
	return _MAV_RETURN_int32_t(msg,  20);
}

/**
 * @brief Get field relative_alt from global_position_int_cov message
 *
 * @return Altitude above ground in meters, expressed as * 1000 (millimeters)
 */
static inline int32_t mavlink_msg_global_position_int_cov_get_relative_alt(const mavlink_message_t* msg)
{
	return _MAV_RETURN_int32_t(msg,  24);
}

/**
 * @brief Get field vx from global_position_int_cov message
 *
 * @return Ground X Speed (Latitude), expressed as m/s
 */
static inline float mavlink_msg_global_position_int_cov_get_vx(const mavlink_message_t* msg)
{
	return _MAV_RETURN_float(msg,  28);
}

/**
 * @brief Get field vy from global_position_int_cov message
 *
 * @return Ground Y Speed (Longitude), expressed as m/s
 */
static inline float mavlink_msg_global_position_int_cov_get_vy(const mavlink_message_t* msg)
{
	return _MAV_RETURN_float(msg,  32);
}

/**
 * @brief Get field vz from global_position_int_cov message
 *
 * @return Ground Z Speed (Altitude), expressed as m/s
 */
static inline float mavlink_msg_global_position_int_cov_get_vz(const mavlink_message_t* msg)
{
	return _MAV_RETURN_float(msg,  36);
}

/**
 * @brief Get field covariance from global_position_int_cov message
 *
 * @return Covariance matrix (first six entries are the first ROW, next six entries are the second row, etc.)
 */
static inline uint16_t mavlink_msg_global_position_int_cov_get_covariance(const mavlink_message_t* msg, float *covariance)
{
	return _MAV_RETURN_float_array(msg, covariance, 36,  40);
}

/**
 * @brief Decode a global_position_int_cov message into a struct
 *
 * @param msg The message to decode
 * @param global_position_int_cov C-struct to decode the message contents into
 */
static inline void mavlink_msg_global_position_int_cov_decode(const mavlink_message_t* msg, mavlink_global_position_int_cov_t* global_position_int_cov)
{
#if MAVLINK_NEED_BYTE_SWAP
	global_position_int_cov->time_utc = mavlink_msg_global_position_int_cov_get_time_utc(msg);
	global_position_int_cov->time_boot_ms = mavlink_msg_global_position_int_cov_get_time_boot_ms(msg);
	global_position_int_cov->lat = mavlink_msg_global_position_int_cov_get_lat(msg);
	global_position_int_cov->lon = mavlink_msg_global_position_int_cov_get_lon(msg);
	global_position_int_cov->alt = mavlink_msg_global_position_int_cov_get_alt(msg);
	global_position_int_cov->relative_alt = mavlink_msg_global_position_int_cov_get_relative_alt(msg);
	global_position_int_cov->vx = mavlink_msg_global_position_int_cov_get_vx(msg);
	global_position_int_cov->vy = mavlink_msg_global_position_int_cov_get_vy(msg);
	global_position_int_cov->vz = mavlink_msg_global_position_int_cov_get_vz(msg);
	mavlink_msg_global_position_int_cov_get_covariance(msg, global_position_int_cov->covariance);
	global_position_int_cov->estimator_type = mavlink_msg_global_position_int_cov_get_estimator_type(msg);
#else
	memcpy(global_position_int_cov, _MAV_PAYLOAD(msg), MAVLINK_MSG_ID_GLOBAL_POSITION_INT_COV_LEN);
#endif
}
