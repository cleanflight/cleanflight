/*
 * This file is part of Cleanflight.
 *
 * Cleanflight is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * Cleanflight is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with Cleanflight.  If not, see <http://www.gnu.org/licenses/>.
 */

#include <stdbool.h>
#include <stdint.h>
#include <stdlib.h>
#include <string.h>

#include <platform.h>
#include "scheduler.h"

#include "common/axis.h"
#include "common/color.h"
#include "common/atomic.h"
#include "common/maths.h"

#include "drivers/nvic.h"

#include "drivers/sensor.h"
#include "drivers/system.h"
#include "drivers/dma.h"
#include "drivers/gpio.h"
#include "drivers/light_led.h"
#include "drivers/sound_beeper.h"
#include "drivers/timer.h"
#include "drivers/serial.h"
#include "drivers/serial_softserial.h"
#include "drivers/serial_uart.h"
#include "drivers/accgyro.h"
#include "drivers/compass.h"
#include "drivers/pwm_mapping.h"
#include "drivers/pwm_rx.h"
#include "drivers/adc.h"
#include "drivers/bus_i2c.h"
#include "drivers/bus_spi.h"
#include "drivers/inverter.h"
#include "drivers/flash_m25p16.h"
#include "drivers/sonar_hcsr04.h"
#include "drivers/sdcard.h"
#include "drivers/usb_io.h"
#include "drivers/transponder_ir.h"
#include "drivers/gyro_sync.h"

#include "rx/rx.h"

#include "io/serial.h"
#include "io/flashfs.h"
#include "io/gps.h"
#include "io/escservo.h"
#include "io/rc_controls.h"
#include "io/gimbal.h"
#include "io/ledstrip.h"
#include "io/display.h"
#include "io/asyncfatfs/asyncfatfs.h"
#include "io/transponder_ir.h"

#include "sensors/sensors.h"
#include "sensors/sonar.h"
#include "sensors/barometer.h"
#include "sensors/compass.h"
#include "sensors/acceleration.h"
#include "sensors/gyro.h"
#include "sensors/battery.h"
#include "sensors/boardalignment.h"
#include "sensors/initialisation.h"

#include "telemetry/telemetry.h"
#include "blackbox/blackbox.h"

#include "flight/pid.h"
#include "flight/imu.h"
#include "flight/mixer.h"
#include "flight/failsafe.h"
#include "flight/navigation.h"

#include "config/runtime_config.h"
#include "config/config.h"
#include "config/config_profile.h"
#include "config/config_master.h"

#ifdef USE_HARDWARE_REVISION_DETECTION
#include "hardware_revision.h"
#endif

#include "build_config.h"
#include "debug.h"

extern uint8_t motorControlEnable;

#ifdef SOFTSERIAL_LOOPBACK
serialPort_t *loopbackPort;
#endif

void printfSupportInit(void);
void timerInit(void);
void telemetryInit(void);
void serialInit(serialConfig_t *initialSerialConfig, bool softserialEnabled);
void mspInit(serialConfig_t *serialConfig);
void cliInit(serialConfig_t *serialConfig);
void failsafeInit(rxConfig_t *intialRxConfig, uint16_t deadband3d_throttle);
pwmIOConfiguration_t *pwmInit(drv_pwm_config_t *init);
#ifdef USE_SERVOS
void mixerInit(mixerMode_e mixerMode, motorMixer_t *customMotorMixers, servoMixer_t *customServoMixers);
#else
void mixerInit(mixerMode_e mixerMode, motorMixer_t *customMotorMixers);
#endif
void mixerUsePWMIOConfiguration(pwmIOConfiguration_t *pwmIOConfiguration);
void rxInit(rxConfig_t *rxConfig, modeActivationCondition_t *modeActivationConditions);
void gpsInit(serialConfig_t *serialConfig, gpsConfig_t *initialGpsConfig);
void navigationInit(gpsProfile_t *initialGpsProfile, pidProfile_t *pidProfile);
void imuInit(void);
void displayInit(rxConfig_t *intialRxConfig);
void ledStripInit(ledConfig_t *ledConfigsToUse, hsvColor_t *colorsToUse);
void spektrumBind(rxConfig_t *rxConfig);
const sonarHardware_t *sonarGetHardwareConfiguration(batteryConfig_t *batteryConfig);
void sonarInit(const sonarHardware_t *sonarHardware);
void transponderInit(uint8_t* transponderCode);

