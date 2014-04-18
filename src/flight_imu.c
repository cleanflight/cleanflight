#include "board.h"
#include "mw.h"

#include "common/maths.h"

#include "sensors_compass.h"

#include "flight_common.h"

int16_t gyroADC[XYZ_AXIS_COUNT], accADC[XYZ_AXIS_COUNT], accSmooth[XYZ_AXIS_COUNT];
int32_t accSum[XYZ_AXIS_COUNT];

uint32_t accTimeSum = 0;        // keep track for integration of acc
int accSumCount = 0;
int16_t accZ_25deg = 0;
int32_t baroPressure = 0;
int32_t baroTemperature = 0;
uint32_t baroPressureSum = 0;
int32_t BaroAlt = 0;
int32_t sonarAlt;              // to think about the unit
int32_t EstAlt;                // in cm
int32_t BaroPID = 0;
int32_t AltHold;
int32_t errorAltitudeI = 0;
int32_t vario = 0;                      // variometer in cm/s
int16_t throttleAngleCorrection = 0;    // correction of throttle in lateral wind,
float magneticDeclination = 0.0f;       // calculated at startup from config
float accVelScale;
float throttleAngleScale;

// **************
// gyro+acc IMU
// **************
int16_t gyroData[GYRO_INDEX_COUNT] = { 0, 0, 0 };
int16_t gyroZero[GYRO_INDEX_COUNT] = { 0, 0, 0 };

int16_t angle[2] = { 0, 0 };     // absolute angle inclination in multiple of 0.1 degree    180 deg = 1800
float anglerad[2] = { 0.0f, 0.0f };    // absolute angle inclination in radians

static void getEstimatedAttitude(void);

void imuInit(void)
{
    accZ_25deg = lrintf(acc_1G * cosf(RAD * 25.0f));
    accVelScale = 9.80665f / acc_1G / 10000.0f;
    throttleAngleScale = (1800.0f / M_PI) * (900.0f / cfg.throttle_correction_angle);

#ifdef MAG
    // if mag sensor is enabled, use it
    if (sensors(SENSOR_MAG))
        Mag_init();
#endif
}

void computeIMU(void)
{
    uint32_t axis;
    static int16_t gyroYawSmooth = 0;

    Gyro_getADC();
    if (sensors(SENSOR_ACC)) {
        ACC_getADC();
        getEstimatedAttitude();
    } else {
        accADC[X] = 0;
        accADC[Y] = 0;
        accADC[Z] = 0;
    }

    if (mcfg.mixerConfiguration == MULTITYPE_TRI) {
        gyroData[GI_YAW] = (gyroYawSmooth * 2 + gyroADC[GI_YAW]) / 3;
        gyroYawSmooth = gyroData[GI_YAW];
        gyroData[GI_ROLL] = gyroADC[GI_ROLL];
        gyroData[GI_PITCH] = gyroADC[GI_PITCH];
    } else {
        for (axis = 0; axis < 3; axis++)
            gyroData[axis] = gyroADC[axis];
    }
}

// **************************************************
// Simplified IMU based on "Complementary Filter"
// Inspired by http://starlino.com/imu_guide.html
//
// adapted by ziss_dm : http://www.multiwii.com/forum/viewtopic.php?f=8&t=198
//
// The following ideas was used in this project:
// 1) Rotation matrix: http://en.wikipedia.org/wiki/Rotation_matrix
//
// Currently Magnetometer uses separate CF which is used only
// for heading approximation.
//
// **************************************************

#define INV_GYR_CMPF_FACTOR   (1.0f / ((float)mcfg.gyro_cmpf_factor + 1.0f))
#define INV_GYR_CMPFM_FACTOR  (1.0f / ((float)mcfg.gyro_cmpfm_factor + 1.0f))

typedef struct fp_vector {
    float X;
    float Y;
    float Z;
} t_fp_vector_def;

typedef union {
    float A[3];
    t_fp_vector_def V;
} t_fp_vector;

t_fp_vector EstG;

typedef struct fp_angles {
    float roll;
    float pitch;
    float yaw;
} fp_angles_t;

// Normalize a vector
void normalizeV(struct fp_vector *src, struct fp_vector *dest)
{
    float length;

    length = sqrtf(src->X * src->X + src->Y * src->Y + src->Z * src->Z);
    if (length != 0) {
        dest->X = src->X / length;
        dest->Y = src->Y / length;
        dest->Z = src->Z / length;
    }
}

