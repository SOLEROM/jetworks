# default partitions

```

Disk /dev/nvme0n1: 931.51 GiB, 1000204886016 bytes, 1953525168 sectors
Disk model: WD_BLACK SN850X 1000GB                  
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
Disklabel type: gpt
Disk identifier: 5E1D717C-37B2-4978-9B7F-015BA5E32453

Device            Start        End    Sectors   Size Type
/dev/nvme0n1p1  3050048 1953525127 1950475080 930.1G Microsoft basic data
/dev/nvme0n1p2       40     262183     262144   128M Microsoft basic data
/dev/nvme0n1p3   262184     263719       1536   768K Microsoft basic data
/dev/nvme0n1p4   263720     328487      64768  31.6M Microsoft basic data
/dev/nvme0n1p5   328488     590631     262144   128M Microsoft basic data
/dev/nvme0n1p6   590632     592167       1536   768K Microsoft basic data
/dev/nvme0n1p7   592168     656935      64768  31.6M Microsoft basic data
/dev/nvme0n1p8   656936     820775     163840    80M Microsoft basic data
/dev/nvme0n1p9   820776     821799       1024   512K Microsoft basic data
/dev/nvme0n1p10  821800     952871     131072    64M EFI System
/dev/nvme0n1p11  952872    1116711     163840    80M Microsoft basic data
/dev/nvme0n1p12 1116712    1117735       1024   512K Microsoft basic data
/dev/nvme0n1p13 1117736    1248807     131072    64M Microsoft basic data
/dev/nvme0n1p14 1248832    2068031     819200   400M Microsoft basic data
/dev/nvme0n1p15 2068032    3050047     982016 479.5M Microsoft basic data

```

## rootfs

```
/dev/nvme0n1p1  958803476 6866952 903158264   1% /


ls /

bin   data  etc   _Im_AM_orionNX  lost+found  mnt  proc        root  sbin  srv  tmp  var
boot  dev   home  lib             media       opt  README.txt  run   snap  sys  usr



```

## p10

```
/dev/nvme0n1p10     64511     110     64402   1% /boot/efi

/boot/efi/EFI/BOOT/BOOTAA64.efi

```



## boot

