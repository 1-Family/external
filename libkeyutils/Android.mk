LOCAL_PATH := $(my-dir)

include $(CLEAR_VARS)
LOCAL_C_INCLUDES := $(KERNEL_HEADERS)
LOCAL_SRC_FILES := keyutils.c
LOCAL_MODULE := libkeyutils
LOCAL_SHARED_LIBRARIES := libcutils libc
LOCAL_MODULE_TAGS := optional
include $(BUILD_SHARED_LIBRARY)