// Rotate Estimated vector(s) with small angle approximation, according to the gyro data
void rotateAnglesV(struct fp_vector *v, fp_angles_t *delta)
{
    struct fp_vector v_tmp = *v;

    // This does a  "proper" matrix rotation using gyro deltas without small-angle approximation
    float mat[3][3];
    float cosx, sinx, cosy, siny, cosz, sinz;
    float coszcosx, coszcosy, sinzcosx, coszsinx, sinzsinx;

    cosx = cosf(delta->roll);
    sinx = sinf(delta->roll);
    cosy = cosf(delta->pitch);
    siny = sinf(delta->pitch);
    cosz = cosf(delta->yaw);
    sinz = sinf(delta->yaw);

    coszcosx = cosz * cosx;
    coszcosy = cosz * cosy;
    sinzcosx = sinz * cosx;
    coszsinx = sinx * cosz;
    sinzsinx = sinx * sinz;

    mat[0][0] = coszcosy;
    mat[0][1] = -cosy * sinz;
    mat[0][2] = siny;
    mat[1][0] = sinzcosx + (coszsinx * siny);
    mat[1][1] = coszcosx - (sinzsinx * siny);
    mat[1][2] = -sinx * cosy;
    mat[2][0] = (sinzsinx) - (coszcosx * siny);
    mat[2][1] = (coszsinx) + (sinzcosx * siny);
    mat[2][2] = cosy * cosx;

    v->X = v_tmp.X * mat[0][0] + v_tmp.Y * mat[1][0] + v_tmp.Z * mat[2][0];
    v->Y = v_tmp.X * mat[0][1] + v_tmp.Y * mat[1][1] + v_tmp.Z * mat[2][1];
    v->Z = v_tmp.X * mat[0][2] + v_tmp.Y * mat[1][2] + v_tmp.Z * mat[2][2];
}

// deprecated - it uses legacy indices for ROLL/PITCH/YAW, see rc_alias_e - use rotateAnglesV instead
void rotateV(struct fp_vector *v, float *delta) {
    fp_angles_t temp;
    temp.roll = delta[GI_ROLL];
    temp.pitch = delta[GI_PITCH];
    temp.yaw = delta[GI_YAW];

    rotateAnglesV(v, &temp);
}

int32_t applyDeadband(int32_t value, int32_t deadband)
{
    if (abs(value) < deadband) {
        value = 0;
    } else if (value > 0) {
        value -= deadband;
    } else if (value < 0) {
        value += deadband;
    }
    return value;
}

#define F_CUT_ACCZ 10.0f // 10Hz should still be fast enough
static const float fc_acc = 0.5f / (M_PI * F_CUT_ACCZ);

// rotate acc into Earth frame and calculate acceleration in it
void acc_calc(void)
{
    static int32_t accZoffset = 0;
    static float accz_smooth;
    fp_angles_t rpy;
    t_fp_vector accel_ned;

    // the accel values have to be rotated into the earth frame
    rpy.roll = -(float)anglerad[AI_ROLL];
    rpy.pitch = -(float)anglerad[AI_PITCH];
    rpy.yaw = -(float)heading * RAD;

    accel_ned.V.X = accSmooth[0];
    accel_ned.V.Y = accSmooth[1];
    accel_ned.V.Z = accSmooth[2];

    rotateAnglesV(&accel_ned.V, &rpy);

    if (cfg.acc_unarmedcal == 1) {
        if (!f.ARMED) {
            accZoffset -= accZoffset / 64;
            accZoffset += accel_ned.V.Z;
        }
        accel_ned.V.Z -= accZoffset / 64;  // compensate for gravitation on z-axis
    } else
        accel_ned.V.Z -= acc_1G;

    accz_smooth = accz_smooth + (cycleTime / (fc_acc + cycleTime)) * (accel_ned.V.Z - accz_smooth); // low pass filter

    // apply Deadband to reduce integration drift and vibration influence
    accSum[X] += applyDeadband(lrintf(accel_ned.V.X), cfg.accxy_deadband);
    accSum[Y] += applyDeadband(lrintf(accel_ned.V.Y), cfg.accxy_deadband);
    accSum[Z] += applyDeadband(lrintf(accz_smooth), cfg.accz_deadband);

    // sum up Values for later integration to get velocity and distance
    accTimeSum += cycleTime;
    accSumCount++;
}

void accSum_reset(void)
{
    accSum[0] = 0;
    accSum[1] = 0;
    accSum[2] = 0;
    accSumCount = 0;
    accTimeSum = 0;
}

