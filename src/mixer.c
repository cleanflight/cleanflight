/*
 * This file is part of baseflight
 * Licensed under GPL V3 or modified DCL - see https://github.com/multiwii/baseflight/blob/master/README.md
 */
#include "board.h"
#include "mw.h"

static uint8_t numberMotor = 0;
static uint8_t numberRules = 0;
int16_t motor[MAX_MOTORS];
int16_t motor_disarmed[MAX_MOTORS];
int16_t servo[MAX_SERVOS] = { 1500, 1500, 1500, 1500, 1500, 1500, 1500, 1500 };

static motorMixer_t currentMixer[MAX_MOTORS];
static servoMixer_t currentServoMixer[MAX_SERVO_RULES];

static const motorMixer_t mixerTri[] = {
    { 1.0f,  0.0f,  1.333333f,  0.0f },     // REAR
    { 1.0f, -1.0f, -0.666667f,  0.0f },     // RIGHT
    { 1.0f,  1.0f, -0.666667f,  0.0f },     // LEFT
};

static const motorMixer_t mixerQuadP[] = {
    { 1.0f,  0.0f,  1.0f, -1.0f },          // REAR
    { 1.0f, -1.0f,  0.0f,  1.0f },          // RIGHT
    { 1.0f,  1.0f,  0.0f,  1.0f },          // LEFT
    { 1.0f,  0.0f, -1.0f, -1.0f },          // FRONT
};

static const motorMixer_t mixerQuadX[] = {
    { 1.0f, -1.0f,  1.0f, -1.0f },          // REAR_R
    { 1.0f, -1.0f, -1.0f,  1.0f },          // FRONT_R
    { 1.0f,  1.0f,  1.0f,  1.0f },          // REAR_L
    { 1.0f,  1.0f, -1.0f, -1.0f },          // FRONT_L
};

static const motorMixer_t mixerBi[] = {
    { 1.0f,  1.0f,  0.0f,  0.0f },          // LEFT
    { 1.0f, -1.0f,  0.0f,  0.0f },          // RIGHT
};

static const motorMixer_t mixerY6[] = {
    { 1.0f,  0.0f,  1.333333f,  1.0f },     // REAR
    { 1.0f, -1.0f, -0.666667f, -1.0f },     // RIGHT
    { 1.0f,  1.0f, -0.666667f, -1.0f },     // LEFT
    { 1.0f,  0.0f,  1.333333f, -1.0f },     // UNDER_REAR
    { 1.0f, -1.0f, -0.666667f,  1.0f },     // UNDER_RIGHT
    { 1.0f,  1.0f, -0.666667f,  1.0f },     // UNDER_LEFT
};

static const motorMixer_t mixerHex6P[] = {
    { 1.0f, -0.866025f,  0.5f,  1.0f },     // REAR_R
    { 1.0f, -0.866025f, -0.5f, -1.0f },     // FRONT_R
    { 1.0f,  0.866025f,  0.5f,  1.0f },     // REAR_L
    { 1.0f,  0.866025f, -0.5f, -1.0f },     // FRONT_L
    { 1.0f,  0.0f,      -1.0f,  1.0f },     // FRONT
    { 1.0f,  0.0f,       1.0f, -1.0f },     // REAR
};

static const motorMixer_t mixerY4[] = {
    { 1.0f,  0.0f,  1.0f, -1.0f },          // REAR_TOP CW
    { 1.0f, -1.0f, -1.0f,  0.0f },          // FRONT_R CCW
    { 1.0f,  0.0f,  1.0f,  1.0f },          // REAR_BOTTOM CCW
    { 1.0f,  1.0f, -1.0f,  0.0f },          // FRONT_L CW
};

static const motorMixer_t mixerHex6X[] = {
    { 1.0f, -0.5f,  0.866025f,  1.0f },     // REAR_R
    { 1.0f, -0.5f, -0.866025f,  1.0f },     // FRONT_R
    { 1.0f,  0.5f,  0.866025f, -1.0f },     // REAR_L
    { 1.0f,  0.5f, -0.866025f, -1.0f },     // FRONT_L
    { 1.0f, -1.0f,  0.0f,      -1.0f },     // RIGHT
    { 1.0f,  1.0f,  0.0f,       1.0f },     // LEFT
};

