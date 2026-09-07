#
# Copyright (C) 2023 The Android Open Source Project
#
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/xiaomi/chenfeng

# Inherit from device.mk configuration
$(call inherit-product, $(DEVICE_PATH)/device.mk)

# Release name
PRODUCT_RELEASE_NAME := chenfeng

## Device identifier
PRODUCT_DEVICE := chenfeng
PRODUCT_NAME := twrp_chenfeng
PRODUCT_BRAND := Xiaomi
PRODUCT_MODEL := Civi 4 Pro
PRODUCT_MANUFACTURER := Xiaomi

# Assert
TARGET_OTA_ASSERT_DEVICE := chenfeng

# Theme
TW_STATUS_ICONS_ALIGN := center
#TW_Y_OFFSET := 99
#TW_H_OFFSET := -99

# Strongbox Device Decryption
TW_INCLUDE_OMAPI := true
