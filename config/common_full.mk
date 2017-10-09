# Inherit common FireHound stuff
$(call inherit-product, vendor/fh/config/common.mk)

PRODUCT_SIZE := full

# Recorder
PRODUCT_PACKAGES += \
    Recorder
