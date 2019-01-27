# Copyright (C) 2019 ZenOS ROM
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

ZEN_MOD_VERSION = 9.0

ifndef ZEN_BUILD_TYPE
    ZEN_BUILD_TYPE := UNOFFICIAL
endif

CURRENT_DEVICE=$(shell echo "$(TARGET_PRODUCT)" | cut -d'_' -f 2,3)

ifeq ($(ZEN_OFFICIAL),true)
     LIST = $(shell curl -s https://raw.githubusercontent.com/Zen-OS/vendor_zen/pie/zen.devices)
     FOUND_DEVICE =  $(filter $(CURRENT_DEVICE), $(LIST))
      ifeq ($(FOUND_DEVICE),$(CURRENT_DEVICE))
        IS_OFFICIAL=true
        ZEN_BUILD_TYPE := OFFICIAL

      else
        ZEN_BUILD_TYPE := UNOFFICIAL
      endif
endif

TARGET_PRODUCT_SHORT := $(subst zen_,,$(ZEN_BUILD_TYPE))

ZEN_VERSION := ZenOS-$(ZEN_MOD_VERSION)-$(CURRENT_DEVICE)-$(ZEN_BUILD_TYPE)-$(shell date -u +%Y%m%d)
ROM_FINGERPRINT := ZenOS/$(PLATFORM_VERSION)/$(TARGET_PRODUCT_SHORT)/$(DATE)


PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
  ro.zen.version=$(ZEN_VERSION) \
  ro.zen.releasetype=$(ZEN_BUILD_TYPE) \
  ro.mod.version=$(ZEN_MOD_VERSION) \
  ro.zen.fingerprint=$(ROM_FINGERPRINT)

ZEN_DISPLAY_VERSION := ZenOS-$(ZEN_MOD_VERSION)-$(ZEN_BUILD_TYPE)

PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
  ro.zen.display.version=$(ZEN_DISPLAY_VERSION)
