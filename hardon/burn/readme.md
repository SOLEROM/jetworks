# burn stack

burn process as a system  QSPI boot chain via flash_t234_qspi.xml + NVMe GPT/rootfs via flash_l4t_external.xml, all orchestrated by l4t_initrd_flash.sh, with CTI config overlays controlling DTBs/pinmux and SKU/super-mode selections.

## general flow


1. **`cti-flash.sh`**
   Interactive UI only. Selects: board + config + module + mode.

2. **`cti-nvme-flash.sh`**
   Thin wrapper. Does:

   * `source <board_config>.conf`
   * runs `l4t_initrd_flash.sh ... -p "-c .../${EMMC_CFG}" ... <board_config> internal`

3. **`<board_config>.conf` (Hadron base.conf)**
   Only sets carrier-specific:

   * `DTB_FILE`
   * `PINMUX_CONFIG`
   * `TBCDTB_FILE`
     and sources CTI common.

4. **`cti-orin-nx.conf.common`** (CTI logic layer)
   Adds:

   * SUPER_MODE behavior
   * SKU-dependent BPMP DTB/overlays
   * CTI BCT additions (`MB2_BCT`, `GPIOINT_CONFIG`, `SCR_CONFIG`)
   * default `EMMC_CFG="flash_t234_qspi.xml"`

5. **`p3767.conf.common`** (NVIDIA baseline for Orin NX/Nano module family)
   Defines:

   * the whole boot chain artifact set (MB1/MB2/UEFI/BPMP/TOS/etc.)
   * board EEPROM processing hooks
   * **`EMC_OPT_DISABLE_FUSE_OVERRIDE="1"`**
   * default BCTs, DTBO list, ROOTFSSIZE, AB/ENC toggles, etc.

6. **`tools/kernel_flash/l4t_initrd_flash.sh`** (NVIDIA core flashing)
   Executes the flash plan:

   * prepares images
   * queries EEPROM/board identity (as needed)
   * invokes tegraflash
   * provisions QSPI and external NVMe



## overview


Understood. Below is a **high-level, conceptual view** of the Jetson *initrd-based burn (flash) process* — focused on **flow and roles**, not implementation details.

---

## The big picture

The burn process is **not a single flash step**.
It is a **staged handoff** between the **host** and the **target**, using **initrd + NFS + chroot** as a controlled execution environment.

Think of it as:

> **“Prepare everything on the host → boot a tiny OS on the device → let that OS flash itself using host-provided data.”**

---

## The flow in 6 conceptual phases

---

## 1. Image preparation (Host-only)

**Goal:** Create *all* artifacts needed for flashing — without touching the device yet.

What happens conceptually:

* The host runs NVIDIA’s normal `flash.sh`, but in **“no-flash” mode**
* This generates:

  * bootloader images
  * kernel / dtb / initrd images
  * partition images (APP, UDA, etc.)
  * partition metadata (what goes where, sizes, offsets)
* Everything is packaged into a **self-contained “flash bundle”**

Mental model:

> *“Build a complete installation kit for this board.”*

---

## 2. Flash bundle packaging (Host-only)

**Goal:** Turn the generated images into a portable, structured payload.

What happens:

* Images are copied into a structured directory:

  * internal storage payload
  * external storage payload (if NVMe / SSD used)
* Index/config files describe:

  * which partitions exist
  * where each image goes
* The **actual flash writer script** is included in the bundle

Mental model:

> *“Create a USB installer — but over NFS instead of USB.”*

---

## 3. Bootstrapping a minimal flash OS (Host → Device)

**Goal:** Get the device into a known, clean execution environment.

What happens:

* The device is booted into **recovery**
* Instead of flashing immediately:

  * the host **RCM-boots a tiny Linux (initrd)** onto the device
* This Linux:

  * runs entirely in RAM
  * has networking
  * has no dependency on existing storage contents

Mental model:

> *“Boot a live Linux installer into RAM.”*

---

## 4. Network handoff (Host ↔ Device)

**Goal:** Make the host’s flash bundle available to the device.

What happens:

* Host exports directories via **NFS**
* Initrd on the device mounts:

  * a root filesystem from the host
  * the flash bundle directory
