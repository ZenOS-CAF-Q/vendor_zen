PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0

ifeq ($(PRODUCT_GMS_CLIENTID_BASE),)
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.com.google.clientidbase=android-google
else
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.com.google.clientidbase=$(PRODUCT_GMS_CLIENTID_BASE)
endif

# General Properties
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    keyguard.no_require_sim=true \
    dalvik.vm.debug.alloc=0 \
    ro.url.legal=http://www.google.com/intl/%s/mobile/android/basic/phone-legal.html \
    ro.url.legal.android_privacy=http://www.google.com/intl/%s/mobile/android/basic/privacy.html \
    ro.error.receiver.system.apps=com.google.android.gms \
    ro.setupwizard.enterprise_mode=1 \
    ro.com.android.dataroaming=false \
    ro.atrace.core.services=com.google.android.gms,com.google.android.gms.ui,com.google.android.gms.persistent \
    ro.com.android.dateformat=MM-dd-yyyy \
    persist.sys.disable_rescue=true \
    ro.boot.vendor.overlay.theme=com.zen.overlay.accent.indigo;com.zen.overlay.base.stockfixed

#SELinux
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.build.selinux=1

# Enable tethering
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    persist.sys.dun.override=0

# Backup Tool
PRODUCT_COPY_FILES += \
    vendor/zen/prebuilt/common/bin/backuptool.sh:install/bin/backuptool.sh \
    vendor/zen/prebuilt/common/bin/backuptool.functions:install/bin/backuptool.functions \
    vendor/zen/prebuilt/common/bin/50-zen.sh:system/addon.d/50-zen.sh \
    vendor/zen/prebuilt/common/bin/blacklist:system/addon.d/blacklist

ifeq ($(AB_OTA_UPDATER),true)
PRODUCT_COPY_FILES += \
    vendor/zen/prebuilt/common/bin/backuptool_ab.sh:system/bin/backuptool_ab.sh \
    vendor/zen/prebuilt/common/bin/backuptool_ab.functions:system/bin/backuptool_ab.functions \
    vendor/zen/prebuilt/common/bin/backuptool_postinstall.sh:system/bin/backuptool_postinstall.sh
endif

# Don't compile SystemUITests
EXCLUDE_SYSTEMUI_TESTS := true

# ZenOS Common
PRODUCT_COPY_FILES += \
    vendor/zen/prebuilt/common/etc/permissions/privapp-permissions-zen.xml:system/etc/permissions/privapp-permissions-zen.xml

# Power whitelist
PRODUCT_COPY_FILES += \
    vendor/zen/configs/permissions/custom-power-whitelist.xml:system/etc/sysconfig/custom-power-whitelist.xml

# Lawnchair
PRODUCT_COPY_FILES += \
    vendor/zen/prebuilt/common/etc/permissions/privapp-permissions-lawnchair.xml:system/etc/permissions/privapp-permissions-lawnchair.xml \
    vendor/zen/prebuilt/common/etc/sysconfig/lawnchair-hiddenapi-package-whitelist.xml:system/etc/sysconfig/lawnchair-hiddenapi-package-whitelist.xml

# Copy all custom init rc files
$(foreach f,$(wildcard vendor/zen/prebuilt/common/etc/init/*.rc),\
    $(eval PRODUCT_COPY_FILES += $(f):system/etc/init/$(notdir $f)))

# ART definitions
include vendor/zen/configs/art.mk

# Packages
include vendor/zen/configs/packages.mk

# Branding
include vendor/zen/configs/version.mk

# ZenOTA
include vendor/zen/configs/ota.mk

# System Additions
include vendor/zen/configs/system_additions.mk

# Overlays
PRODUCT_ENFORCE_RRO_EXCLUDED_OVERLAYS += vendor/zen/overlay
DEVICE_PACKAGE_OVERLAYS += vendor/zen/overlay/common