static const motorMixer_t mixerOctoX8[] = {
    { 1.0f, -1.0f,  1.0f, -1.0f },          // REAR_R
    { 1.0f, -1.0f, -1.0f,  1.0f },          // FRONT_R
    { 1.0f,  1.0f,  1.0f,  1.0f },          // REAR_L
    { 1.0f,  1.0f, -1.0f, -1.0f },          // FRONT_L
    { 1.0f, -1.0f,  1.0f,  1.0f },          // UNDER_REAR_R
    { 1.0f, -1.0f, -1.0f, -1.0f },          // UNDER_FRONT_R
    { 1.0f,  1.0f,  1.0f, -1.0f },          // UNDER_REAR_L
    { 1.0f,  1.0f, -1.0f,  1.0f },          // UNDER_FRONT_L
};

static const motorMixer_t mixerOctoFlatP[] = {
    { 1.0f,  0.707107f, -0.707107f,  1.0f },    // FRONT_L
    { 1.0f, -0.707107f, -0.707107f,  1.0f },    // FRONT_R
    { 1.0f, -0.707107f,  0.707107f,  1.0f },    // REAR_R
    { 1.0f,  0.707107f,  0.707107f,  1.0f },    // REAR_L
    { 1.0f,  0.0f, -1.0f, -1.0f },              // FRONT
    { 1.0f, -1.0f,  0.0f, -1.0f },              // RIGHT
    { 1.0f,  0.0f,  1.0f, -1.0f },              // REAR
    { 1.0f,  1.0f,  0.0f, -1.0f },              // LEFT
};

static const motorMixer_t mixerOctoFlatX[] = {
    { 1.0f,  1.0f, -0.5f,  1.0f },          // MIDFRONT_L
    { 1.0f, -0.5f, -1.0f,  1.0f },          // FRONT_R
    { 1.0f, -1.0f,  0.5f,  1.0f },          // MIDREAR_R
    { 1.0f,  0.5f,  1.0f,  1.0f },          // REAR_L
    { 1.0f,  0.5f, -1.0f, -1.0f },          // FRONT_L
    { 1.0f, -1.0f, -0.5f, -1.0f },          // MIDFRONT_R
    { 1.0f, -0.5f,  1.0f, -1.0f },          // REAR_R
    { 1.0f,  1.0f,  0.5f, -1.0f },          // MIDREAR_L
};

static const motorMixer_t mixerVtail4[] = {
    { 1.0f,  0.0f,  1.0f,  1.0f },          // REAR_R
    { 1.0f, -1.0f, -1.0f,  0.0f },          // FRONT_R
    { 1.0f,  0.0f,  1.0f, -1.0f },          // REAR_L
    { 1.0f,  1.0f, -1.0f, -0.0f },          // FRONT_L
};

static const motorMixer_t mixerAtail4[] = {
    { 1.0f,  0.0f,  1.0f,  1.0f },          // REAR_R
    { 1.0f, -1.0f, -1.0f,  0.0f },          // FRONT_R
    { 1.0f,  0.0f,  1.0f, -1.0f },          // REAR_L
    { 1.0f,  1.0f, -1.0f, -0.0f },          // FRONT_L
};

static const motorMixer_t mixerHex6H[] = {
    { 1.0f, -1.0f,  1.0f, -1.0f },     // REAR_R
    { 1.0f, -1.0f, -1.0f,  1.0f },     // FRONT_R
    { 1.0f,  1.0f,  1.0f,  1.0f },     // REAR_L
    { 1.0f,  1.0f, -1.0f, -1.0f },     // FRONT_L
    { 1.0f,  0.0f,  0.0f,  0.0f },     // RIGHT
    { 1.0f,  0.0f,  0.0f,  0.0f },     // LEFT
};

static const motorMixer_t mixerDualcopter[] = {
    { 1.0f,  0.0f,  0.0f, -1.0f },          // LEFT
    { 1.0f,  0.0f,  0.0f,  1.0f },          // RIGHT
};

static const motorMixer_t mixerTrustVector[] = {
    { 1.0f,  0.0f,  0.0f, -0.5f },          // LEFT
    { 1.0f,  0.0f,  0.0f,  0.5f },          // RIGHT
};

