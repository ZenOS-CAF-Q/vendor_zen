# Copyright (C) 2018 The ZenOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Accent and Base packages
PRODUCT_PACKAGES += \
    AmberTheme \
    BlueTheme \
    CyanTheme \
    DeepOrangeTheme \
    DeepPurpleTheme \
    GreenTheme \
    IndigoTheme \
    LightBlueTheme \
    LightGreenTheme \
    LimeTheme \
    OrangeTheme \
    PinkTheme \
    PixelBaseTheme \
    PixelTheme \
    PurpleTheme \
    RedTheme \
    StockBaseTheme \
    StockFixedBaseTheme \
    StockTheme \
    YellowTheme \
    MintGreenTheme

# Dark/BlackUI Packages
PRODUCT_PACKAGES += \
    GBoardDarkTheme \
    SettingsDarkTheme \
    SystemDarkTheme \
    SysuiQsDarkTheme \
    SettingsBlackTheme \
    SystemBlackTheme \
    SysuiQsBlackTheme

# Settings Icon Tint
PRODUCT_PACKAGES += \
    SettingsIconTint \
    SettingsIconTintDark

# QS tile styles
PRODUCT_PACKAGES += \
    QStileCircleTrim \
    QStileDefault \
    QStileDualToneCircle \
    QStileSquircleTrim

# Google Packages
PRODUCT_PACKAGES += \
    SoundPickerPrebuilt \
    Wallpapers

# ZenOS Additions
PRODUCT_PACKAGES += \
    WeatherClient \
    YogaQuickStep \
    CustomDoze

# Weather client
PRODUCT_COPY_FILES += \
    vendor/zen/etc/permissions/org.pixelexperience.weather.client.xml:system/etc/permissions/org.pixelexperience.weather.client.xml \
    vendor/zen/etc/default-permissions/org.pixelexperience.weather.client.xml:system/etc/default-permissions/org.pixelexperience.weather.client.xml
