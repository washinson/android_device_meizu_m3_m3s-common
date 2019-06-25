$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
# It crashes RIL
#$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

COMMON_PATH := device/meizu/m3_m3s-common

DEVICE_PACKAGE_OVERLAYS += $(COMMON_PATH)/overlay

# MTK's XLog needed for Engineer Mode
PRODUCT_PACKAGES += \
    libxlog

# Bluetooth
PRODUCT_PACKAGES += \
    libbt-vendor

# Keyboard layout
PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/keylayout/mtk-kpd.kl:system/usr/keylayout/mtk-kpd.kl \
    $(COMMON_PATH)/keylayout/ACCDET.kl:system/usr/keylayout/ACCDET.kl \
    $(COMMON_PATH)/keylayout/AVRCP.kl:system/usr/keylayout/AVRCP.kl \
    $(COMMON_PATH)/keylayout/AW9201_ts.kl:system/usr/keylayout/AW9201_ts.kl \
    $(COMMON_PATH)/keylayout/mtk-tpd.kl:system/usr/keylayout/mtk-tpd.kl

PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/rootdir/init.rc:root/init.rc \
    $(COMMON_PATH)/rootdir/enableswap.sh:root/enableswap.sh \
    $(COMMON_PATH)/rootdir/init.mt6755.rc:root/init.mt6755.rc \
    $(COMMON_PATH)/rootdir/init.ssd.rc:root/init.ssd.rc \
    $(COMMON_PATH)/rootdir/init.xlog.rc:root/init.xlog.rc \
    $(COMMON_PATH)/rootdir/init.usb.rc:root/init.usb.rc \
    $(COMMON_PATH)/rootdir/init.mt6755.usb.rc:root/init.mt6755.usb.rc \
    $(COMMON_PATH)/rootdir/init.aee.rc:root/init.aee.rc \
    $(COMMON_PATH)/rootdir/init.project.rc:root/init.project.rc \
    $(COMMON_PATH)/rootdir/init.modem.rc:root/init.modem.rc \
    $(COMMON_PATH)/rootdir/init.trace.rc:root/init.trace.rc \
    $(COMMON_PATH)/rootdir/fstab.mt6755:root/fstab.mt6755 \
    $(COMMON_PATH)/rootdir/init.nvdata.rc:root/init.nvdata.rc \
    $(COMMON_PATH)/rootdir/ueventd.mt6755.rc:root/ueventd.mt6755.rc \
    $(COMMON_PATH)/configs/media_codecs.xml:system/etc/media_codecs.xml \
    $(COMMON_PATH)/configs/media_profiles.xml:system/etc/media_profiles.xml \
    $(COMMON_PATH)/configs/android.hardware.microphone.xml:system/etc/permissions/android.hardware.microphone.xml \
    $(COMMON_PATH)/configs/android.hardware.camera.xml:system/etc/permissions/android.hardware.camera.xml \
    $(COMMON_PATH)/configs/audio_policy.conf:system/etc/audio_policy.conf \
    $(COMMON_PATH)/configs/audio_device.xml:system/etc/audio_device.xml \
    frameworks/native/data/etc/android.software.app_widgets.xml:system/etc/permissions/android.software.app_widgets.xml \
    frameworks/native/data/etc/android.hardware.audio.output.xml:system/etc/permissions/android.hardware.audio.output.xml \
    frameworks/native/data/etc/android.hardware.bluetooth.xml:system/etc/permissions/android.hardware.bluetooth.xml \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.faketouch.xml:system/etc/permissions/android.hardware.faketouch.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml 

# RIL
PRODUCT_PACKAGES += \
    gsm0710muxd

PRODUCT_PACKAGES += \
    Torch

# Wifi
PRODUCT_PACKAGES += \
    libwpa_client \
    hostapd \
    dhcpcd.conf \
    wpa_supplicant \
    wpa_supplicant.conf

PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/configs/hostapd_default.conf:system/etc/hostapd/hostapd_default.conf \

# Audio componets from source
PRODUCT_PACKAGES += \
    audio.usb.default \
    audio.r_submix.default

ADDITIONAL_DEFAULT_PROPERTIES += ro.secure=0 \
    ro.allow.mock.location=1 \
    ro.debuggable=1 \
    ro.adb.secure=0 \
    persist.service.acm.enable=0 \
    persist.sys.usb.config=mtp \
    ro.mount.fs=EXT4 \
    debug.hwui.render_dirty_regions=false \
    ro.sf.lcd_density=320 \
    ro.hardware.bluetooth=blueangel \
    persist.radio.multisim.config=dsds \
    ro.mtk_lte_support=1 \
    ro.telephony.ril_class=MediaTekRIL \
    ro.telephony.ril.config=fakeiccid \
    ro.telephony.sim.count=2 \
    persist.gemini.sim_num=2 \
    ril.current.share_modem=2 \
    ro.mtk_gps_support=1 \
    ro.mtk_agps_app=1 \
    persist.debug.xlog.enable=1 

$(call inherit-product, build/target/product/aosp_arm64.mk)
# Useless
#$(call inherit-product, build/target/product/full.mk)