// Keep this synced with MultiType struct in mw.h!
const mixer_t mixers[] = {
//    Mo Se Mixtable
    { 0, 0, NULL },                // entry 0
    { 3, 1, mixerTri },            // MULTITYPE_TRI
    { 4, 0, mixerQuadP },          // MULTITYPE_QUADP
    { 4, 0, mixerQuadX },          // MULTITYPE_QUADX
    { 2, 1, mixerBi },             // MULTITYPE_BI
    { 0, 1, NULL },                // * MULTITYPE_GIMBAL
    { 6, 0, mixerY6 },             // MULTITYPE_Y6
    { 6, 0, mixerHex6P },          // MULTITYPE_HEX6
    { 2, 1, mixerTrustVector },     // * MULTITYPE_FLYING_WING
    { 4, 0, mixerY4 },             // MULTITYPE_Y4
    { 6, 0, mixerHex6X },          // MULTITYPE_HEX6X
    { 8, 0, mixerOctoX8 },         // MULTITYPE_OCTOX8
    { 8, 0, mixerOctoFlatP },      // MULTITYPE_OCTOFLATP
    { 8, 0, mixerOctoFlatX },      // MULTITYPE_OCTOFLATX
    { 1, 1, NULL },                // * MULTITYPE_AIRPLANE
    { 0, 1, NULL },                // * MULTITYPE_HELI_120_CCPM
    { 0, 1, NULL },                // * MULTITYPE_HELI_90_DEG
    { 4, 0, mixerVtail4 },         // MULTITYPE_VTAIL4
    { 6, 0, mixerHex6H },          // MULTITYPE_HEX6H
    { 0, 1, NULL },                // * MULTITYPE_PPM_TO_SERVO
    { 2, 1, mixerDualcopter },     // MULTITYPE_DUALCOPTER
    { 1, 1, NULL },                // MULTITYPE_SINGLECOPTER
    { 4, 0, mixerAtail4 },         // MULTITYPE_ATAIL4
    { 0, 0, NULL },                // MULTITYPE_CUSTOM
    { 1, 1, NULL },                // MULTITYPE_CUSTOM_PLANE
};

// mixer rule format servo, input, rate, speed, min, max, box
static const servoMixer_t servoMixerAirplane[] = {
    { 3, INPUT_ROLL,  100, 0, 0, 100, 0 },
    { 4, INPUT_ROLL,  100, 0, 0, 100, 0 },
    { 5, INPUT_YAW,   100, 0, 0, 100, 0 },
    { 6, INPUT_PITCH, 100, 0, 0, 100, 0 },
};

static const servoMixer_t servoMixerFlyingWing[] = {
    { 3, INPUT_ROLL,  100, 0, 0, 100, 0 },
    { 3, INPUT_PITCH, 100, 0, 0, 100, 0 },
    { 4, INPUT_ROLL,  100, 0, 0, 100, 0 },
    { 4, INPUT_PITCH, 100, 0, 0, 100, 0 },
};

static const servoMixer_t servoMixerBI[] = {
    { 4, INPUT_YAW,   100, 0, 0, 100, 0 },
    { 4, INPUT_PITCH, 100, 0, 0, 100, 0 },
    { 5, INPUT_YAW,   100, 0, 0, 100, 0 },
    { 5, INPUT_PITCH, 100, 0, 0, 100, 0 },
};

static const servoMixer_t servoMixerTri[] = {
    { 5, INPUT_YAW,   100, 0, 0, 100, 0 },
};

static const servoMixer_t servoMixerDual[] = {
    { 4, INPUT_PITCH, 100, 0, 0, 100, 0 },
    { 5, INPUT_ROLL,  100, 0, 0, 100, 0 },
};

static const servoMixer_t servoMixerSingle[] = {
    { 3, INPUT_YAW,   100, 0, 0, 100, 0 },
    { 3, INPUT_PITCH, 100, 0, 0, 100, 0 },
    { 4, INPUT_YAW,   100, 0, 0, 100, 0 },
    { 4, INPUT_PITCH, 100, 0, 0, 100, 0 },
    { 5, INPUT_YAW,   100, 0, 0, 100, 0 },
    { 5, INPUT_ROLL,  100, 0, 0, 100, 0 },
    { 6, INPUT_YAW,   100, 0, 0, 100, 0 },
    { 6, INPUT_ROLL,  100, 0, 0, 100, 0 },
};

