$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_eu_supl.mk)

DEVICE_PACKAGE_OVERLAYS += device/acer/swing/overlay



# These are the hardware-specific features
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml

# This device is xhdpi.  However the platform doesn't
# currently contain all of the bitmaps at xhdpi density so

# we do this little trick to fall back to the hdpi version
# if the xhdpi doesn't exist.
PRODUCT_AAPT_CONFIG := normal hdpi xhdpi
PRODUCT_AAPT_PREF_CONFIG := xhdpi

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/vold.fstab:system/etc/vold.fstab \
    $(LOCAL_PATH)/configs/media_profiles.xml:system/etc/media_profiles.xml


# Key layouts and touchscreen
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/acer-input.idc:system/usr/idc/acer-input.idc \
    $(LOCAL_PATH)/configs/cypress-ts.idc:system/usr/idc/cypress-ts.idc \
    $(LOCAL_PATH)/configs/msm8960-snd-card_Button_Jack.kl:system/usr/keylayout/msm8960-snd-card_Button_Jack.kl 

$(call inherit-product-if-exists, vendor/acer/swing/swing-vendor.mk)

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/base/nfc-extras/com.android.nfc_extras.xml:system/etc/permissions/com.android.nfc_extras.xml \
    frameworks/native/data/etc/android.hardware.nfc.xml:system/etc/permissions/android.hardware.nfc.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:system/etc/permissions/android.software.live_wallpaper.xml

# EGL config
PRODUCT_COPY_FILES += \
    device/acer/swing/configs/egl.cfg:system/lib/egl/egl.cfg


# call dalvik heap config
$(call inherit-product, frameworks/native/build/phone-xhdpi-1024-dalvik-heap.mk)

# Extra properties
PRODUCT_PROPERTY_OVERRIDES += \
    ro.setupwizard.enable_bypass=1 \
    dalvik.vm.lockprof.threshold=500 \
    ro.com.google.locationfeatures=1 \
    dalvik.vm.dexopt-flags=m=y

# We have enough space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

# Set build date
PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0

# Device uses high-density artwork where available
PRODUCT_AAPT_CONFIG := normal hdpi
PRODUCT_AAPT_PREF_CONFIG := hdpi
PRODUCT_LOCALES += en_US hdpi

# Audio
PRODUCT_PACKAGES += \
    audio.a2dp.default \
    audio_policy.msm8960 \
    audio.primary.msm8960 \
    libalsa-intf \
    libaudioutils

# Graphics
PRODUCT_PACKAGES += \
    copybit.msm8960 \
    gralloc.msm8960 \
    hwcomposer.msm8960 \
    libgenlock \
    libhwcexternal \
    libhwcservice \
    libmemalloc \
    liboverlay \
    libqdutils \
    libtilerenderer

# OMX
PRODUCT_PACKAGES += \
    libdivxdrmdecrypt \
    libI420colorconvert \
    libmm-omxcore \
    libOmxCore \
    libOmxVdec \
    libOmxVenc \
    libOmxAacEnc \
    libOmxAmrEnc \
    libOmxEvrcEnc \
    libOmxQcelp13Enc \
    libstagefrighthw

# Power
PRODUCT_PACKAGES += \
    power.msm8960

# HDMI
PRODUCT_PACKAGES += \
    hdmid

# QCOM rngd
PRODUCT_PACKAGES += \
    qrngd

# USB
PRODUCT_PACKAGES += \
    com.android.future.usb.accessory

# Filesystem management tools
PRODUCT_PACKAGES += \
    make_ext4fs \
    setup_fs

# Torch
PRODUCT_PACKAGES += \
    Torch

# CloudMobile settings
PRODUCT_PACKAGES += \
    CloudMobileSettings

# NFC Support
PRODUCT_PACKAGES += \
    libnfc \
    libnfc_jni \
    Nfc \
    Tag \
    com.android.nfc_extras
	
# NFCEE access control
ifeq ($(TARGET_BUILD_VARIANT),user)
    NFCEE_ACCESS_PATH := device/lge/mako/nfc/nfcee_access.xml
else
    NFCEE_ACCESS_PATH := device/lge/mako/nfc/nfcee_access_debug.xml
endif

PRODUCT_COPY_FILES += \
    device/acer/swing/configs/audio_policy.conf:system/etc/audio_policy.conf \
    device/acer/swing/configs/audio_effects.conf:system/etc/audio_effects.conf \
    device/acer/swing/configs/media_codecs.xml:system/etc/media_codecs.xml

# CNE config
PRODUCT_COPY_FILES += \
   device/acer/swing/configs/OperatorPolicy.xml:system/etc/OperatorPolicy.xml \
   device/acer/swing/configs/UserPolicy.xml:system/etc/UserPolicy.xml
  
# Keylayouts and Keychars
PRODUCT_COPY_FILES += \
    device/acer/swing/keychars/keypad_swing_qwerty.kcm:system/usr/keychars/keypad_swing_qwerty.kcm \
    device/acer/swing/keylayout/AVRCP.kl:system/usr/keylayout/AVRCP.kl 

# ALSA configuration
PRODUCT_COPY_FILES += \
    device/acer/swing/configs/snd_soc_msm_2x:system/etc/snd_soc_msm/snd_soc_msm \
    device/acer/swing/configs/snd_soc_msm_a9:system/etc/snd_soc_msm/snd_soc_msm_2x \
    device/acer/swing/configs/snd_soc_msm_2x:system/etc/snd_soc_msm/snd_soc_msm_Sitar

# Thermal monitor configuration
PRODUCT_COPY_FILES += \
    device/acer/swing/configs/thermald.conf:system/etc/thermald.conf

# wifi config
PRODUCT_COPY_FILES += \
    device/acer/swing/configs/wpa_supplicant.conf:/system/etc/wifi/wpa_supplicant.conf 
	
# Set default USB interface
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    persist.sys.usb.config=mtp,adb

#QCOM Display overrides
PRODUCT_PROPERTY_OVERRIDES += \
    debug.sf.hw=1 \
    debug.egl.hw=1 \
    debug.composition.type=dyn \
    persist.gps.qmienabled=true \
    persist.hwc.mdpcomp.enable=true \
    debug.mdpcomp.logs=0 \
	dev.pm.dyn_samplingrate=1

# Audio overrides
PRODUCT_PROPERTY_OVERRIDES += \
	persist.audio.fluence.mode=endfire \
	persist.audio.vr.enable=false \
	persist.audio.handset.mic=analog \
    lpa.decode=true \
	ro.qc.sdk.audio.ssr=false \
	ro.qc.sdk.audio.fluencetype=fluence \
	ro.qc.sdk.camera.facialproc=false \
	ro.qc.sdk.sensors.gestures=false \
    ro.qualcomm.bt.hci_transport=smd

#system prop for Bluetooth hci transport
PRODUCT_PROPERTY_OVERRIDES += \
    ro.bluetooth.request.master=true \
    ro.bluetooth.remote.autoconnect=true