// baseflight calculation by Luggi09 originates from arducopter
static int16_t calculateHeading(t_fp_vector *vec)
{
    int16_t head;

    float cosineRoll = cosf(anglerad[AI_ROLL]);
    float sineRoll = sinf(anglerad[AI_ROLL]);
    float cosinePitch = cosf(anglerad[AI_PITCH]);
    float sinePitch = sinf(anglerad[AI_PITCH]);
    float Xh = vec->A[X] * cosinePitch + vec->A[Y] * sineRoll * sinePitch + vec->A[Z] * sinePitch * cosineRoll;
    float Yh = vec->A[Y] * cosineRoll - vec->A[Z] * sineRoll;
    float hd = (atan2f(Yh, Xh) * 1800.0f / M_PI + magneticDeclination) / 10.0f;
    head = lrintf(hd);
    if (head < 0)
        head += 360;

    return head;
}

static void getEstimatedAttitude(void)
{
    uint32_t axis;
    int32_t accMag = 0;
    static t_fp_vector EstM;
    static t_fp_vector EstN = { .A = { 1.0f, 0.0f, 0.0f } };
    static float accLPF[3];
    float deltaGyroAngle[3];
    float gyroScale = cycleTime * gyro.scale;
    // Initialization
    for (axis = 0; axis < 3; axis++) {
        deltaGyroAngle[axis] = gyroADC[axis] * gyroScale;
        if (cfg.acc_lpf_factor > 0) {
            accLPF[axis] = accLPF[axis] * (1.0f - (1.0f / cfg.acc_lpf_factor)) + accADC[axis] * (1.0f / cfg.acc_lpf_factor);
            accSmooth[axis] = accLPF[axis];
        } else {
            accSmooth[axis] = accADC[axis];
        }
        accMag += (int32_t)accSmooth[axis] * accSmooth[axis];
    }
    accMag = accMag * 100 / ((int32_t)acc_1G * acc_1G);

    rotateV(&EstG.V, deltaGyroAngle);
    if (sensors(SENSOR_MAG)) {
        rotateV(&EstM.V, deltaGyroAngle);
    } else {
        rotateV(&EstN.V, deltaGyroAngle);
        normalizeV(&EstN.V, &EstN.V);
    }

    // Apply complimentary filter (Gyro drift correction)
    // If accel magnitude >1.15G or <0.85G and ACC vector outside of the limit range => we neutralize the effect of accelerometers in the angle estimation.
    // To do that, we just skip filter, as EstV already rotated by Gyro
    if (72 < (uint16_t)accMag && (uint16_t)accMag < 133) {
        for (axis = 0; axis < 3; axis++)
            EstG.A[axis] = (EstG.A[axis] * (float)mcfg.gyro_cmpf_factor + accSmooth[axis]) * INV_GYR_CMPF_FACTOR;
    }

    if (sensors(SENSOR_MAG)) {
        for (axis = 0; axis < 3; axis++)
            EstM.A[axis] = (EstM.A[axis] * (float)mcfg.gyro_cmpfm_factor + magADC[axis]) * INV_GYR_CMPFM_FACTOR;
    }

    f.SMALL_ANGLES_25 = (EstG.A[Z] > accZ_25deg);

    // Attitude of the estimated vector
    anglerad[AI_ROLL] = atan2f(EstG.V.Y, EstG.V.Z);
    anglerad[AI_PITCH] = atan2f(-EstG.V.X, sqrtf(EstG.V.Y * EstG.V.Y + EstG.V.Z * EstG.V.Z));
    angle[AI_ROLL] = lrintf(anglerad[AI_ROLL] * (1800.0f / M_PI));
    angle[AI_PITCH] = lrintf(anglerad[AI_PITCH] * (1800.0f / M_PI));

    if (sensors(SENSOR_MAG))
        heading = calculateHeading(&EstM);
    else
        heading = calculateHeading(&EstN);

    acc_calc(); // rotate acc vector into earth frame

    if (cfg.throttle_correction_value) {

        float cosZ = EstG.V.Z / sqrtf(EstG.V.X * EstG.V.X + EstG.V.Y * EstG.V.Y + EstG.V.Z * EstG.V.Z);

        if (cosZ <= 0.015f) { // we are inverted, vertical or with a small angle < 0.86 deg
            throttleAngleCorrection = 0;
        } else {
            int angle = lrintf(acosf(cosZ) * throttleAngleScale);
            if (angle > 900)
                angle = 900;
            throttleAngleCorrection = lrintf(cfg.throttle_correction_value * sinf(angle / (900.0f * M_PI / 2.0f))) ;
        }

    }
}

