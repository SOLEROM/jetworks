# recovery flash

* manual reflash of the eMMC on the Jetson Nano production module via recovery mode using the flash.sh script, without using the SDK Manager GUI.

## steps

* get nono bsp:   CTI-L4T-NANO-32.7.2-V002.tgz 
* get Sample Root Filesystem (https://developer.nvidia.com/embedded/linux-tegra-r3272 )


```
mkdir -p ~/jetson_nano_flash
cd ~/jetson_nano_flash

# Unpack the BSP
tar -xjf Jetson-210_Linux_R32.7.4_aarch64.tbz2
cd Linux_for_Tegra/

# Unpack the sample rootfs
cd rootfs
sudo tar -xjf ../../Tegra_Linux_Sample-Root-Filesystem_R32.7.4_aarch64.tbz2
cd ..

# Apply NVIDIA binaries
sudo ./apply_binaries.sh

```

## flash rules

```
#To flash everything (bootloader + rootfs):
sudo ./flash.sh jetson-nano-emmc mmcblk0p1

#To flash only rootfs (APP) partition:
sudo ./flash.sh -r jetson-nano-emmc mmcblk0p1

##To flash a modified kernel only:
sudo ./flash.sh -k kernel -d boot/Image jetson-nano-emmc mmcblk0p1


```