const mixerRules_t servoMixers[] = {
    { 0, NULL },                // entry 0
    { 1, servoMixerTri },       // MULTITYPE_TRI
    { 0, NULL },                // MULTITYPE_QUADP
    { 0, NULL },                // MULTITYPE_QUADX
    { 4, servoMixerBI },        // MULTITYPE_BI
    { 0, NULL },                // * MULTITYPE_GIMBAL
    { 0, NULL },                // MULTITYPE_Y6
    { 0, NULL },                // MULTITYPE_HEX6
    { 4, servoMixerFlyingWing },// * MULTITYPE_FLYING_WING
    { 0, NULL },                // MULTITYPE_Y4
    { 0, NULL },                // MULTITYPE_HEX6X
    { 0, NULL },                // MULTITYPE_OCTOX8
    { 0, NULL },                // MULTITYPE_OCTOFLATP
    { 0, NULL },                // MULTITYPE_OCTOFLATX
    { 4, servoMixerAirplane },  // * MULTITYPE_AIRPLANE
    { 0, NULL },                // * MULTITYPE_HELI_120_CCPM
    { 0, NULL },                // * MULTITYPE_HELI_90_DEG
    { 0, NULL },                // MULTITYPE_VTAIL4
    { 0, NULL },                // MULTITYPE_HEX6H
    { 0, NULL },                // * MULTITYPE_PPM_TO_SERVO
    { 2, servoMixerDual },      // MULTITYPE_DUALCOPTER
    { 8, servoMixerSingle },    // MULTITYPE_SINGLECOPTER
    { 0, NULL },                // MULTITYPE_ATAIL4
    { 0, NULL },                // MULTITYPE_CUSTOM
    { 0, NULL },                // MULTITYPE_CUSTOM_PLANE
};


int16_t servoMiddle(int nr)
{
    // Normally, servo.middle is a value between 1000..2000, but for the purposes of stupid, if it's less than
    // the number of RC channels, it means the center value is taken FROM that RC channel (by its index)
    if (cfg.servoConf[nr].middle < RC_CHANS && nr < MAX_SERVOS)
        return rcData[cfg.servoConf[nr].middle];
    else
        return cfg.servoConf[nr].middle;
}

int servoDirection(int nr, int lr)
{
    // servo.rate is overloaded for servos that don't have a rate, but only need direction
    // bit set = negative, clear = positive
    // rate[2] = ???_direction
    // rate[1] = roll_direction
    // rate[0] = pitch_direction
    // servo.rate is also used as gimbal gain multiplier (yeah)
    if (cfg.servoConf[nr].direction & (1 << lr))
        return -1;
    else
        return 1;
}

void mixerInit(void)
{
    int i;

    // enable servos for mixes that require them. note, this shifts motor counts.
    core.useServo = mixers[mcfg.mixerConfiguration].useServo;
    // if we want camstab/trig, that also enables servos, even if mixer doesn't
    if (feature(FEATURE_SERVO_TILT))
        core.useServo = 1;

    if (mcfg.mixerConfiguration == MULTITYPE_CUSTOM) {
        // load custom mixer into currentMixer
        for (i = 0; i < MAX_MOTORS; i++) {
            // check if done
            if (mcfg.customMixer[i].throttle == 0.0f)
                break;
            currentMixer[i] = mcfg.customMixer[i];
            numberMotor++;
        }
    } else {
        numberMotor = mixers[mcfg.mixerConfiguration].numberMotor;
        // copy motor-based mixers
        if (mixers[mcfg.mixerConfiguration].motor) {
            for (i = 0; i < numberMotor; i++)
                currentMixer[i] = mixers[mcfg.mixerConfiguration].motor[i];
        }
    }
    
    if (core.useServo) {
        numberRules = servoMixers[mcfg.mixerConfiguration].numberRules;
        if (servoMixers[mcfg.mixerConfiguration].rule) {
            for (i = 0; i < numberRules; i++)
                currentServoMixer[i] = servoMixers[mcfg.mixerConfiguration].rule[i];
        }
    }

    // in 3D mode, mixer gain has to be halved
    if (feature(FEATURE_3D)) {
        if (numberMotor > 1) {
            for (i = 0; i < numberMotor; i++) {
                currentMixer[i].pitch *= 0.5f;
                currentMixer[i].roll *= 0.5f;
                currentMixer[i].yaw *= 0.5f;
            }
        }
    }

    // set flag that we're on something with wings
    if (mcfg.mixerConfiguration == MULTITYPE_FLYING_WING || mcfg.mixerConfiguration == MULTITYPE_AIRPLANE || mcfg.mixerConfiguration == MULTITYPE_CUSTOM_PLANE) {
        f.FIXED_WING = 1;
        
        if (mcfg.mixerConfiguration == MULTITYPE_CUSTOM_PLANE) {
            // load custom mixer into currentServoMixer
            for (i = 0; i < MAX_SERVO_RULES; i++) {
                // check if done
                if (mcfg.customServoMixer[i].rate == 0)
                    break;
                currentServoMixer[i] = mcfg.customServoMixer[i];
                numberRules++;
            }
        }
    }
    else
        f.FIXED_WING = 0;

    mixerResetMotors();
}