#ifdef BARO
#define UPDATE_INTERVAL 25000   // 40hz update rate (20hz LPF on acc)

int getEstimatedAltitude(void)
{
    static uint32_t previousT;
    uint32_t currentT = micros();
    uint32_t dTime;
    int32_t error;
    int32_t baroVel;
    int32_t vel_tmp;
    int32_t BaroAlt_tmp;
    int32_t setVel;
    float dt;
    float vel_acc;
    float accZ_tmp;
    static float accZ_old = 0.0f;
    static float vel = 0.0f;
    static float accAlt = 0.0f;
    static int32_t lastBaroAlt;
    static int32_t baroGroundAltitude = 0;
    static int32_t baroGroundPressure = 0;

    dTime = currentT - previousT;
    if (dTime < UPDATE_INTERVAL)
        return 0;
    previousT = currentT;

    if (calibratingB > 0) {
        baroGroundPressure -= baroGroundPressure / 8;
        baroGroundPressure += baroPressureSum / (cfg.baro_tab_size - 1);
        baroGroundAltitude = (1.0f - powf((baroGroundPressure / 8) / 101325.0f, 0.190295f)) * 4433000.0f;

        vel = 0;
        accAlt = 0;
        calibratingB--;
    }

    // calculates height from ground via baro readings
    // see: https://github.com/diydrones/ardupilot/blob/master/libraries/AP_Baro/AP_Baro.cpp#L140
    BaroAlt_tmp = lrintf((1.0f - powf((float)(baroPressureSum / (cfg.baro_tab_size - 1)) / 101325.0f, 0.190295f)) * 4433000.0f); // in cm
    BaroAlt_tmp -= baroGroundAltitude;
    BaroAlt = lrintf((float)BaroAlt * cfg.baro_noise_lpf + (float)BaroAlt_tmp * (1.0f - cfg.baro_noise_lpf)); // additional LPF to reduce baro noise

    dt = accTimeSum * 1e-6f; // delta acc reading time in seconds

    // Integrator - velocity, cm/sec
    accZ_tmp = (float)accSum[2] / (float)accSumCount;
    vel_acc = accZ_tmp * accVelScale * (float)accTimeSum;

    // Integrator - Altitude in cm
    accAlt += (vel_acc * 0.5f) * dt + vel * dt;                                         // integrate velocity to get distance (x= a/2 * t^2)
    accAlt = accAlt * cfg.baro_cf_alt + (float)BaroAlt * (1.0f - cfg.baro_cf_alt);      // complementary filter for Altitude estimation (baro & acc)
    EstAlt = accAlt;
    vel += vel_acc;

#if 0
    debug[0] = accSum[2] / accSumCount; // acceleration
    debug[1] = vel;                     // velocity
    debug[2] = accAlt;                  // height
#endif

    accSum_reset();

    baroVel = (BaroAlt - lastBaroAlt) * 1000000.0f / dTime;
    lastBaroAlt = BaroAlt;

    baroVel = constrain(baroVel, -300, 300);    // constrain baro velocity +/- 300cm/s
    baroVel = applyDeadband(baroVel, 10);       // to reduce noise near zero

    // apply Complimentary Filter to keep the calculated velocity based on baro velocity (i.e. near real velocity).
    // By using CF it's possible to correct the drift of integrated accZ (velocity) without loosing the phase, i.e without delay
    vel = vel * cfg.baro_cf_vel + baroVel * (1 - cfg.baro_cf_vel);

    // set vario
    vel_tmp = lrintf(vel);
    vel_tmp = applyDeadband(vel_tmp, 5);
    vario = vel_tmp;

    // Altitude P-Controller
    error = constrain(AltHold - EstAlt, -500, 500);
    error = applyDeadband(error, 10);       // remove small P parametr to reduce noise near zero position
    setVel = constrain((cfg.P8[PIDALT] * error / 128), -300, +300); // limit velocity to +/- 3 m/s

    // Velocity PID-Controller
    // P
    error = setVel - lrintf(vel);
    BaroPID = constrain((cfg.P8[PIDVEL] * error / 32), -300, +300);

    // I
    errorAltitudeI += (cfg.I8[PIDVEL] * error) / 8;
    errorAltitudeI = constrain(errorAltitudeI, -(1024 * 200), (1024 * 200));
    BaroPID += errorAltitudeI / 1024;     // I in range +/-200

    // D
    BaroPID -= constrain(cfg.D8[PIDVEL] * (accZ_tmp + accZ_old) / 64, -150, 150);
    accZ_old = accZ_tmp;

    return 1;
}
#endif /* BARO */
