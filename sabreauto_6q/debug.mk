# ADB
PRODUCT_PROPERTY_OVERRIDES += \
    persist.service.adb.enable=1 \
    persist.service.debuggable=1 \
    persist.sys.usb.config=mtp,adb

PRODUCT_PROPERTY_OVERRIDES += \
    ro.secure=0 \
    ro.adb.insecure=1 \
    ro.debuggable=1 \
    ro.adb.debuggable=1

    # Insecure boot
ADDITIONAL_DEFAULT_PROPERTIES += ro.secure=0
ADDITIONAL_DEFAULT_PROPERTIES += ro.adb.insecure=1
ADDITIONAL_DEFAULT_PROPERTIES += ro.debuggable=1
ADDITIONAL_DEFAULT_PROPERTIES += ro.adb.debuggable=1
ADDITIONAL_DEFAULT_PROPERTIES += ro.allow.mock.location=1