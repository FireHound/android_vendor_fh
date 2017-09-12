# Inherit common CM stuff
$(call inherit-product, vendor/fh/config/common_full.mk)

PRODUCT_PACKAGES += TvSettings

DEVICE_PACKAGE_OVERLAYS += vendor/cm/overlay/tv
