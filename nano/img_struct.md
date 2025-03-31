# img struct

```
fdisk -l sd-blob-b01.img                           
Disk sd-blob-b01.img: 12.89 GiB, 13816037376 bytes, 26984448 sectors
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
Disklabel type: gpt
Disk identifier: 91FC289A-1E03-495A-9DAD-732401089949

Device            Start      End  Sectors  Size Type
sd-blob-b01.img1  28672 26980351 26951680 12.9G Linux filesystem
sd-blob-b01.img2   2048     2303      256  128K Linux filesystem
sd-blob-b01.img3   4096     4991      896  448K Linux filesystem
sd-blob-b01.img4   6144     7295     1152  576K Linux filesystem
sd-blob-b01.img5   8192     8319      128   64K Linux filesystem
sd-blob-b01.img6  10240    10623      384  192K Linux filesystem
sd-blob-b01.img7  12288    13055      768  384K Linux filesystem
sd-blob-b01.img8  14336    14463      128   64K Linux filesystem
sd-blob-b01.img9  16384    17279      896  448K Linux filesystem
sd-blob-b01.img10 18432    19327      896  448K Linux filesystem
sd-blob-b01.img11 20480    22015     1536  768K Linux filesystem
sd-blob-b01.img12 22528    22655      128   64K Linux filesystem
sd-blob-b01.img13 24576    24959      384  192K Linux filesystem
sd-blob-b01.img14 26624    26879      256  128K Linux filesystem

```

img1:	512*28672
	sudo mount -o loop,offset=14680064 sd-blob-b01.img /mnt




