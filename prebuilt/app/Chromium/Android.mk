LOCAL_PATH:= $(call my-dir)

ifneq ($(DISABLE_CWB),true)

include $(CLEAR_VARS)
LOCAL_MODULE       := Chromium
LOCAL_MODULE_TAGS  := optional
LOCAL_MODULE_CLASS := APPS
LOCAL_SRC_FILES    := 32bit/MonochromePublic.apk
LOCAL_CERTIFICATE  := PRESIGNED
LOCAL_MODULE_PATH  := $(TARGET_OUT_APPS)
include $(BUILD_PREBUILT)

endif
