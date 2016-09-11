PRODUCT_BRAND ?= fh

PRODUCT_BOOTANIMATION := vendor/fh/prebuilt/common/bootanimation/bootanimation.zip

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
    ro.url.legal=http://www.google.com/intl/%s/mobile/android/basic/phone-legal.html \
    ro.url.legal.android_privacy=http://www.google.com/intl/%s/mobile/android/basic/privacy.html \
    ro.com.android.wifi-watchlist=GoogleGuest \
    ro.setupwizard.enterprise_mode=1 \
    ro.com.android.dateformat=MM-dd-yyyy \
    ro.com.android.dataroaming=false

PRODUCT_PROPERTY_OVERRIDES += \
    ro.build.selinux=1

ifneq ($(TARGET_BUILD_VARIANT),user)
# Thank you, please drive thru!
PRODUCT_PROPERTY_OVERRIDES += persist.sys.dun.override=0
endif

ifneq ($(TARGET_BUILD_VARIANT),eng)
# Enable ADB authentication
ADDITIONAL_DEFAULT_PROPERTIES += ro.adb.secure=1
endif

# Backup Tool
PRODUCT_COPY_FILES += \
    vendor/fh/prebuilt/common/bin/backuptool.sh:install/bin/backuptool.sh \
    vendor/fh/prebuilt/common/bin/backuptool.functions:install/bin/backuptool.functions \
    vendor/fh/prebuilt/common/bin/50-fh.sh:system/addon.d/50-fh.sh \
    vendor/fh/prebuilt/common/bin/blacklist:system/addon.d/blacklist
    
# FireHound Addons
PRODUCT_COPY_FILES += \
    vendor/fh/prebuilt/common/priv-app/CameraNextModv7/CameraNextModv7.apk:system/priv-app/CameraNextModv7/CameraNextModv7.apk \
    vendor/fh/prebuilt/common/priv-app/CameraNextModv7/lib/arm/libjni_mosaic_next.so:system/priv-app/CameraNextModv7/lib/arm/libjni_mosaic_next.so \
    vendor/fh/prebuilt/common/priv-app/CameraNextModv7/lib/arm/libjni_tinyplanet_next.so:system/priv-app/CameraNextModv7/lib/arm/libjni_tinyplanet_next.so \

# Backup Services whitelist
PRODUCT_COPY_FILES += \
    vendor/fh/config/permissions/backup.xml:system/etc/sysconfig/backup.xml

# Signature compatibility validation
PRODUCT_COPY_FILES += \
    vendor/fh/prebuilt/common/bin/otasigcheck.sh:install/bin/otasigcheck.sh

# init.d support
PRODUCT_COPY_FILES += \
    vendor/fh/prebuilt/common/etc/init.d/00banner:system/etc/init.d/00banner \
    vendor/fh/prebuilt/common/bin/sysinit:system/bin/sysinit

ifneq ($(TARGET_BUILD_VARIANT),user)
# userinit support
PRODUCT_COPY_FILES += \
    vendor/fh/prebuilt/common/etc/init.d/90userinit:system/etc/init.d/90userinit
endif

# FireHound-specific init file
PRODUCT_COPY_FILES += \
    vendor/fh/prebuilt/common/etc/init.local.rc:root/init.fh.rc

# Copy over added mimetype supported in libcore.net.MimeUtils
PRODUCT_COPY_FILES += \
    vendor/fh/prebuilt/common/lib/content-types.properties:system/lib/content-types.properties

# Enable SIP+VoIP on all targets
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml

# Enable wireless Xbox 360 controller support
PRODUCT_COPY_FILES += \
    frameworks/base/data/keyboards/Vendor_045e_Product_028e.kl:system/usr/keylayout/Vendor_045e_Product_0719.kl

# This is FireHound based on Cyanogenmod!
PRODUCT_COPY_FILES += \
    vendor/fh/config/permissions/com.cyanogenmod.android.xml:system/etc/permissions/com.cyanogenmod.android.xml

# Theme engine
include vendor/fh/config/themes_common.mk

