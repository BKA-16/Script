#!/bin/bash

rm -rf device/xiaomi/mojito
rm -rf device/xiaomi/sm6150-common
rm -rf kernel/xiaomi/mojito
rm -rf hardware/xiaomi
rm -rf vendor/xiaomi/mojito
rm -rf vendor/xiaomi/sm6150-common

# ROM Manifest
repo init -u https://github.com/Evolution-X/manifest -b bka --git-lfs

# Sync
/opt/crave/resync.sh

rm -rf device/xiaomi/mojito
rm -rf device/xiaomi/sm6150-common
rm -rf kernel/xiaomi/mojito
rm -rf hardware/xiaomi
rm -rf vendor/xiaomi/mojito
rm -rf vendor/xiaomi/sm6150-common

# Device
git clone https://github.com/BKA-16/device_xiaomi_mojito.git -b 16 device/xiaomi/mojito
git clone https://github.com/BKA-16/device_xiaomi_sm6150-common.git -b 16 device/xiaomi/sm6150-common

# Kernel
git clone https://github.com/BKA-16/kernel_xiaomi_mojito.git -b inline-rom kernel/xiaomi/mojito

# Hardware
git clone https://github.com/BKA-16/android_hardware_xiaomi.git -b 16 hardware/xiaomi

# Vendor
git clone https://github.com/BKA-16/vendor_xiaomi_mojito.git -b 16 vendor/xiaomi/mojito
git clone https://github.com/BKA-16/vendor_xiaomi_sm6150-common.git -b 16 vendor/xiaomi/sm6150-common

# Export
export BUILD_USERNAME=Sachin
export BUILD_HOSTNAME=crave

# Build Environment
. build/envsetup.sh

# Lunch
lunch lineage_mojito-bp2a-userdebug

# Build Rom
m evolution
