# Inherit mini common Lineage stuff
$(call inherit-product, vendor/fh/config/common_mini.mk)

# Required packages
PRODUCT_PACKAGES += \
    LatinIME
