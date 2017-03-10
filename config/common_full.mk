# Inherit common FIREHOUND stuff
$(call inherit-product, vendor/fh/config/common.mk)

PRODUCT_SIZE := full

# Include FireHound audio files
include vendor/fh/config/fh_audio.mk

# Optional FireHound packages
PRODUCT_PACKAGES += \
    Galaxy4 \
    HoloSpiralWallpaper \
    LiveWallpapers \
    LiveWallpapersPicker \
    MagicSmokeWallpapers \
    NoiseField \
    PhaseBeam \
    PhotoTable \
    SoundRecorder \
    PhotoPhase \
    Screencast

# Extra tools in FireHound
PRODUCT_PACKAGES += \
    7z \
    lib7z \
    bash \
    bzip2 \
    curl \
    powertop \
    unrar \
    unzip \
    vim \
    wget \
    zip

# Recorder
PRODUCT_PACKAGES += \
    Recorder
