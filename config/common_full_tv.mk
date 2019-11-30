# Exclude AudioFX
TARGET_EXCLUDES_AUDIOFX := true

# Inherit full common Lineage stuff
$(call inherit-product, vendor/fh/config/common_full.mk)

# Inherit Lineage atv device tree
$(call inherit-product, device/lineage/atv/lineage_atv.mk)

PRODUCT_PACKAGES += \
    AppDrawer \
    LineageCustomizer

DEVICE_PACKAGE_OVERLAYS += vendor/fh/overlay/tv