#ifdef STM32F303xC
// from system_stm32f30x.c
void SetSysClock(void);
#endif
#ifdef STM32F10X
// from system_stm32f10x.c
void SetSysClock(bool overclock);
#endif

typedef enum {
    SYSTEM_STATE_INITIALISING        = 0,
    SYSTEM_STATE_CONFIG_LOADED       = (1 << 0),
    SYSTEM_STATE_SENSORS_READY       = (1 << 1),
    SYSTEM_STATE_MOTORS_READY        = (1 << 2),
    SYSTEM_STATE_TRANSPONDER_ENABLED = (1 << 3),
    SYSTEM_STATE_READY               = (1 << 7)
} systemState_e;

static uint8_t systemState = SYSTEM_STATE_INITIALISING;

void flashLedsAndBeep(void)
{
    LED1_ON;
    LED0_OFF;
    for (uint8_t i = 0; i < 10; i++) {
        LED1_TOGGLE;
        LED0_TOGGLE;
        delay(25);
        BEEP_ON;
        delay(25);
        BEEP_OFF;
    }
    LED0_OFF;
    LED1_OFF;
}

#ifdef BUTTONS
void buttonsInit(void)
{

    gpio_config_t buttonAGpioConfig = {
        BUTTON_A_PIN,
        Mode_IPU,
        Speed_2MHz
    };
    gpioInit(BUTTON_A_PORT, &buttonAGpioConfig);

    gpio_config_t buttonBGpioConfig = {
        BUTTON_B_PIN,
        Mode_IPU,
        Speed_2MHz
    };
    gpioInit(BUTTON_B_PORT, &buttonBGpioConfig);

    delayMicroseconds(10);  // allow GPIO configuration to settle
}

void buttonsHandleColdBootButtonPresses(void)
{
    uint8_t secondsRemaining = 10;
    bool bothButtonsHeld;
    do {
        bothButtonsHeld = !digitalIn(BUTTON_A_PORT, BUTTON_A_PIN) && !digitalIn(BUTTON_B_PORT, BUTTON_B_PIN);
        if (bothButtonsHeld) {
            if (--secondsRemaining == 0) {
                resetEEPROM();
                systemReset();
            }

            if (secondsRemaining > 5) {
                delay(1000);
            } else {
                // flash quicker after a few seconds
                delay(500);
                LED0_TOGGLE;
                delay(500);
            }
            LED0_TOGGLE;
        }
    } while (bothButtonsHeld);

    // buttons released between 5 and 10 seconds
    if (secondsRemaining < 5) {

        usbGenerateDisconnectPulse();

        flashLedsAndBeep();

        systemResetToBootloader();
    }
}

#endif