void mixerResetMotors(void)
{
    int i;
    // set disarmed motor values
    for (i = 0; i < MAX_MOTORS; i++)
        motor_disarmed[i] = feature(FEATURE_3D) ? mcfg.neutral3d : mcfg.mincommand;
}

void servoMixerLoadMix(int index) 
{
    int i;

    // we're 1-based
    index++;
    // clear existing
    for (i = 0; i < MAX_SERVO_RULES; i++)
        mcfg.customServoMixer[i].targetChannel = mcfg.customServoMixer[i].fromChannel = mcfg.customServoMixer[i].rate = mcfg.customServoMixer[i].box = 0;

    for (i = 0; i < servoMixers[index].numberRules; i++)
        mcfg.customServoMixer[i] = servoMixers[index].rule[i];
}

void mixerLoadMix(int index)
{
    int i;

    // we're 1-based
    index++;
    // clear existing
    for (i = 0; i < MAX_MOTORS; i++)
        mcfg.customMixer[i].throttle = 0.0f;

    // do we have anything here to begin with?
    if (mixers[index].motor != NULL) {
        for (i = 0; i < mixers[index].numberMotor; i++)
            mcfg.customMixer[i] = mixers[index].motor[i];
    }
}

void writeServos(void)
{
    if (!core.useServo)
        return;

    switch (mcfg.mixerConfiguration) {
        case MULTITYPE_BI:
            pwmWriteServo(0, servo[4]);
            pwmWriteServo(1, servo[5]);
            break;

        case MULTITYPE_TRI:
            if (cfg.tri_unarmed_servo) {
                // if unarmed flag set, we always move servo
                pwmWriteServo(0, servo[5]);
            } else {
                // otherwise, only move servo when copter is armed
                if (f.ARMED)
                    pwmWriteServo(0, servo[5]);
                else
                    pwmWriteServo(0, 0); // kill servo signal completely.
            }
            break;

        case MULTITYPE_GIMBAL:
            pwmWriteServo(0, servo[0]);
            pwmWriteServo(1, servo[1]);
            break;

        case MULTITYPE_DUALCOPTER:
            pwmWriteServo(0, servo[4]);
            pwmWriteServo(1, servo[5]);
            break;

        case MULTITYPE_FLYING_WING:
            pwmWriteServo(0, servo[3]);
            pwmWriteServo(1, servo[4]);
            break;
            
        case MULTITYPE_AIRPLANE:
        case MULTITYPE_SINGLECOPTER:
            pwmWriteServo(0, servo[3]);
            pwmWriteServo(1, servo[4]);
            pwmWriteServo(2, servo[5]);
            pwmWriteServo(3, servo[6]);
            break;
            
        case MULTITYPE_CUSTOM_PLANE:
            pwmWriteServo(0, servo[3]);
            pwmWriteServo(1, servo[4]);
            pwmWriteServo(2, servo[5]);
            pwmWriteServo(3, servo[6]);
            if (feature(FEATURE_PPM)) {
                pwmWriteServo(4, servo[0]);
                pwmWriteServo(5, servo[1]);
                pwmWriteServo(6, servo[2]);
                pwmWriteServo(7, servo[7]);
            }
            break;

        default:
            // Two servos for SERVO_TILT, if enabled
            if (feature(FEATURE_SERVO_TILT)) {
                pwmWriteServo(0, servo[0]);
                pwmWriteServo(1, servo[1]);
            }
            break;
    }
}

