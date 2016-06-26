$(call inherit-product, vendor/fh/config/common_mini.mk)

# Required FireHound packages
PRODUCT_PACKAGES += \
    LatinIME

$(call inherit-product, vendor/fh/config/telephony.mk)
