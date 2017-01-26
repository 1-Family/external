LOCAL_PATH := $(my-dir)

include $(CLEAR_VARS)

LOCAL_C_INCLUDES := \
	$(KERNEL_HEADERS) \
        external/libkeyutils \
	external/openssl/include

LOCAL_SHARED_LIBRARIES := \
	libdl \
	libcutils \
	libcrypto \
	libkeyutils

LOCAL_SRC_FILES := \
	libecryptfs/main.c \
	libecryptfs/key_management.c \
	libecryptfs/messaging.c \
	libecryptfs/packets.c \
	libecryptfs/miscdev.c \
	libecryptfs/module_mgr.c \
	libecryptfs/key_mod.c \
	libecryptfs/sysfs.c \
	libecryptfs/decision_graph.c \
	libecryptfs/cmd_ln_parser.c \
	libecryptfs/cipher_list.c \
	libecryptfs/ecryptfs-stat.c \
	key_mod/ecryptfs_key_mod_passphrase.c

LOCAL_MODULE := libecryptfs
LOCAL_MODULE_TAGS := optional

include $(BUILD_SHARED_LIBRARY)


#include $(CLEAR_VARS)
#
#LOCAL_C_INCLUDES := \
#        $(KERNEL_HEADERS) \
#        external/ecryptfs-utils/include
#
#LOCAL_SHARED_LIBRARIES := \
#	libecryptfs \
#	libcutils
#
#LOCAL_SRC_FILES := \
#	key_mod/ecryptfs_key_mod_passphrase.c
#
#LOCAL_MODULE := ecryptfs/libecryptfs_key_mod_passphrase
#LOCAL_MODULE_TAGS := optional
#
#include $(BUILD_SHARED_LIBRARY)

include $(CLEAR_VARS)

LOCAL_C_INCLUDES := \
        $(KERNEL_HEADERS) \
        external/ecryptfs-utils/include \
	external/openssl/include

LOCAL_SHARED_LIBRARIES := \
        libecryptfs \
        libcutils \
	libcrypto

LOCAL_SRC_FILES := \
        key_mod/ecryptfs_key_mod_openssl.c

LOCAL_MODULE := libecryptfs_key_mod_openssl
LOCAL_MODULE_PATH := $(TARGET_OUT_SHARED_LIBRARIES)/ecryptfs
LOCAL_MODULE_TAGS := optional

include $(BUILD_SHARED_LIBRARY)

include $(CLEAR_VARS)
common_c_includes := \
        $(KERNEL_HEADERS) \
        system/extras/ext4_utils \
        external/openssl/include \
        external/libkeyutils \
        external/ecryptfs-utils/include

common_shared_libraries := \
        libcutils \
        libecryptfs
LOCAL_CFLAGS :=
#LOCAL_CFLAGS := -Wall -Wextra -Werror
LOCAL_SRC_FILES := daemon/main.c
LOCAL_C_INCLUDES := $(common_c_includes)
LOCAL_SHARED_LIBRARIES := $(common_shared_libraries)
LOCAL_MODULE := ecryptfsd

#LOCAL_MODULE_TAGS := debug
LOCAL_ADDITIONAL_DEPENDENCIES := $(LOCAL_PATH)/Android.mk
include $(BUILD_EXECUTABLE)

#include $(CLEAR_VARS)
#common_c_includes := \
#        $(KERNEL_HEADERS) \
#        external/libkeyutils \
#        external/ecryptfs-utils/include
#
#common_shared_libraries := \
#        libecryptfs
##LOCAL_CFLAGS :=
#LOCAL_CFLAGS := -Wall -Wextra -Werror
#LOCAL_SRC_FILES := utils/ecryptfs_add_passphrase.c
#LOCAL_C_INCLUDES := $(common_c_includes)
#LOCAL_SHARED_LIBRARIES := $(common_shared_libraries)
#LOCAL_MODULE := ecryptfs-add-passphrase
#
#LOCAL_MODULE_TAGS := debug
#LOCAL_ADDITIONAL_DEPENDENCIES := $(LOCAL_PATH)/Android.mk
#include $(BUILD_EXECUTABLE)

#include $(CLEAR_VARS)
#common_c_includes := \
#        $(KERNEL_HEADERS) \
#        external/libkeyutils \
#        external/ecryptfs-utils/include
#
#common_shared_libraries := \
#        libcutils \
#        libecryptfs
##LOCAL_CFLAGS :=
#LOCAL_CFLAGS := -Wall -Wextra -Werror
#LOCAL_SRC_FILES := \
#	utils/manager.c \
#	utils/io.c \
#	utils/io.h \
#	utils/gen_key.c
#
#		
#LOCAL_C_INCLUDES := $(common_c_includes)
#LOCAL_SHARED_LIBRARIES := $(common_shared_libraries)
#LOCAL_MODULE := ecryptfs-manager
#
#LOCAL_MODULE_TAGS := debug
#LOCAL_ADDITIONAL_DEPENDENCIES := $(LOCAL_PATH)/Android.mk
#include $(BUILD_EXECUTABLE)

include $(CLEAR_VARS)
common_c_includes := \
        $(KERNEL_HEADERS) \
        external/libkeyutils \
        external/ecryptfs-utils/include

common_shared_libraries := \
        libcutils \
        libecryptfs
#LOCAL_CFLAGS :=
LOCAL_CFLAGS := -Wall -Wextra -Werror
LOCAL_SRC_FILES := \
        utils/openssl_keyring.c

LOCAL_C_INCLUDES := $(common_c_includes)
LOCAL_SHARED_LIBRARIES := $(common_shared_libraries)
LOCAL_MODULE := key-util

#LOCAL_MODULE_TAGS := debug
LOCAL_ADDITIONAL_DEPENDENCIES := $(LOCAL_PATH)/Android.mk
include $(BUILD_EXECUTABLE)

include $(CLEAR_VARS)
common_c_includes := \
        $(KERNEL_HEADERS) \
        external/libkeyutils \
        external/ecryptfs-utils/include

common_shared_libraries := \
        libcutils \
        libecryptfs
LOCAL_CFLAGS := -Wall -Wextra
#LOCAL_CFLAGS := -Wall -Wextra -Werror
LOCAL_SRC_FILES := \
        utils/mount.ecryptfs.c \
        utils/io.c \
        utils/io.h \
        utils/gen_key.c \
	utils/plaintext_decision_graph.c


LOCAL_C_INCLUDES := $(common_c_includes)
LOCAL_SHARED_LIBRARIES := $(common_shared_libraries)
LOCAL_MODULE := mount.ecryptfs

#LOCAL_MODULE_TAGS := debug
LOCAL_ADDITIONAL_DEPENDENCIES := $(LOCAL_PATH)/Android.mk
include $(BUILD_EXECUTABLE)

#include $(CLEAR_VARS)
#common_c_includes := \
#        $(KERNEL_HEADERS) \
#        external/libkeyutils \
#        external/ecryptfs-utils/include
#
#common_shared_libraries := \
#        libcutils \
#        libecryptfs
##LOCAL_CFLAGS :=
#LOCAL_CFLAGS := -Wall -Wextra -Werror
#LOCAL_SRC_FILES := \
#        utils/ecryptfs-stat.c
#
#LOCAL_C_INCLUDES := $(common_c_includes)
#LOCAL_SHARED_LIBRARIES := $(common_shared_libraries)
#LOCAL_MODULE := ecryptfs-stat
#
#LOCAL_MODULE_TAGS := debug
#LOCAL_ADDITIONAL_DEPENDENCIES := $(LOCAL_PATH)/Android.mk
#include $(BUILD_EXECUTABLE)