```
/boot/
dtb
efi
extlinux
Image
initrd
initrd.img
initrd.img-5.15.148-tegra
kernel_tegra234-p3768-0000+p3767-0000-nv.dtb
oot-stub
tegra234-carveouts.dtbo
tegra234-p3737-0000+p3701-0000-as-p3701-0004.dtbo
tegra234-p3737-0000+p3701-0000-as-p3767-0000.dtbo
tegra234-p3737-0000+p3701-0000-as-p3767-0001.dtbo
tegra234-p3737-0000+p3701-0000-as-p3767-0003.dtbo
tegra234-p3737-0000+p3701-0000-as-p3767-0004.dtbo
tegra234-p3737-0000+p3701-0000-audio-adafruit-sph0645lm4h.dtbo
tegra234-p3737-0000+p3701-0000-audio-adafruit-uda1334a.dtbo
tegra234-p3737-0000+p3701-0000-audio-fe-pi.dtbo
tegra234-p3737-0000+p3701-0000-audio-respeaker-4-mic-array.dtbo
tegra234-p3737-0000+p3701-0000-audio-respeaker-4-mic-lin-array.dtbo
tegra234-p3737-0000+p3701-0000-csi.dtbo
tegra234-p3737-0000+p3701-0000.dtb
tegra234-p3737-0000+p3701-0000-dynamic.dtbo
tegra234-p3737-0000+p3701-0000-hdr40.dtbo
tegra234-p3737-0000+p3701-0000-m2ke.dtbo
tegra234-p3737-0000+p3701-0000-nv.dtb
tegra234-p3737-0000+p3701-0004.dtb
tegra234-p3737-0000+p3701-0004-nv.dtb
tegra234-p3737-0000+p3701-0005.dtb
tegra234-p3737-0000+p3701-0005-nv.dtb
tegra234-p3737-0000+p3701-0008.dtb
tegra234-p3737-0000+p3701-0008-nv.dtb
tegra234-p3737-camera-dual-hawk-ar0234-e3653-overlay.dtbo
tegra234-p3737-camera-dual-imx274-overlay.dtbo
tegra234-p3737-camera-e3331-overlay.dtbo
tegra234-p3737-camera-e3333-overlay.dtbo
tegra234-p3737-camera-eCAM130A-overlay.dtbo
tegra234-p3737-camera-imx185-overlay.dtbo
tegra234-p3737-camera-imx390-addr-0x21-overlay.dtbo
tegra234-p3737-camera-imx390-overlay.dtbo
tegra234-p3737-camera-p3762-a00-1Hawk-overlay.dtbo
tegra234-p3737-camera-p3762-a00-2Hawk-overlay.dtbo
tegra234-p3737-camera-p3762-a00-3Hawk-3Owl-overlay.dtbo
tegra234-p3737-camera-p3762-a00-4Hawk-overlay.dtbo
tegra234-p3737-camera-p3762-a00-4Owl-overlay.dtbo
tegra234-p3737-camera-p3762-a00-overlay.dtbo
tegra234-p3740-0002+p3701-0008.dtb
tegra234-p3740-0002+p3701-0008-hdr20.dtbo
tegra234-p3740-0002+p3701-0008-m2kb.dtbo
tegra234-p3740-0002+p3701-0008-m2ke.dtbo
tegra234-p3740-0002+p3701-0008-nv.dtb
tegra234-p3740-camera-p3783-a00-overlay.dtbo
tegra234-p3767-0000+p3509-a02-audio-adafruit-sph0645lm4h.dtbo
tegra234-p3767-0000+p3509-a02-audio-adafruit-uda1334a.dtbo
tegra234-p3767-0000+p3509-a02-audio-fe-pi.dtbo
tegra234-p3767-0000+p3509-a02-audio-respeaker-4-mic-array.dtbo
tegra234-p3767-0000+p3509-a02-audio-respeaker-4-mic-lin-array.dtbo
tegra234-p3767-0000+p3509-a02-csi.dtbo
tegra234-p3767-0000+p3509-a02-hdr40.dtbo
tegra234-p3767-0000+p3509-a02-m2ke.dtbo
tegra234-p3767-0000+p3768-0000-csi.dtbo
tegra234-p3767-camera-p3768-imx219-A.dtbo
tegra234-p3767-camera-p3768-imx219-C.dtbo
tegra234-p3767-camera-p3768-imx219-dual.dtbo
tegra234-p3767-camera-p3768-imx219-imx477.dtbo
tegra234-p3767-camera-p3768-imx477-A.dtbo
tegra234-p3767-camera-p3768-imx477-C.dtbo
tegra234-p3767-camera-p3768-imx477-dual-4lane.dtbo
tegra234-p3767-camera-p3768-imx477-dual.dtbo
tegra234-p3767-camera-p3768-imx477-imx219.dtbo
tegra234-p3768-0000+p3767-0000.dtb
tegra234-p3768-0000+p3767-0000-dynamic.dtbo
tegra234-p3768-0000+p3767-0000-nv.dtb
tegra234-p3768-0000+p3767-0000-nv-super.dtb
tegra234-p3768-0000+p3767-0001.dtb
tegra234-p3768-0000+p3767-0001-nv.dtb
tegra234-p3768-0000+p3767-0001-nv-super.dtb
tegra234-p3768-0000+p3767-0003.dtb
tegra234-p3768-0000+p3767-0003-nv.dtb
tegra234-p3768-0000+p3767-0003-nv-super.dtb
tegra234-p3768-0000+p3767-0004.dtb
tegra234-p3768-0000+p3767-0004-nv.dtb
tegra234-p3768-0000+p3767-0004-nv-super.dtb
tegra234-p3768-0000+p3767-0005.dtb
tegra234-p3768-0000+p3767-0005-nv.dtb
tegra234-p3768-0000+p3767-0005-nv-super.dtb
tegra-optee.dtbo
```