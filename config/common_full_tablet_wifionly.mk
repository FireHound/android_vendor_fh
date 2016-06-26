# Inherit common FireHound stuff
$(call inherit-product, vendor/fh/config/common_full.mk)

# Required FireHound packages
PRODUCT_PACKAGES += \
    LatinIME

# Include FireHound LatinIME dictionaries
PRODUCT_PACKAGE_OVERLAYS += vendor/fh/overlay/dictionaries

# Default notification/alarm sounds
PRODUCT_PROPERTY_OVERRIDES += \
    ro.config.notification_sound=Argon.ogg \
    ro.config.alarm_alert=Helium.ogg