void init(void)
{
    drv_pwm_config_t pwm_params;

    printfSupportInit();

    initEEPROM();

    ensureEEPROMContainsValidData();
    readEEPROM();

    systemState |= SYSTEM_STATE_CONFIG_LOADED;

#ifdef STM32F303
    // start fpu
    SCB->CPACR = (0x3 << (10*2)) | (0x3 << (11*2));
#endif

#ifdef STM32F303xC
    SetSysClock();
#endif
#ifdef STM32F10X
    // Configure the System clock frequency, HCLK, PCLK2 and PCLK1 prescalers
    // Configure the Flash Latency cycles and enable prefetch buffer
    SetSysClock(masterConfig.emf_avoidance);
#endif
    i2cSetOverclock(masterConfig.i2c_highspeed);

#ifdef USE_HARDWARE_REVISION_DETECTION
    detectHardwareRevision();
#endif

    systemInit();

    // Latch active features to be used for feature() in the remainder of init().
    latchActiveFeatures();

    ledInit();

#ifdef BEEPER
    beeperConfig_t beeperConfig = {
        .gpioPeripheral = BEEP_PERIPHERAL,
        .gpioPin = BEEP_PIN,
        .gpioPort = BEEP_GPIO,
#ifdef BEEPER_INVERTED
        .gpioMode = Mode_Out_PP,
        .isInverted = true
#else
        .gpioMode = Mode_Out_OD,
        .isInverted = false
#endif
    };
#ifdef NAZE
    if (hardwareRevision >= NAZE32_REV5) {
        // naze rev4 and below used opendrain to PNP for buzzer. Rev5 and above use PP to NPN.
        beeperConfig.gpioMode = Mode_Out_PP;
        beeperConfig.isInverted = true;
    }
#endif

    beeperInit(&beeperConfig);
#endif

#ifdef BUTTONS
    buttonsInit();

    if (!isMPUSoftReset()) {
        buttonsHandleColdBootButtonPresses();
    }
#endif

#ifdef SPEKTRUM_BIND
    if (feature(FEATURE_RX_SERIAL)) {
        switch (masterConfig.rxConfig.serialrx_provider) {
            case SERIALRX_SPEKTRUM1024:
            case SERIALRX_SPEKTRUM2048:
                // Spektrum satellite binding if enabled on startup.
                // Must be called before that 100ms sleep so that we don't lose satellite's binding window after startup.
                // The rest of Spektrum initialization will happen later - via spektrumInit()
                spektrumBind(&masterConfig.rxConfig);
                break;
        }
    }
#endif

    delay(100);

    timerInit();  // timer must be initialized before any channel is allocated

    dmaInit();


    serialInit(&masterConfig.serialConfig, feature(FEATURE_SOFTSERIAL));

#ifdef USE_SERVOS
    mixerInit(masterConfig.mixerMode, masterConfig.customMotorMixer, masterConfig.customServoMixer);
#else
    mixerInit(masterConfig.mixerMode, masterConfig.customMotorMixer);
#endif

    memset(&pwm_params, 0, sizeof(pwm_params));

#ifdef SONAR
    const sonarHardware_t *sonarHardware = NULL;

    if (feature(FEATURE_SONAR)) {
        sonarHardware = sonarGetHardwareConfiguration(&masterConfig.batteryConfig);
        sonarGPIOConfig_t sonarGPIOConfig = {
            .gpio = SONAR_GPIO,
            .triggerPin = sonarHardware->echo_pin,
            .echoPin = sonarHardware->trigger_pin,
        };
        pwm_params.sonarGPIOConfig = &sonarGPIOConfig;
    }
#endif

    // when using airplane/wing mixer, servo/motor outputs are remapped
    if (masterConfig.mixerMode == MIXER_AIRPLANE || masterConfig.mixerMode == MIXER_FLYING_WING || masterConfig.mixerMode == MIXER_CUSTOM_AIRPLANE)
        pwm_params.airplane = true;
    else
        pwm_params.airplane = false;
#if defined(USE_UART2) && defined(STM32F10X)
    pwm_params.useUART2 = doesConfigurationUsePort(SERIAL_PORT_UART2);
#endif
#if defined(USE_UART3)
    pwm_params.useUART3 = doesConfigurationUsePort(SERIAL_PORT_UART3);
#endif
#if defined(USE_UART4)
    pwm_params.useUART4 = doesConfigurationUsePort(SERIAL_PORT_UART4);
#endif
#if defined(USE_UART5)
    pwm_params.useUART5 = doesConfigurationUsePort(SERIAL_PORT_UART5);
#endif
    pwm_params.useVbat = feature(FEATURE_VBAT);
    pwm_params.useSoftSerial = feature(FEATURE_SOFTSERIAL);
    pwm_params.useParallelPWM = feature(FEATURE_RX_PARALLEL_PWM);
    pwm_params.useRSSIADC = feature(FEATURE_RSSI_ADC);
    pwm_params.useCurrentMeterADC = feature(FEATURE_CURRENT_METER)
        && masterConfig.batteryConfig.currentMeterType == CURRENT_SENSOR_ADC;
    pwm_params.useLEDStrip = feature(FEATURE_LED_STRIP);
    pwm_params.usePPM = feature(FEATURE_RX_PPM);
    pwm_params.useSerialRx = feature(FEATURE_RX_SERIAL);
#ifdef SONAR
    pwm_params.useSonar = feature(FEATURE_SONAR);
#endif

#ifdef USE_SERVOS
    pwm_params.useServos = isMixerUsingServos();
    pwm_params.useChannelForwarding = feature(FEATURE_CHANNEL_FORWARDING);
    pwm_params.servoCenterPulse = masterConfig.escAndServoConfig.servoCenterPulse;
    pwm_params.servoPwmRate = masterConfig.servo_pwm_rate;
#endif

    pwm_params.useOneshot = feature(FEATURE_ONESHOT125);
    pwm_params.motorPwmRate = masterConfig.motor_pwm_rate;
    pwm_params.idlePulse = masterConfig.escAndServoConfig.mincommand;
    if (feature(FEATURE_3D))
        pwm_params.idlePulse = masterConfig.flight3DConfig.neutral3d;
    if (pwm_params.motorPwmRate > 500)
        pwm_params.idlePulse = 0; // brushed motors

    pwmRxInit(masterConfig.inputFilteringMode);

    // pwmInit() needs to be called as soon as possible for ESC compatibility reasons
    pwmIOConfiguration_t *pwmIOConfiguration = pwmInit(&pwm_params);

    mixerUsePWMIOConfiguration(pwmIOConfiguration);

    debug[2] = pwmIOConfiguration->pwmInputCount;
    debug[3] = pwmIOConfiguration->ppmInputCount;

    if (!feature(FEATURE_ONESHOT125))
        motorControlEnable = true;

    systemState |= SYSTEM_STATE_MOTORS_READY;

#ifdef INVERTER
    initInverter();
#endif


#ifdef USE_SPI
    spiInit(SPI1);
    spiInit(SPI2);
#endif

#ifdef USE_HARDWARE_REVISION_DETECTION
    updateHardwareRevision();
#endif

#if defined(NAZE)
    if (hardwareRevision == NAZE32_SP) {
        serialRemovePort(SERIAL_PORT_SOFTSERIAL2);
    } else  {
        serialRemovePort(SERIAL_PORT_UART3);
    }
#endif

#if defined(SPRACINGF3) && defined(SONAR) && defined(USE_SOFTSERIAL2)
    if (feature(FEATURE_SONAR) && feature(FEATURE_SOFTSERIAL)) {
        serialRemovePort(SERIAL_PORT_SOFTSERIAL2);
    }
#endif

#if defined(SPRACINGF3MINI) && defined(SONAR) && defined(USE_SOFTSERIAL1)
    if (feature(FEATURE_SONAR) && feature(FEATURE_SOFTSERIAL)) {
        serialRemovePort(SERIAL_PORT_SOFTSERIAL1);
    }
#endif


#ifdef USE_I2C
#if defined(NAZE)
    if (hardwareRevision != NAZE32_SP) {
        i2cInit(I2C_DEVICE);
    } else {
        if (!doesConfigurationUsePort(SERIAL_PORT_UART3)) {
            i2cInit(I2C_DEVICE);
        }
    }
#elif defined(CC3D)
    if (!doesConfigurationUsePort(SERIAL_PORT_UART3)) {
        i2cInit(I2C_DEVICE);
    }
#else
    i2cInit(I2C_DEVICE);
#endif
#endif

#ifdef USE_ADC
    drv_adc_config_t adc_params;

    adc_params.enableVBat = feature(FEATURE_VBAT);
    adc_params.enableRSSI = feature(FEATURE_RSSI_ADC);
    adc_params.enableCurrentMeter = feature(FEATURE_CURRENT_METER);
    adc_params.enableExternal1 = false;
#ifdef OLIMEXINO
    adc_params.enableExternal1 = true;
#endif
#ifdef NAZE
    // optional ADC5 input on rev.5 hardware
    adc_params.enableExternal1 = (hardwareRevision >= NAZE32_REV5);
#endif

    adcInit(&adc_params);
#endif


    initBoardAlignment(&masterConfig.boardAlignment);

#ifdef DISPLAY
    if (feature(FEATURE_DISPLAY)) {
        displayInit(&masterConfig.rxConfig);
    }
#endif

    if (!sensorsAutodetect(&masterConfig.sensorAlignmentConfig, masterConfig.gyro_lpf,
        masterConfig.acc_hardware, masterConfig.mag_hardware, masterConfig.baro_hardware, currentProfile->mag_declination,
        masterConfig.looptime, masterConfig.gyroSync, masterConfig.gyroSyncDenominator)) {

        // if gyro was not detected due to whatever reason, we give up now.
        failureMode(FAILURE_MISSING_ACC);
    }

    systemState |= SYSTEM_STATE_SENSORS_READY;

    flashLedsAndBeep();

#ifdef USE_SERVOS
    mixerInitialiseServoFiltering(targetLooptime);
#endif

#ifdef MAG
    if (sensors(SENSOR_MAG))
        compassInit();
#endif

    imuInit();

    mspInit(&masterConfig.serialConfig);

#ifdef USE_CLI
    cliInit(&masterConfig.serialConfig);
#endif

    failsafeInit(&masterConfig.rxConfig, masterConfig.flight3DConfig.deadband3d_throttle);

    rxInit(&masterConfig.rxConfig, currentProfile->modeActivationConditions);

#ifdef GPS
    if (feature(FEATURE_GPS)) {
        gpsInit(
            &masterConfig.serialConfig,
            &masterConfig.gpsConfig
        );
        navigationInit(
            &currentProfile->gpsProfile,
            &currentProfile->pidProfile
        );
    }
#endif

#ifdef SONAR
    if (feature(FEATURE_SONAR)) {
        sonarInit(sonarHardware);
    }
#endif

#ifdef LED_STRIP
    ledStripInit(masterConfig.ledConfigs, masterConfig.colors);

    if (feature(FEATURE_LED_STRIP)) {
        ledStripEnable();
    }
#endif

#ifdef TELEMETRY
    if (feature(FEATURE_TELEMETRY)) {
        telemetryInit();
    }
#endif

#ifdef USB_CABLE_DETECTION
    usbCableDetectInit();
#endif

#ifdef TRANSPONDER
    if (feature(FEATURE_TRANSPONDER)) {
        transponderInit(masterConfig.transponderData);
        transponderEnable();
        transponderStartRepeating();
        systemState |= SYSTEM_STATE_TRANSPONDER_ENABLED;
    }
#endif

#ifdef USE_FLASHFS
#ifdef NAZE
    if (hardwareRevision == NAZE32_REV5) {
        m25p16_init();
    }
#elif defined(USE_FLASH_M25P16)
    m25p16_init();
#endif

    flashfsInit();
#endif

#ifdef USE_SDCARD
    bool sdcardUseDMA = false;

    sdcardInsertionDetectInit();

#ifdef SDCARD_DMA_CHANNEL_TX

#if defined(LED_STRIP) && defined(WS2811_DMA_CHANNEL)
    // Ensure the SPI Tx DMA doesn't overlap with the led strip
    sdcardUseDMA = !feature(FEATURE_LED_STRIP) || SDCARD_DMA_CHANNEL_TX != WS2811_DMA_CHANNEL;
#else
    sdcardUseDMA = true;
#endif

#endif

    sdcard_init(sdcardUseDMA);

    afatfs_init();
#endif

#ifdef BLACKBOX
    initBlackbox();
#endif

    if (masterConfig.mixerMode == MIXER_GIMBAL) {
        accSetCalibrationCycles(CALIBRATING_ACC_CYCLES);
    }
    gyroSetCalibrationCycles(CALIBRATING_GYRO_CYCLES);
#ifdef BARO
    baroSetCalibrationCycles(CALIBRATING_BARO_CYCLES);
#endif

    // start all timers
    // TODO - not implemented yet
    timerStart();

    ENABLE_STATE(SMALL_ANGLE);
    DISABLE_ARMING_FLAG(PREVENT_ARMING);

#ifdef SOFTSERIAL_LOOPBACK
    // FIXME this is a hack, perhaps add a FUNCTION_LOOPBACK to support it properly
    loopbackPort = (serialPort_t*)&(softSerialPorts[0]);
    if (!loopbackPort->vTable) {
        loopbackPort = openSoftSerial(0, NULL, 19200, SERIAL_NOT_INVERTED);
    }
    serialPrint(loopbackPort, "LOOPBACK\r\n");
#endif

    // Now that everything has powered up the voltage and cell count be determined.

    if (feature(FEATURE_VBAT | FEATURE_CURRENT_METER))
        batteryInit(&masterConfig.batteryConfig);

#ifdef DISPLAY
    if (feature(FEATURE_DISPLAY)) {
#ifdef USE_OLED_GPS_DEBUG_PAGE_ONLY
        displayShowFixedPage(PAGE_GPS);
#else
        displayResetPageCycling();
        displayEnablePageCycling();
#endif
    }
#endif

#ifdef CJMCU
    LED2_ON;
#endif

    // Latch active features AGAIN since some may be modified by init().
    latchActiveFeatures();
    motorControlEnable = true;

    systemState |= SYSTEM_STATE_READY;
}

