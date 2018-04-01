#Huawei devices don't declare fingerprint and telephony hardware feature
#TODO: Proper detection
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.fingerprint.xml:system/etc/permissions/android.hardware.fingerprint.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml

BOARD_PLAT_PRIVATE_SEPOLICY_DIR += device/treble/sepolicy
DEVICE_PACKAGE_OVERLAYS += device/treble/overlay

$(call inherit-product, vendor/vndk/vndk.mk)
$(call inherit-product, vendor/hardware_overlay/overlay.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base_telephony.mk)

#Those overrides are here because Huawei's init read properties
#from /system/etc/prop.default, then /vendor/build.prop, then /system/build.prop
#So we need to set our props in prop.default
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.build.version.sdk=$(PLATFORM_SDK_VERSION) \
    ro.build.version.codename=$(PLATFORM_VERSION_CODENAME) \
    ro.build.version.all_codenames=$(PLATFORM_VERSION_ALL_CODENAMES) \
    ro.build.version.release=$(PLATFORM_VERSION)

#VNDK config files
PRODUCT_COPY_FILES += \
    device/treble/config/vndk-detect:system/bin/vndk-detect \
    device/treble/config/vndk.rc:system/etc/init/vndk.rc \
    device/treble/config/ld.config.26.txt:system/etc/ld.config.26.txt \
    device/treble/config/ld.config.27.txt:system/etc/ld.config.27.txt \


# NFC:
#   Provide default libnfc-nci.conf file for devices that does not have one in
#   vendor/etc
PRODUCT_COPY_FILES += \
    device/treble/config/nfc/libnfc-nci.conf:system/etc/libnfc-nci.conf

PRODUCT_PACKAGES += \
    treble-environ-rc