* The device now sees the host filesystem as local

Mental model:

> *“Mount the installer files over the network.”*

---

## 5. Self-flash (Device-side, but using host data)

**Goal:** Let the device flash itself.

What happens:

* Inside initrd:

  * the device **chroots into the host-provided rootfs**
  * runs the flash writer script
* That script:

  * creates GPT tables
  * writes QSPI / eMMC / NVMe
  * verifies writes
* The host is no longer flashing *to* the device — the device is flashing *itself*

Mental model:

> *“The installer OS installs the system onto the disk.”*

---

## 6. Exit and reboot

**Goal:** Leave flash mode and boot normally.

What happens:

* Flashing completes
* Device reboots
* Initrd is discarded
* Device boots from newly written storage

Mental model:

> *“Remove the installer and boot the installed OS.”*

---

## Why NVIDIA does it this way

This design solves several hard problems:

* **Unified flow** for:

  * QSPI
  * eMMC
  * NVMe / external storage
* **No special host drivers** needed for raw block writes
* **Scales to mass-flash** and network setups
* **Secure-boot friendly** (signing happens before boot)
* **Recoverable** even from broken on-device OS

--


```

┌─────────────────────────────────────────────────────────────────────┐
│                              HOST PC                                 │
│                        (Linux_for_Tegra BSP)                          │
└─────────────────────────────────────────────────────────────────────┘
        │
        │ 1) PREPARE IMAGES (no device involved yet)
        │
        │   flash.sh --no-flash
        │   └─ generates bootloader, kernel, dtb, initrd, APP, etc.
        │
        ▼
┌─────────────────────────────────────────────────────────────────────┐
│                  FLASH IMAGE BUNDLE (HOST)                            │
│  tools/kernel_flash/images/                                           │
│    ├── internal/   (eMMC / QSPI images + flash.idx)                   │
│    ├── external/   (NVMe images + flash.idx)                          │
│    ├── flash.cfg   (what to flash, where)                             │
│    └── l4t_flash_from_kernel.sh                                       │
└─────────────────────────────────────────────────────────────────────┘
        │
        │ 2) PUT DEVICE IN RECOVERY
        │
        ▼
┌─────────────────────────────────────────────────────────────────────┐
│                          JETSON DEVICE                                │
│                       (RCM / Recovery Mode)                           │
└─────────────────────────────────────────────────────────────────────┘
        ▲
        │ 3) RCM BOOT INITRD
        │   (USB or Ethernet)
        │
┌─────────────────────────────────────────────────────────────────────┐
│                    INITRD LINUX (RAM ONLY)                             │
│   - Minimal Linux                                                     │
│   - Networking enabled                                                │
│   - No dependency on existing storage                                 │
└─────────────────────────────────────────────────────────────────────┘
        │
        │ 4) NETWORK HANDOFF
        │
        │   Host exports via NFS:
        │     - rootfs
        │     - flash image bundle
        │
        ▼
┌─────────────────────────────────────────────────────────────────────┐
│             INITRD MOUNTS HOST FILESYSTEM                              │
│                                                                         │
│   /mnt        -> host rootfs (NFS)                                     │
│   /mnt/mnt    -> host flash images (NFS)                               │
│                                                                         │
│   chroot /mnt                                                         │
└─────────────────────────────────────────────────────────────────────┘
        │
        │ 5) SELF-FLASH (DEVICE FLASHES ITSELF)
        │
        ▼
┌─────────────────────────────────────────────────────────────────────┐
│              l4t_flash_from_kernel.sh                                  │
│                                                                         │
│   - create GPT                                                         │
│   - flash QSPI                                                         │
│   - flash eMMC                                                         │
│   - flash NVMe (optional)                                              │
│   - verify writes                                                      │
│                                                                         │
│   (uses host-provided images, runs on device CPU)                      │
└─────────────────────────────────────────────────────────────────────┘
        │
        │ 6) FINISH
        │
        ▼
┌─────────────────────────────────────────────────────────────────────┐
│                          DEVICE REBOOT                                │
│                                                                         │
│   initrd discarded                                                     │
│   boot from freshly flashed storage                                    │
│                                                                         │
└─────────────────────────────────────────────────────────────────────┘


```