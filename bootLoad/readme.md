# boot load procedure

```
ROM → MB1 → MB2 → (CBoot or UEFI) → OS Bootloader → Linux Kernel
```

1. BootROM (immutable, silicon)
* Lives in the SoC
* Loads MB1 from QSPI / eMMC / NVMe
* Verifies NVIDIA signatures
* cannot modify this

2. MB1 (Microboot 1 – closed)
* Initializes DRAM
* Loads firmware blobs
* Enforces secure boot
* Board-specific configuration (BCT, fuses)
* Still not Linux-aware

3. MB2 (Microboot 2 – semi-closed)
* Storage, PCIe, basic IO bring-up
* Loads the next boot stage:
    * CBoot (older Jetsons)
    * UEFI (Orin, JetPack 5+)


4. UEFI 
* EDK2-based UEFI implementation
* Replaces CBoot entirely
* Industry-standard firmware ; Used on Orin NX / Orin Nano / Orin AGX

### uefi on jetson
* Sees EFI System Partition (FAT32)
* Boot logic
* Reads NVRAM boot entries
* ProvidesL
    * UEFI Shell 
    * Networking (TFTP / HTTP)
    * PCI enumeration
    * Device tree handoff
