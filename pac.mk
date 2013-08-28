# Specify phone tech before including full_phone
$(call inherit-product, vendor/cm/config/gsm.mk)

# Release name
PRODUCT_RELEASE_NAME := swing

# Inherit vendor blobs.
$(call inherit-product, vendor/acer/swing/swing-vendor-blobs.mk)

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/acer/swing/device_swing.mk)

# Device naming
PRODUCT_DEVICE := swing
PRODUCT_NAME := pac_swing
PRODUCT_BRAND := acer
PRODUCT_MODEL := CloudMobile
PRODUCT_MANUFACTURER := acer

# Set build fingerprint / ID / Product Name ect.
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=acer_swing BUILD_FINGERPRINT=acer/swing/swing:4.0.4/IMM76D/96068.7:user/release-keys PRIVATE_BUILD_DESC="=2.35.531.7 CL96068 release-keys" BUILD_NUMBER=96068
