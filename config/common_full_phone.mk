# Inherit full common fireHound stuff
$(call inherit-product, vendor/fh/config/common_full.mk)

# Required packages
PRODUCT_PACKAGES += \
    LatinIME

# Include FireHound LatinIME dictionaries
PRODUCT_PACKAGE_OVERLAYS += vendor/fh/overlay/dictionaries

$(call inherit-product, vendor/fh/config/telephony.mk)
