# recovary eth

* recovery setup using TFTP and NFS booting from U-Boot on your Jetson Nano production module
* assuming to have serial/U-Boot access


###  On the Host PC: Setup TFTP + NFS

Install required services:

```
sudo apt update
sudo apt install tftpd-hpa nfs-kernel-server
```

* Directory layout suggestion:

	mkdir -p ~/jetson_nano_netboot/{tftpboot,nfsroot}

* Ubuntu rootfs (if you want full access):

```
cd ~/jetson_nano_netboot/nfsroot
sudo debootstrap --arch=arm64 focal ./ http://ports.ubuntu.com/
```

* kernel Image and tegra210*.dtb from NVIDIA BSP and place them in ~/jetson_nano_netboot/tftpboot/boot/

* TFTP config

```
/etc/default/tftpd-hpa
=======================

TFTP_DIRECTORY="/home/YOU/jetson_nano_netboot/tftpboot"
TFTP_OPTIONS="--secure"
```

Then restart:
	udo systemctl restart tftpd-hpa

* NFS export

```
/etc/exports
=============
/home/YOU/jetson_nano_netboot/nfsroot *(rw,sync,no_subtree_check,no_root_squash)
```

```
sudo exportfs -a
sudo systemctl restart nfs-kernel-server
```

### boot

* In U-Boot serial console:

```
setenv serverip 192.168.1.100        # Host PC IP
setenv ipaddr 192.168.1.10           # Jetson IP
setenv kernel_addr_r 0x80080000
setenv fdt_addr_r 0x82000000
setenv bootargs "console=ttyS0,115200n8 root=/dev/nfs nfsroot=192.168.1.100:/home/YOU/jetson_nano_netboot/nfsroot,v3,tcp rw ip=192.168.1.10:::::eth0:off"

tftpboot ${kernel_addr_r} boot/Image
tftpboot ${fdt_addr_r} boot/tegra210-p3448-0002-p3449-0000-b00.dtb

booti ${kernel_addr_r} - ${fdt_addr_r}

```
