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

#include "config/parameter_group.h"
#include "config/parameter_group_ids.h"
#include "fc/config.h"

#include "io/vtx_settings_config.h"

#ifdef VTX_SETTINGS_CONFIG

PG_REGISTER_WITH_RESET_TEMPLATE(vtxSettingsConfig_t, vtxSettingsConfig, PG_VTX_SETTINGS_CONFIG, 0);

PG_RESET_TEMPLATE(vtxSettingsConfig_t, vtxSettingsConfig,
    .band = VTX_SETTINGS_DEFAULT_BAND,
    .channel = VTX_SETTINGS_DEFAULT_CHANNEL,
    .power = VTX_SETTINGS_DEFAULT_POWER
);


void vtxSettingsSaveBandAndChannel(uint8_t band, uint8_t channel)
{
    bool modFlag = false;
    if (band != vtxSettingsConfigMutable()->band) {
        vtxSettingsConfigMutable()->band = band;
        modFlag = true;
    }
    if (channel != vtxSettingsConfigMutable()->channel) {
        vtxSettingsConfigMutable()->channel = channel;
        modFlag = true;
    }
    if (modFlag) {
        // need to save config so vtx settings in place after reboot
        saveConfigAndNotify();
    }
}

void vtxSettingsSavePowerByIndex(uint8_t index)
{
    if (index != vtxSettingsConfigMutable()->power) {
        vtxSettingsConfigMutable()->power = index;
        // need to save config so vtx settings in place after reboot
        saveConfigAndNotify();
    }
}

void vtxSettingsSaveBandChanAndPower(uint8_t band, uint8_t channel, uint8_t index)
{
    bool modFlag = false;
    if (band != vtxSettingsConfigMutable()->band) {
        vtxSettingsConfigMutable()->band = band;
        modFlag = true;
    }
    if (channel != vtxSettingsConfigMutable()->channel) {
        vtxSettingsConfigMutable()->channel = channel;
        modFlag = true;
    }
    if (index != vtxSettingsConfigMutable()->power) {
        vtxSettingsConfigMutable()->power = index;
        modFlag = true;
    }
    if (modFlag) {
        // need to save config so vtx settings in place after reboot
        saveConfigAndNotify();
    }
}

void vtxSettingsSaveFrequency(uint16_t freq)
{
    //future impl will be to save to a 'vtx_freq' setting, but for now just set
    // 'vtx_band' to 0 to prevent user freq from being overridden at startup
    UNUSED(freq);

    if (vtxSettingsConfigMutable()->band != 0) {
        vtxSettingsConfigMutable()->band = 0;
        // need to save config so vtx settings in place after reboot
        saveConfigAndNotify();
    }
}

#endif  //VTX_SETTINGS_CONFIG
