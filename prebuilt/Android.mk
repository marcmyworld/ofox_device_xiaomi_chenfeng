#
# Copyright (C) 2024 The Android Open Source Project
#
# SPDX-License-Identifier: Apache-2.0
#

LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
    LOCAL_MODULE := prebuilt
    LOCAL_MODULE_TAGS := optional
    LOCAL_MODULE_CLASS := ETC
    LOCAL_MODULE_PATH := $(TARGET_RECOVERY_ROOT_OUT)
    LOCAL_POST_INSTALL_CMD += \
        mkdir -p $(TARGET_RECOVERY_ROOT_OUT)/vendor; \
        cp -rf $(LOCAL_PATH)/$(PRODUCT_RELEASE_NAME)/vendor $(TARGET_RECOVERY_ROOT_OUT)/; \
        mkdir -p $(TARGET_RECOVERY_ROOT_OUT)/lib/firmware; \
        cp -rf $(LOCAL_PATH)/$(PRODUCT_RELEASE_NAME)/vendor/odm/firmware/ $(TARGET_RECOVERY_ROOT_OUT)/lib/;
include $(BUILD_PHONY_PACKAGE)
