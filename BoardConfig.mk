# Copyright (C) 2013 The Android Open Source Project
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
# This file sets variables that control the way modules are built
# thorughout the system. It should not be used to conditionally
# disable makefiles (the proper mechanism to control what gets
# included in a build is to use PRODUCT_PACKAGES in a product
# definition file).
#

# WARNING: This line must come *before* including the proprietary
# variant, so that it gets overwritten by the parent (which goes
# against the traditional rules of inheritance).

# inherit from common msm8960
-include device/htc/msm8974-common/BoardConfigCommon.mk

BOARD_VENDOR := htc

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := m8vzw

# Kernel
BOARD_KERNEL_CMDLINE := console=ttyHSL0,115200,n8 androidboot.hardware=qcom user_debug=31 ehci-hcd.park=3
BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_MKBOOTIMG_ARGS := --kernel_offset 0x00008000 --ramdisk_offset 0x02008000 --tags_offset 0x01e00000
TARGET_KERNEL_CONFIG := cm_m8wl_defconfig
TARGET_KERNEL_SOURCE := kernel/htc/msm8974
BOARD_KERNEL_SEPARATED_DT := true

BOARD_BOOTIMAGE_PARTITION_SIZE := 0x105c0000
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 0x105c0000
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 0x105c0000
BOARD_USERDATAIMAGE_PARTITION_SIZE := 0x105c0000
BOARD_FLASH_BLOCK_SIZE := 131072
BOARD_HAS_NO_SELECT_BUTTON := true

# Wifi
BOARD_HAS_QCOM_WLAN := true
BOARD_WLAN_DEVICE := qcwcn
WPA_SUPPLICANT_VERSION := VER_0_8_X
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
WIFI_DRIVER_MODULE_PATH := "/system/lib/modules/wlan.ko"
WIFI_DRIVER_MODULE_NAME := "wlan"
WIFI_DRIVER_FW_PATH_STA := "sta"
WIFI_DRIVER_FW_PATH_AP := "ap"

# Filesystem
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 2818572288
BOARD_USERDATAIMAGE_PARTITION_SIZE := 11676942336 
TARGET_USERIMAGES_USE_EXT4 := true

# cat /proc/emmc                                              
# dev:        size     erasesize name
# mmcblk0p1: 00100000  00000200  "sbl1"
# mmcblk0p2: 076f7c00  00000200  "pg1fs"
# mmcblk0p3: 00004000  00000200  "board_info"
# mmcblk0p4: 00800000  00000200  "reserve_1"
# mmcblk0p5: 00040000  00000200  "mfg"
# mmcblk0p6: 017afc00  00000200  "pg2fs"
# mmcblk0p7: 00040000  00000200  "sbl1_update"
# mmcblk0p8: 00040000  00000200  "rpm"
# mmcblk0p9: 00200000  00000200  "tz"
# mmcblk0p10: 00008000  00000200  "sdi"
# mmcblk0p11: 00400000  00000200  "hboot"
# mmcblk0p12: 00500000  00000200  "sp1"
# mmcblk0p13: 00100000  00000200  "wifi"
# mmcblk0p14: 00008000  00000200  "ddr"
# mmcblk0p15: 00100000  00000200  "dsps"
# mmcblk0p16: 03c00400  00000200  "adsp"
# mmcblk0p17: 00500000  00000200  "wcnss"
# mmcblk0p18: 00800000  00000200  "radio_config"
# mmcblk0p19: 00180000  00000200  "fsg"
# mmcblk0p20: 04b00400  00000200  "radio"
# mmcblk0p21: 00400000  00000200  "tool_diag"
# mmcblk0p22: 03200000  00000200  "custdata"
# mmcblk0p23: 00effc00  00000200  "reserve_2"
# mmcblk0p24: 00100000  00000200  "misc"
# mmcblk0p25: 00180000  00000200  "modem_st1"
# mmcblk0p26: 00180000  00000200  "modem_st2"
# mmcblk0p27: 01400000  00000200  "fataldevlog"
# mmcblk0p28: 00001000  00000200  "debug_config"
# mmcblk0p29: 00040000  00000200  "pdata"
# mmcblk0p30: 00004000  00000200  "control"
# mmcblk0p31: 00140400  00000200  "local"
# mmcblk0p32: 00010000  00000200  "extra"
# mmcblk0p33: 00100000  00000200  "cdma_record"
# mmcblk0p34: 00000400  00000200  "fsc"
# mmcblk0p35: 00002000  00000200  "ssd"
# mmcblk0p36: 00040000  00000200  "skylink"
# mmcblk0p37: 01900000  00000200  "carrier"
# mmcblk0p38: 00040000  00000200  "sensor_hub"
# mmcblk0p39: 01e00000  00000200  "devlog"
# mmcblk0p40: 00002800  00000200  "cir_img"
# mmcblk0p41: 02de6000  00000200  "reserve"
# mmcblk0p42: 01000000  00000200  "boot"
# mmcblk0p43: 01800000  00000200  "recovery"
# mmcblk0p44: 05800000  00000200  "reserve_3"
# mmcblk0p45: a8000000  00000200  "system"
# mmcblk0p46: 18000000  00000200  "cache"
# mmcblk0p47: b8000000  00000200  "userdata"

# inherit from the proprietary version
-include vendor/htc/m8vzw/BoardConfigVendor.mk
