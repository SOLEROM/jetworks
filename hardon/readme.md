
# Hadron Carrier for NVIDIA Jetson Orin NX

* https://connecttech.com/product/hadron-carrier-for-nvidia-jetson-orin-nx/

for :   
    JetPack 6.2.1 – L4T r36.4.4	Orin NX / Nano L4T r36.4.4 BSP

get : CTI-L4T-ORIN-NX-NANO-36.4.4-V004.tgz



## unpacke CTI-L4T-ORIN-NX-NANO-36.4.4-V004.tgz

```
unpack/
└── CTI-L4T
    ├── bl
    │   ├── generic
    │   ├── l4t_initrd.img
    │   └── uefi_jetson.bin
    ├── conf
    │   ├── cti
    │   └── cti-orin-nx.conf.common
    ├── cti-flash.sh
    ├── cti-nvme-flash.sh
    ├── extra
    │   ├── cti-l4t-utils_5.15.148-tegra-36.4.4-CTI-ORIN-NX-NANO-V004-20251125_arm64.deb
    │   ├── nvidia-l4t-apt-source_36.4.4-CTI-ORIN-NX-NANO-V001-20250723_arm64.deb
    │   ├── nvidia-l4t-camera_36.4.4-CTI-ORIN-NX-NANO-V001-20250723_arm64.deb
    │   ├── nvidia-l4t-configs_36.4.4-CTI-ORIN-V001-20250723_arm64.deb
    │   ├── nvidia-l4t-gstreamer_36.4.4-20250616085344_arm64.deb
    │   ├── nvidia-l4t-initrd_36.4.4-CTI-ORIN-V001-20250723_arm64.deb
    │   ├── nvidia-l4t-oem-config_36.4.4-CTI-ORIN-NX-NANO-V001-20250723_arm64.deb
    │   └── nvidia-l4t-optee_36.4.4-CTI-ORIN-V001-20251125_arm64.deb
    ├── install.sh
    ├── kernel
    │   ├── dtb
    │   ├── Image
    │   ├── nvidia-l4t-display-kernel_5.15.148-tegra-36.4.4-CTI-ORIN-NX-NANO-V004-20251125_arm64.deb
    │   ├── nvidia-l4t-kernel_5.15.148-tegra-36.4.4-CTI-ORIN-NX-NANO-V004-20251125_arm64.deb
    │   ├── nvidia-l4t-kernel-dtbs_5.15.148-tegra-36.4.4-CTI-ORIN-NX-NANO-V004-20251125_arm64.deb
    │   ├── nvidia-l4t-kernel-headers_5.15.148-tegra-36.4.4-CTI-ORIN-NX-NANO-V004-20251125_arm64.deb
    │   ├── nvidia-l4t-kernel-oot-headers_5.15.148-tegra-36.4.4-CTI-ORIN-NX-NANO-V004-20251125_arm64.deb
    │   └── nvidia-l4t-kernel-oot-modules_5.15.148-tegra-36.4.4-CTI-ORIN-NX-NANO-V004-20251125_arm64.deb
    ├── patches
    │   ├── initrd_flash.patch
    │   ├── readme
    │   └── recovery_copy_binlist.patch
    └── readme.txt

```

## install

* see [unpacked readme trip to install part](./install_unpack_readme.md)
    * https://developer.nvidia.com/embedded/jetson-linux-r3644
    * https://developer.nvidia.com/embedded/jetson-linux-r362   !!!

## unpack

* !!! sudo important ; need the files of roofst to be owned by root !!!

(1) Jetson_Linux_R36.2.0_aarch64.tbz2 => Linux_for_Tegra


```
sudo tar xf Jetson_Linux_R36.4.4_aarch64.tbz2
```

