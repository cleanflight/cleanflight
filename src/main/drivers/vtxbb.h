typedef struct vtxbbHardware_s {
	GPIO_TypeDef *ss_gpio;
	uint16_t ss_pin;
	GPIO_TypeDef *sck_gpio;
	uint16_t sck_pin;
	GPIO_TypeDef *mosi_gpio;
	uint16_t mosi_pin;
} vtxbbHardware_t;

typedef struct vtxbb_s {
    bool active;
    GPIO_TypeDef *ss_gpio;
    gpio_config_t ss_cfg;
    GPIO_TypeDef *sck_gpio;
    gpio_config_t sck_cfg;
    GPIO_TypeDef *mosi_gpio;
    gpio_config_t mosi_cfg;
} vtxbb_t;

vtxbbHardware_t *vtxbbGetHardwareConfig();

#define VTXBB_SS_LO(vtxbb) \
    digitalLo(vtxbb->ss_gpio, vtxbb->ss_cfg.pin)
#define VTXBB_SS_HI(vtxbb) \
    digitalHi(vtxbb->ss_gpio, vtxbb->ss_cfg.pin)
#define VTXBB_SCK_LO(vtxbb) \
    digitalLo(vtxbb->sck_gpio, vtxbb->sck_cfg.pin)
#define VTXBB_SCK_HI(vtxbb) \
    digitalHi(vtxbb->sck_gpio, vtxbb->sck_cfg.pin)
#define VTXBB_MOSI_LO(vtxbb) \
    digitalLo(vtxbb->mosi_gpio, vtxbb->mosi_cfg.pin)
#define VTXBB_MOSI_HI(vtxbb) \
    digitalHi(vtxbb->mosi_gpio, vtxbb->mosi_cfg.pin)
