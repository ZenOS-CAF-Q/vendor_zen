PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0

ifeq ($(PRODUCT_GMS_CLIENTID_BASE),)
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.clientidbase=android-google
else
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.clientidbase=$(PRODUCT_GMS_CLIENTID_BASE)
endif

PRODUCT_PROPERTY_OVERRIDES += \
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
PRODUCT_PROPERTY_OVERRIDES += \
    ro.build.selinux=1

# Enable tethering
PRODUCT_PROPERTY_OVERRIDES += \
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

# ZenOS Common
PRODUCT_COPY_FILES += \
    vendor/zen/prebuilt/common/etc/permissions/privapp-permissions-zen.xml:system/etc/permissions/privapp-permissions-zen.xml

# Power whitelist
PRODUCT_COPY_FILES += \
    vendor/zen/configs/permissions/custom-power-whitelist.xml:system/etc/sysconfig/custom-power-whitelist.xml

# ART definitions
include vendor/zen/configs/art.mk

# Packages
include vendor/zen/configs/packages.mk

# Branding
include vendor/zen/configs/version.mk

# System Additions
include vendor/zen/configs/system_additions.mk

# Overlays
PRODUCT_PACKAGE_OVERLAYS += \
    vendor/zen/overlay/common

BUILD_RRO_SYSTEM_PACKAGE := $(TOPDIR)vendor/zen/build/core/system_rro.mk
