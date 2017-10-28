#
# Copyright (C) 2017 FireHound
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
#

# Product version should match Android version
PRODUCT_VERSION_MAJOR = 8
PRODUCT_VERSION_MINOR = 0

# Custom FireHound Version
FH_VERSION_MAJOR := 4
FH_VERSION_MINOR := 0

# Release
ifeq ($(FH_RELEASE),true)
    FH_VERSION := $(FH_VERSION_MAJOR).$(FH_VERSION_MINOR)-OFFICIAL-$(shell date -u +%Y%m%d)-$(FH_BUILD)
else
    FH_VERSION := $(FH_VERSION_MAJOR).$(FH_VERSION_MINOR)-UNOFFICIAL-$(shell date -u +%Y%m%d)-$(FH_BUILD)
endif

# Extras
PRODUCT_PROPERTY_OVERRIDES += \
    ro.fh.version=$(FH_VERSION) \
    ro.fh.build.version=$(FH_VERSION_MAJOR).$(FH_VERSION_MINOR) \
    ro.modversion=$(FH_VERSION) \

# Display ID
FH_DISPLAY_VERSION := $(FH_VERSION)

PRODUCT_PROPERTY_OVERRIDES += \
    ro.fh.display.version=$(FH_DISPLAY_VERSION)

# Custom FireHound Packages
PRODUCT_PACKAGES += \
    CameraNextMod \
    Chromium \
    SettingsDarkThemeOverlay

# Default Theme
PRODUCT_PROPERTY_OVERRIDES += \
    ro.boot.vendor.overlay.theme=com.google.android.theme.pixel

# DU Utils Library
PRODUCT_PACKAGES += \
    org.dirtyunicorns.utils

PRODUCT_BOOT_JARS += \
    org.dirtyunicorns.utils
