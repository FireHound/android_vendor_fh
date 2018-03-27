# Inherit full common FireHound stuff
$(call inherit-product, vendor/fh/config/common_full.mk)

PRODUCT_PACKAGES += TvSettings

DEVICE_PACKAGE_OVERLAYS += vendor/fh/overlay/tv
