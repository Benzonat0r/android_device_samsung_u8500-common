#
# Copyright (C) 2012 The Android Open-Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

# Inherit from those products. Most specific first.
$(call inherit-product, build/target/product/full_base_telephony.mk)
$(call inherit-product, build/target/product/languages_full.mk)

# Use the Dalvik VM specific for devices with 1024 MB of RAM
$(call inherit-product, frameworks/native/build/phone-xhdpi-1024-dalvik-heap.mk)

# TODO: Inherit the proprietary vendors blobs for Samsung U8500 devices
# $(call inherit-product-if-exists, vendor/samsung/u8500-common/u8500-common-vendor.mk)

# Ramdisk
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/init.samsung-u8500.usb.rc:root/init.samsung-u8500.usb.rc \
    $(LOCAL_PATH)/rootdir/lpm.rc:root/lpm.rc

# Graphics
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/lib/egl/egl.cfg:system/lib/egl/egl.cfg
PRODUCT_PACKAGES += \
    libblt_hw
PRODUCT_PROPERTY_OVERRIDES += \
    ro.opengles.version=131072 \
    debug.hwui.render_dirty_regions=false \
    persist.sys.use_dithering=2 \
    persist.sys.strictmode.disable=1

# Screen
PRODUCT_PROPERTY_OVERRIDES += \
    ro.sf.lcd_density=240 \
    ro.sf.display_rotation=0 \
    ro.lcd_brightness=170 \
    ro.lcd_min_brightness=30

# Media
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/etc/media_profiles.xml:system/etc/media_profiles.xml \
    $(LOCAL_PATH)/configs/etc/media_codecs.xml:system/etc/media_codecs.xml \
    $(LOCAL_PATH)/configs/omxloaders:system/omxloaders
PRODUCT_PACKAGES += \
    libomxil-bellagio
PRODUCT_PROPERTY_OVERRIDES += \
    ste.nmf.autoidle=1 \
    ste.video.dec.mpeg4.in.size=8192 \
    ste.video.enc.out.buffercnt=5 \
    ste.video.dec.recycle.delay=1 \
    ste.omx.ctx=0

# Camera
PRODUCT_PROPERTY_OVERRIDES += \
    ste.cam.front.orientation=270 \
    ste.cam.back.orientation=90

# Wifi
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/etc/wifi/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf
PRODUCT_PACKAGES += \
    libnetcmdiface
PRODUCT_PROPERTY_OVERRIDES += \
    wifi.interface=wlan0 \
    wifi.supplicant_scan_interval=15

# RIL
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/etc/ste_modem.sh:system/etc/ste_modem.sh
PRODUCT_PROPERTY_OVERRIDES += \
    ro.telephony.ril_class=SamsungU8500RIL \
    ro.telephony.sends_barcount=1 \
    ro.ril.hsxpa=1 \
    ro.ril.gprsclass=10 \
    ro.telephony.call_ring.multiple=false

# GPS
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/etc/sirfgps.conf:system/etc/sirfgps.conf \
    $(LOCAL_PATH)/configs/etc/gps.conf:system/etc/gps.conf

# Audio
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/etc/audio_policy.conf:system/etc/audio_policy.conf \
    $(LOCAL_PATH)/configs/etc/asound.conf:system/etc/asound.conf
PRODUCT_PACKAGES += \
    libasound \
    audio.a2dp.default \
    audio.usb.default
PRODUCT_PROPERTY_OVERRIDES += \
    ro.config.vc_call_vol_steps=9

# USB
PRODUCT_PROPERTY_OVERRIDES += \
    persist.sys.usb.config=mtp,adb \
    persist.service.adb.enable=1 \
    ste.special_fast_dormancy=false

# Sensors
PRODUCT_PACKAGES += \
    lights.montblanc

# Charger
PRODUCT_PACKAGES += \
    charger \
    charger_res_images

# Filesystem management tools
PRODUCT_PACKAGES += \
    setup_fs

# Misc packages
PRODUCT_PACKAGES += \
    Torch \
    com.android.future.usb.accessory

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.bluetooth.xml:system/etc/permissions/android.hardware.bluetooth.xml \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:system/etc/permissions/android.software.live_wallpaper.xml

# Non-device-specific props
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.locationfeatures=1 \
    ro.setupwizard.mode=OPTIONAL \
    ro.setupwizard.enable_bypass=1 \
    ro.config.sync=yes

# Define kind of DPI
PRODUCT_AAPT_CONFIG := normal hdpi
PRODUCT_AAPT_PREF_CONFIG := hdpi
 
# We have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise
