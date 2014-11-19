
#include "platform.h"
#include "common/utils.h"
#include "system.h"

#include "pin_debug.h"

#ifdef PINDEBUG

#define _ENTRY2(a,b,c) {b,c}
#define _ENTRY(...) _ENTRY2(__VA_ARGS__)
struct {
    GPIO_TypeDef *gpio;
    uint16_t pin;
} const pinDebugPins[] = {
    _ENTRY(DBG_PIN_1),
    _ENTRY(DBG_PIN_2),
    _ENTRY(DBG_PIN_3),
    _ENTRY(DBG_PIN_4),
};
#undef _ENTRY
#undef _ENTRY2

void pinDebugInit(void)
{
    for(unsigned i = 0; i < ARRAYLEN(pinDebugPins); i++) {
        gpio_config_t cfg;
        cfg.pin = pinDebugPins[i].pin;
        cfg.mode = Mode_Out_PP;
        cfg.speed = Speed_2MHz;
        gpioInit(pinDebugPins[i].gpio, &cfg);
        digitalHi(pinDebugPins[i].gpio, pinDebugPins[i].pin);
        delay(1);
        digitalLo(pinDebugPins[i].gpio, pinDebugPins[i].pin);
    }
}

bool pinDebugIsPinUsed(GPIO_TypeDef* gpio, uint16_t pin)
{
    for(unsigned i = 0;i < ARRAYLEN(pinDebugPins); i++)
        if((pinDebugPins[i].gpio == gpio) && (pinDebugPins[i].pin & pin))
            return true;
    return false;
}

#endif