ifneq ($(TARGET_DISABLE_CMSDK), true)
# CMSDK
include vendor/fh/config/cmsdk_common.mk
endif

# Required FireHound packages
PRODUCT_PACKAGES += \
    BluetoothExt \
    CMAudioService \
    CMParts \
    Development \
    Profiles \
    WeatherManagerService

# Optional FireHound packages
PRODUCT_PACKAGES += \
    libemoji \
    Terminal

# Include librsjni explicitly to workaround GMS issue
PRODUCT_PACKAGES += \
    librsjni

# Custom FireHound packages
PRODUCT_PACKAGES += \
    Launcher3 \
    Trebuchet \
    AudioFX \
    CMWallpapers \
    CMFileManager \
    Eleven \
    LockClock \
    CMUpdater \
    CyanogenSetupWizard \
    CMSettingsProvider \
    ExactCalculator \
    LiveLockScreenService \
    WeatherProvider \
    DataUsageProvider \
    WallpaperPicker

# Exchange support
PRODUCT_PACKAGES += \
    Exchange2

# Extra tools in FireHound
PRODUCT_PACKAGES += \
    libsepol \
    mke2fs \
    tune2fs \
    nano \
    htop \
    mkfs.ntfs \
    fsck.ntfs \
    mount.ntfs \
    gdbserver \
    micro_bench \
    oprofiled \
    sqlite3 \
    strace \
    pigz

# Custom off-mode charger
ifneq ($(WITH_CM_CHARGER),false)
PRODUCT_PACKAGES += \
    charger_res_images \
    cm_charger_res_images \
    font_log.png \
    libhealthd.cm
endif

# ExFAT support
WITH_EXFAT ?= true
ifeq ($(WITH_EXFAT),true)
TARGET_USES_EXFAT := true
PRODUCT_PACKAGES += \
    mount.exfat \
    fsck.exfat \
    mkfs.exfat
endif

# Openssh
PRODUCT_PACKAGES += \
    scp \
    sftp \
    ssh \
    sshd \
    sshd_config \
    ssh-keygen \
    start-ssh

# rsync
PRODUCT_PACKAGES += \
    rsync

# Stagefright FFMPEG plugin
#PRODUCT_PACKAGES += \
#    libffmpeg_extractor \
#    libffmpeg_omx \
#    media_codecs_ffmpeg.xml
#
#PRODUCT_PROPERTY_OVERRIDES += \
#    media.sf.omx-plugin=libffmpeg_omx.so \
#    media.sf.extractor-plugin=libffmpeg_extractor.so

# These packages are excluded from user builds
ifneq ($(TARGET_BUILD_VARIANT),user)
PRODUCT_PACKAGES += \
    procmem \
    procrank \
    su
endif

PRODUCT_PROPERTY_OVERRIDES += \
    persist.sys.root_access=0

DEVICE_PACKAGE_OVERLAYS += vendor/fh/overlay/common

# FireHound version
FH_RELEASE = false
FH_VERSION_MAJOR = 1
FH_VERSION_MINOR = 0

# Release
ifeq ($(FH_RELEASE),true)
    FH_VERSION := FireHound-BurntAss-$(FH_VERSION_MAJOR).$(FH_VERSION_MINOR)-OFFICIAL-$(shell date -u +%Y%m%d)-$(FH_BUILD)
else

FH_VERSION := FireHound-BurntAss-$(FH_VERSION_MAJOR).$(FH_VERSION_MINOR)-$(shell date -u +%Y%m%d)-$(FH_BUILD)
endif

FH_DISPLAY_VERSION := $(FH_VERSION)

PRODUCT_PROPERTY_OVERRIDES += \
  ro.fh.version=$(FH_VERSION) \
  ro.modversion=$(FH_VERSION)

PRODUCT_PROPERTY_OVERRIDES += \
ro.fh.display.version=$(FH_DISPLAY_VERSION)

-include vendor/fh-priv/keys/keys.mk

-include $(WORKSPACE)/build_env/image-auto-bits.mk
-include vendor/cm/config/partner_gms.mk
-include vendor/cyngn/product.mk

$(call prepend-product-if-exists, vendor/extra/product.mk)

