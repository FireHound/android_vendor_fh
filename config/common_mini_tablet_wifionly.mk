# Inherit mini common FireHound stuff
$(call inherit-product, vendor/fh/config/common_mini.mk)

# Required packages
PRODUCT_PACKAGES += \
    LatinIME
