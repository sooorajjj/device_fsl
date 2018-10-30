# This is a FSL Android Reference Design platform based on i.MX6Q ARD board
# It will inherit from FSL core product which in turn inherit from Google generic

$(call inherit-product, device/fsl/imx6/imx6.mk)

ifneq ($(wildcard device/fsl/sabreauto_6dq/fstab_nand.freescale),)
$(shell touch device/fsl/sabreauto_6q/fstab_nand.freescale)
endif

ifneq ($(wildcard device/fsl/sabreauto_6dq/fstab.freescale),)
$(shell touch device/fsl/sabreauto_6q/fstab.freescale)
endif

# Overrides
PRODUCT_NAME := sabreauto_6q
PRODUCT_DEVICE := sabreauto_6q


PRODUCT_COPY_FILES += \
	device/fsl/sabreauto_6q/init.rc:root/init.freescale.rc \
	device/fsl/sabreauto_6q/init.i.MX6Q.rc:root/init.freescale.i.MX6Q.rc \
	device/fsl/sabreauto_6q/init.i.MX6DL.rc:root/init.freescale.i.MX6DL.rc \
	device/fsl/sabreauto_6q/init.i.MX6QP.rc:root/init.freescale.i.MX6QP.rc \
	device/fsl/common/bootanimation.zip:/system/media/bootanimation.zip \
	device/common/gps/gps.conf_AS:system/etc/gps.conf


# Audio
USE_XML_AUDIO_POLICY_CONF := 1
PRODUCT_COPY_FILES += \
	device/fsl/sabreauto_6q/audio_effects.conf:system/vendor/etc/audio_effects.conf \
	device/fsl/sabreauto_6q/audio_policy_configuration.xml:system/etc/audio_policy_configuration.xml \
	device/fsl/sabreauto_6q/audio_policy_configuration_cts.xml:system/etc/audio_policy_configuration_cts.xml \
	frameworks/av/services/audiopolicy/config/r_submix_audio_policy_configuration.xml:system/etc/r_submix_audio_policy_configuration.xml \
	frameworks/av/services/audiopolicy/config/usb_audio_policy_configuration.xml:system/etc/usb_audio_policy_configuration.xml \
	frameworks/av/services/audiopolicy/config/default_volume_tables.xml:system/etc/default_volume_tables.xml \
	frameworks/av/services/audiopolicy/config/audio_policy_volumes.xml:system/etc/audio_policy_volumes.xml \

PRODUCT_COPY_FILES +=	\
	external/linux-firmware-imx/firmware/vpu/vpu_fw_imx6d.bin:system/lib/firmware/vpu/vpu_fw_imx6d.bin 	\
	external/linux-firmware-imx/firmware/vpu/vpu_fw_imx6q.bin:system/lib/firmware/vpu/vpu_fw_imx6q.bin
# setup dm-verity configs.
ifneq ($(BUILD_TARGET_FS),ubifs)
PRODUCT_SYSTEM_VERITY_PARTITION := /dev/block/by-name/system
$(call inherit-product, build/target/product/verity.mk)
endif
# GPU files

DEVICE_PACKAGE_OVERLAYS := device/fsl/sabreauto_6q/overlay

PRODUCT_CHARACTERISTICS := tablet

PRODUCT_AAPT_CONFIG += xlarge large tvdpi hdpi xhdpi

PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/android.hardware.audio.output.xml:system/etc/permissions/android.hardware.audio.output.xml \
	frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
	frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
	frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
	frameworks/native/data/etc/android.hardware.touchscreen.xml:system/etc/permissions/android.hardware.touchscreen.xml \
	frameworks/native/data/etc/android.hardware.touchscreen.multitouch.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.xml \
	frameworks/native/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml \
	frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
	frameworks/native/data/etc/android.hardware.screen.portrait.xml:system/etc/permissions/android.hardware.screen.portrait.xml \
	frameworks/native/data/etc/android.hardware.screen.landscape.xml:system/etc/permissions/android.hardware.screen.landscape.xml \
	frameworks/native/data/etc/android.software.app_widgets.xml:system/etc/permissions/android.software.app_widgets.xml \
	frameworks/native/data/etc/android.software.voice_recognizers.xml:system/etc/permissions/android.software.voice_recognizers.xml \
	frameworks/native/data/etc/android.software.backup.xml:system/etc/permissions/android.software.backup.xml \
	frameworks/native/data/etc/android.software.print.xml:system/etc/permissions/android.software.print.xml \
	frameworks/native/data/etc/android.software.device_admin.xml:system/etc/permissions/android.software.device_admin.xml \
	frameworks/native/data/etc/android.software.managed_users.xml:system/etc/permissions/android.software.managed_users.xml \
	frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
	frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
	frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
	frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
	frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
	frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
	frameworks/native/data/etc/android.hardware.camera.xml:system/etc/permissions/android.hardware.camera.xml \
	frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
	frameworks/native/data/etc/android.hardware.ethernet.xml:system/etc/permissions/android.hardware.ethernet.xml \
	frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
	device/fsl/sabreauto_6q/required_hardware.xml:system/etc/permissions/required_hardware.xml \