#ifdef SOFTSERIAL_LOOPBACK
void processLoopback(void) {
    if (loopbackPort) {
        uint8_t bytesWaiting;
        while ((bytesWaiting = serialRxBytesWaiting(loopbackPort))) {
            uint8_t b = serialRead(loopbackPort);
            serialWrite(loopbackPort, b);
        };
    }
}
#else
#define processLoopback()
#endif

int main(void) {
    init();

    /* Setup scheduler */
    if (masterConfig.gyroSync) {
        rescheduleTask(TASK_GYROPID, targetLooptime - INTERRUPT_WAIT_TIME);
    }
    else {
        rescheduleTask(TASK_GYROPID, targetLooptime);
    }

    setTaskEnabled(TASK_GYROPID, true);
    setTaskEnabled(TASK_ACCEL, sensors(SENSOR_ACC));
    setTaskEnabled(TASK_SERIAL, true);
#ifdef BEEPER
    setTaskEnabled(TASK_BEEPER, true);
#endif
    setTaskEnabled(TASK_BATTERY, feature(FEATURE_VBAT) || feature(FEATURE_CURRENT_METER));
    setTaskEnabled(TASK_RX, true);
#ifdef GPS
    setTaskEnabled(TASK_GPS, feature(FEATURE_GPS));
#endif
#ifdef MAG
    setTaskEnabled(TASK_COMPASS, sensors(SENSOR_MAG));
#endif
#ifdef BARO
    setTaskEnabled(TASK_BARO, sensors(SENSOR_BARO));
#endif
#ifdef SONAR
    setTaskEnabled(TASK_SONAR, sensors(SENSOR_SONAR));
#endif
#if defined(BARO) || defined(SONAR)
    setTaskEnabled(TASK_ALTITUDE, sensors(SENSOR_BARO) || sensors(SENSOR_SONAR));
#endif
#ifdef DISPLAY
    setTaskEnabled(TASK_DISPLAY, feature(FEATURE_DISPLAY));
#endif
#ifdef TELEMETRY
    setTaskEnabled(TASK_TELEMETRY, feature(FEATURE_TELEMETRY));
#endif
#ifdef LED_STRIP
    setTaskEnabled(TASK_LEDSTRIP, feature(FEATURE_LED_STRIP));
#endif
#ifdef TRANSPONDER
    setTaskEnabled(TASK_TRANSPONDER, feature(FEATURE_TRANSPONDER));
#endif

    while (1) {
        scheduler();
        processLoopback();
    }
}

void HardFault_Handler(void)
{
    // fall out of the sky
    uint8_t requiredStateForMotors = SYSTEM_STATE_CONFIG_LOADED | SYSTEM_STATE_MOTORS_READY;
    if ((systemState & requiredStateForMotors) == requiredStateForMotors) {
        stopMotors();
    }
#ifdef TRANSPONDER
    // prevent IR LEDs from burning out.
    uint8_t requiredStateForTransponder = SYSTEM_STATE_CONFIG_LOADED | SYSTEM_STATE_TRANSPONDER_ENABLED;
    if ((systemState & requiredStateForTransponder) == requiredStateForTransponder) {
        transponderIrDisable();
    }
#endif

    while (1);
}