void writeMotors(void)
{
    uint8_t i;

    for (i = 0; i < numberMotor; i++)
        pwmWriteMotor(i, motor[i]);
}

void writeAllMotors(int16_t mc)
{
    uint8_t i;

    // Sends commands to all motors
    for (i = 0; i < numberMotor; i++)
        motor[i] = mc;
    writeMotors();
}

static void servoMixer(void)
{
    int16_t input[INPUT_ITEMS];
    static int16_t currentOutput[MAX_SERVO_RULES];
    uint8_t i;
    
    if (f.PASSTHRU_MODE) {
        // Direct passthru from RX
        input[INPUT_ROLL] = rcCommand[ROLL];
        input[INPUT_PITCH] = rcCommand[PITCH];
        input[INPUT_YAW] = rcCommand[YAW];
    } else {
        // Assisted modes (gyro only or gyro+acc according to AUX configuration in Gui
        input[INPUT_ROLL] = axisPID[ROLL];
        input[INPUT_PITCH] = axisPID[PITCH];
        input[INPUT_YAW] = axisPID[YAW];
    }

    input[INPUT_THROTTLE] = motor[0];
    input[INPUT_AUX1] = mcfg.midrc - rcData[AUX1];
    input[INPUT_AUX2] = mcfg.midrc - rcData[AUX2];
    input[INPUT_AUX3] = mcfg.midrc - rcData[AUX3];
    input[INPUT_AUX4] = mcfg.midrc - rcData[AUX4];
    input[INPUT_RC_ROLL] = mcfg.midrc - rcData[ROLL];
    input[INPUT_RC_PITCH] = mcfg.midrc - rcData[PITCH];
    input[INPUT_RC_YAW] = mcfg.midrc - rcData[YAW];
    input[INPUT_RC_THROTTLE] = mcfg.midrc - rcData[THROTTLE];
    
    for (i = 0; i < MAX_SERVOS; i++)
        servo[i] = servoMiddle(i);

    // mix servos according to rules
    for (i = 0; i < numberRules; i++) {
        // consider rule if no box assigned or box is active
        if (currentServoMixer[i].box == 0 || rcOptions[BOXSERVO1+currentServoMixer[i].box-1]) {
            uint8_t target = currentServoMixer[i].targetChannel;
            uint8_t from = currentServoMixer[i].fromChannel;
            uint16_t servo_width = cfg.servoConf[target].max - cfg.servoConf[target].min;
            int16_t min = currentServoMixer[i].min * servo_width / 100 - servo_width / 2;
            int16_t max = currentServoMixer[i].max * servo_width / 100 - servo_width / 2;
            
            if (currentServoMixer[i].speed == 0)
                currentOutput[i] = input[from];
            else {
                if (currentOutput[i] < input[from])
                    currentOutput[i] = constrain(currentOutput[i] + currentServoMixer[i].speed, currentOutput[i], input[from]);
                else if (currentOutput[i] > input[from])
                    currentOutput[i] = constrain(currentOutput[i] - currentServoMixer[i].speed, input[from], currentOutput[i]);
            }

            servo[target] += servoDirection(target, from) * constrain(((int32_t)currentOutput[i] * currentServoMixer[i].rate) / 100, min, max);
        } else
            currentOutput[i] = 0;
    }

    // servo rates
    for (i = 0; i < MAX_SERVOS; i++)
        servo[i] = ((int32_t)cfg.servoConf[i].rate * servo[i]) / 100;
}

void mixTable(void)
{
    int16_t maxMotor;
    uint32_t i;

    if (numberMotor > 3) {
        // prevent "yaw jump" during yaw correction
        axisPID[YAW] = constrain(axisPID[YAW], -100 - abs(rcCommand[YAW]), +100 + abs(rcCommand[YAW]));
    }

    // motors for non-servo mixes
    if (numberMotor > 1)
        for (i = 0; i < numberMotor; i++)
            motor[i] = rcCommand[THROTTLE] * currentMixer[i].throttle + axisPID[PITCH] * currentMixer[i].pitch + axisPID[ROLL] * currentMixer[i].roll + -cfg.yaw_direction * axisPID[YAW] * currentMixer[i].yaw;

    if (f.FIXED_WING) {
        if (!f.ARMED)
            motor[0] = mcfg.mincommand; // Kill throttle when disarmed
        else
            motor[0] = constrain(rcCommand[THROTTLE], mcfg.minthrottle, mcfg.maxthrottle);
    }

    // airplane / servo mixes
    switch (mcfg.mixerConfiguration) {
        case MULTITYPE_CUSTOM_PLANE:
        case MULTITYPE_FLYING_WING:
        case MULTITYPE_AIRPLANE:
        case MULTITYPE_BI:
        case MULTITYPE_TRI:
        case MULTITYPE_DUALCOPTER:
        case MULTITYPE_SINGLECOPTER:
            servoMixer();
            break;
        case MULTITYPE_GIMBAL:
            servo[0] = (((int32_t)cfg.servoConf[0].rate * angle[PITCH]) / 50) + servoMiddle(0);
            servo[1] = (((int32_t)cfg.servoConf[1].rate * angle[ROLL]) / 50) + servoMiddle(1);
            break;
    }

    // do camstab
    if (feature(FEATURE_SERVO_TILT)) {
        // center at fixed position, or vary either pitch or roll by RC channel
        servo[0] = servoMiddle(0);
        servo[1] = servoMiddle(1);

        if (rcOptions[BOXCAMSTAB]) {
            if (cfg.gimbal_flags & GIMBAL_MIXTILT) {
                servo[0] -= (-(int32_t)cfg.servoConf[0].rate) * angle[PITCH] / 50 - (int32_t)cfg.servoConf[1].rate * angle[ROLL] / 50;
                servo[1] += (-(int32_t)cfg.servoConf[0].rate) * angle[PITCH] / 50 + (int32_t)cfg.servoConf[1].rate * angle[ROLL] / 50;
            } else {
                servo[0] += (int32_t)cfg.servoConf[0].rate * angle[PITCH] / 50;
                servo[1] += (int32_t)cfg.servoConf[1].rate * angle[ROLL]  / 50;
            }
        }
    }

    // constrain servos
    for (i = 0; i < MAX_SERVOS; i++)
        servo[i] = constrain(servo[i], cfg.servoConf[i].min, cfg.servoConf[i].max); // limit the values

    // forward AUX1-4 to servo outputs (not constrained)
    if (cfg.gimbal_flags & GIMBAL_FORWARDAUX) {
        int offset = core.numServos - 4;
        // offset servos based off number already used in mixer types
        // airplane and servo_tilt together can't be used
        // calculate offset by taking 4 from core.numServos
        for (i = 0; i < 4; i++)
            pwmWriteServo(i + offset, rcData[AUX1 + i]);
    }

    maxMotor = motor[0];
    for (i = 1; i < numberMotor; i++)
        if (motor[i] > maxMotor)
            maxMotor = motor[i];
    for (i = 0; i < numberMotor; i++) {
        if (maxMotor > mcfg.maxthrottle)     // this is a way to still have good gyro corrections if at least one motor reaches its max.
            motor[i] -= maxMotor - mcfg.maxthrottle;
        if (feature(FEATURE_3D)) {
            if ((rcData[THROTTLE]) > mcfg.midrc) {
                motor[i] = constrain(motor[i], mcfg.deadband3d_high, mcfg.maxthrottle);
            } else {
                motor[i] = constrain(motor[i], mcfg.mincommand, mcfg.deadband3d_low);
            }
        } else {
            motor[i] = constrain(motor[i], mcfg.minthrottle, mcfg.maxthrottle);
            if ((rcData[THROTTLE]) < mcfg.mincheck) {
                if (!feature(FEATURE_MOTOR_STOP))
                    motor[i] = mcfg.minthrottle;
                else { 
                    motor[i] = mcfg.mincommand;
                    f.MOTORS_STOPPED = 1;
                }
            } else {
                f.MOTORS_STOPPED = 0;
            }
        }
        if (!f.ARMED) {
            motor[i] = motor_disarmed[i];
        }
    }
}
