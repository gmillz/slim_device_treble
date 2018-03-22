$(call inherit-product, vendor/slim/config/common_full_phone.mk)

include build/make/target/product/treble_common.mk

$(call inherit-product, device/treble/base.mk)

PRODUCT_NAME := slim_arm64_a
PRODUCT_DEVICE := arm64_a
PRODUCT_BRAND := Android
PRODUCT_MODEL := Slim Treble Arm64