PRODUCT_COPY_FILES += \
	device/fsl/sabreauto_6q/init.crda.sh:system/etc/init.crda.sh \
	device/fsl/sabreauto_6q/pins_post_boot.sh:system/etc/pins_post_boot.sh


	# wl12xx driver currently broken due to kernel 4.1 patch to
# support wl18xx R8.6_SP1
# revert that patch to use wl12xx
# please note that wl1271-nvs.bin is used also by wl18xx driver
# to reset the MAC
# wl12xx firmware
PRODUCT_COPY_FILES +=	\
	device/fsl/common/wl12xx/wl1271-nvs.bin:system/etc/firmware/ti-connectivity/wl1271-nvs.bin \
	device/fsl/common/wl12xx/wl127x-fw-5-mr.bin:system/etc/firmware/ti-connectivity/wl127x-fw-5-mr.bin \
	device/fsl/common/wl12xx/wl127x-fw-5-plt.bin:system/etc/firmware/ti-connectivity/wl127x-fw-5-plt.bin \
	device/fsl/common/wl12xx/wl127x-fw-5-sr.bin:system/etc/firmware/ti-connectivity/wl127x-fw-5-sr.bin \
	device/fsl/common/wl12xx/TIInit_7.6.15.bts:system/etc/firmware/ti-connectivity/TIInit_7.6.15.bts

# wl18xx firmware
PRODUCT_COPY_FILES +=	\
	device/fsl/common/wl18xx/wl18xx-conf.bin:system/etc/firmware/ti-connectivity/wl18xx-conf.bin \
	device/fsl/common/wl18xx/wl18xx-fw-4.bin:system/etc/firmware/ti-connectivity/wl18xx-fw-4.bin \
	device/fsl/common/wl18xx/TIInit_11.8.32.bts:system/etc/firmware/ti-connectivity/TIInit_11.8.32.bts

$(call inherit-product-if-exists, device/ti/proprietary-open/wl12xx/wlan/wl12xx-wlan-fw-products.mk)
$(call inherit-product-if-exists, device/ti/proprietary-open/wl12xx/wpan/wl12xx-wpan-fw-products.mk)

PRODUCT_PROPERTY_OVERRIDES += \
    wifi.interface=wlan0 \
    ro.disableWifiApFirmwareReload=true \
	ro.telephony.default_network=0

# wl18xx utils
PRODUCT_PACKAGES += \
	libwpa_client \
	wifical.sh \
	crda \
	regulatory.bin \
	wlconf \
	struct.bin \
	dictionary.txt \
	wl18xx-conf-default.bin \
	example.conf \
	example.ini \
	uim-sysfs \
	iw

# RIL
PRODUCT_PACKAGES += \
	chat \
	ip-up \
	ip-down

# Sensors
 PRODUCT_PACKAGES += \
    sensors.iio
    # stcald
    # activity_recognition.iio

PRODUCT_PROPERTY_OVERRIDES += \
    ro.hardware.sensors=iio \
    ro.iio.magn.quirks=no-trig
    # ro.iio.accel.panel=5 \
    # ro.iio.accel.rotation=4 \

ifneq ($(BUILD_TARGET_FS),ubifs)
PRODUCT_COPY_FILES += \
     device/fsl/sabreauto_6q/init.freescale.sd.rc:root/init.freescale.sd.rc
endif

PRODUCT_COPY_FILES += \
     device/fsl-proprietary/gpu-viv/lib/egl/egl.cfg:system/lib/egl/egl.cfg

PRODUCT_PACKAGES += \
     AudioRoute  \
     libEGL_VIVANTE \
     libGLESv1_CM_VIVANTE \
     libGLESv2_VIVANTE \
     gralloc_viv.imx6 \
     hwcomposer_viv.imx6 \
     hwcomposer_fsl.imx6 \
     libGAL \
     libGLSLC \
     libVSC \
     libg2d \
     libgpuhelper