```
apply_binaries.sh                            odmfuse.func
bootloader                                   odmfuseread.sh
build_l4t_bup.sh                             odmfuse.sh
flash.sh                                     p3509-a02-p3767-0000.conf
generate_capsule                             p3701.conf.common
igx-orin-devkit.conf                         p3737-0000-p3701-0000-as-p3701-0004.conf
jetson_additional_board_spec.cfg             p3737-0000-p3701-0000-as-p3767-0000.conf
jetson-agx-orin-devkit-as-jao-32gb.conf      p3737-0000-p3701-0000-as-p3767-0001.conf
jetson-agx-orin-devkit-as-nano4gb.conf       p3737-0000-p3701-0000-as-p3767-0003.conf
jetson-agx-orin-devkit-as-nano8gb.conf       p3737-0000-p3701-0000-as-p3767-0004.conf
jetson-agx-orin-devkit-as-nx-16gb.conf       p3737-0000-p3701-0000.conf
jetson-agx-orin-devkit-as-nx-8gb.conf        p3737-0000-p3701-0000.conf.common
jetson-agx-orin-devkit.conf                  p3737-0000-p3701-0000-maxn.conf
jetson-agx-orin-devkit-industrial.conf       p3737-0000-p3701-0000-qspi.conf
jetson-agx-orin-devkit-industrial-maxn.conf  p3737-0000-p3701-0008.conf
jetson-agx-orin-devkit-industrial-qspi.conf  p3737-0000-p3701-0008-maxn.conf
jetson-agx-orin-devkit-maxn.conf             p3737-0000-p3701-0008-qspi.conf
jetson_board_spec.cfg                        p3740-0002-p3701-0008.conf
jetson-orin-nano-devkit.conf                 p3740-0002-p3701-0008-qspi.conf
jetson-orin-nano-devkit-nvme.conf            p3767.conf.common
kernel                                       p3768-0000-p3767-0000-a0.conf
l4t_generate_soc_bup.sh                      p3768-0000-p3767-0000-a0-maxn.conf
l4t_sign_image.sh                            p3768-0000-p3767-0000-a0-nvme.conf
l4t_uefi_sign_image.sh                       p3768-0000-p3767-0000-a0-qspi.conf
nvautoflash.sh                               README_Autoflash.txt
nvmassfusegen.sh                             rootfs
nvsdkmanager_flash.sh                        source
nv_tegra                                     Tegra_Software_License_Agreement-Tegra-Linux.txt
nv_tools                                     tools

Linux_for_Tegra/rootfs/
README.txt



```

(2) Tegra_Linux_Sample-Root-Filesystem_R36.2.0_aarch64.tbz2

```
sudo tar -xf Tegra_Linux_Sample-Root-Filesystem_R36.2.0_aarch64.tbz2 -C Linux_for_Tegra/rootfs/
```



(3) sudo tar xf CTI-L4T-ORIN-NX-NANO-36.4.4-V004.tgz -C Linux_for_Tegra/

(4) install

```
~/proj/hardon/dw362/Linux_for_Tegra/CTI-L4T$ sudo ./install.sh 
[sudo] password for user: 
  Usage: ./install.sh 
  Before installing this BSP, please read the included readme.txt
  Below are the compatible L4T versions and board profiles:

Supported Version Information
  CTI-L4T Board Support Package Version: ORIN-NX-NANO-36.4.4-V004
  Supported CTI Products (profiles): 
     Photon
     Boson
     Boson-Orin
     Boson22-Orin
     Hadron
     Rudi-NX
     Polaris
     Hadron-GMSL
     Lepton
     Hadron-Dual-Mipi
     Essential-EdgeAI
     Uses
  Supported Linux for Tegra Release Versions: 
     36.4.4
  Supported Nvidia Jetson Module Hardware: 
     Orin-NX
     Orin-NANO

.....
 Preparing to unpack .../nvidia-l4t-vulkan-sc-sdk_36.4.4-20250616085344_arm64.deb ...
Unpacking nvidia-l4t-vulkan-sc-sdk (36.4.4-20250616085344) ...
Selecting previously unselected package nvidia-l4t-wayland.
Preparing to unpack .../nvidia-l4t-wayland_36.4.4-20250616085344_arm64.deb ...
Unpacking nvidia-l4t-wayland (36.4.4-20250616085344) ...
Selecting previously unselected package nvidia-l4t-weston.
Preparing to unpack .../nvidia-l4t-weston_36.4.4-20250616085344_arm64.deb ...
Unpacking nvidia-l4t-weston (36.4.4-20250616085344) ...
Selecting previously unselected package nvidia-l4t-x11.
Preparing to unpack .../nvidia-l4t-x11_36.4.4-20250616085344_arm64.deb ...
Unpacking nvidia-l4t-x11 (36.4.4-20250616085344) ...
Selecting previously unselected package nvidia-l4t-xusb-firmware.
Preparing to unpack .../nvidia-l4t-xusb-firmware_36.4.4-20250616085344_arm64.deb ...
Unpacking nvidia-l4t-xusb-firmware (36.4.4-20250616085344) ...
Replacing files in old package linux-firmware (20220329.
.....
.................



Cleaning up the temporary directory for updating the initrd..
/home/user/proj/hardon/dw3644/Linux_for_Tegra
Removing QEMU binary from rootfs
Removing stashed Debian packages from rootfs
L4T BSP package installation completed!
Disabling NetworkManager-wait-online.service
Disable the ondemand service by changing the runlevels to 'K'
Success!
/home/user/proj/hardon/dw3644/Linux_for_Tegra/CTI-L4T
CTI-L4T-ORIN-NX-NANO-36.4.4-V004 Installed!


```

(5) burn

```
//burn from root = Linux_for_Tegra$

sudo ./cti-flash.sh


```