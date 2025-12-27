# sd card img

wget https://developer.download.nvidia.com/embedded/L4T/r36_Release_v2.0/jp60dp-orin-nano-sd-card-image.zip


14G	jp60dp-orin-nano-sd-card-image.zip

unzipd

28G	sd-blob.img


```
fdisk -l sd-blob.img 
Disk sd-blob.img: 27.22 GiB, 29228007424 bytes, 57085952 sectors
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
Disklabel type: gpt
Disk identifier: D286F765-5ECA-43C3-AF2E-11825261E3A8

Device          Start      End  Sectors   Size Type
sd-blob.img1  3057664 57065471 54007808  25.8G Linux filesystem
sd-blob.img2     2048   264191   262144   128M Linux filesystem
sd-blob.img3   264192   265727     1536   768K Linux filesystem
sd-blob.img4   266240   331007    64768  31.6M Linux filesystem
sd-blob.img5   331776   593919   262144   128M Linux filesystem
sd-blob.img6   593920   595455     1536   768K Linux filesystem
sd-blob.img7   595968   660735    64768  31.6M Linux filesystem
sd-blob.img8   661504   825343   163840    80M Linux filesystem
sd-blob.img9   825344   826367     1024   512K Linux filesystem
sd-blob.img10  827392   958463   131072    64M EFI System
sd-blob.img11  958464  1122303   163840    80M Linux filesystem
sd-blob.img12 1122304  1123327     1024   512K Linux filesystem
sd-blob.img13 1124352  1255423   131072    64M Linux filesystem
sd-blob.img14 1255424  2074623   819200   400M Linux filesystem
sd-blob.img15 2074624  3056639   982016 479.5M Linux filesystem

```