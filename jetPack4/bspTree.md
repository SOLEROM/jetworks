# bsp tree

```
CTI-L4T-NANO-32.7.2-V002.tgz 
=============================
├── install.sh
├── readme.txt
└── resources.tgz
```

## resources.tgz

```
resoruce_unapck
├── bl
│   └── nvidia-l4t-bootloader_32.7.2-20220704-CTI-NANO-V002_arm64.deb
├── conf
│   └── cti
│       └── nano
│           ├── boson
│           │   ├── base.conf
│           │   ├── fsm-imx290-3cam.conf
│           │   ├── fsm-imx290-4cam.conf
│           │   ├── fsm-imx296-4cam.conf
│           │   ├── fsm-imx297-4cam.conf
│           │   ├── fsm-imx334-3cam.conf
│           │   ├── fsm-imx335-3cam.conf
│           │   ├── fsm-imx335-4cam.conf
│           │   ├── fsm-imx412-3cam.conf
│           │   ├── fsm-imx412-4cam.conf
│           │   ├── fsm-imx415-3cam.conf
│           │   ├── fsm-imx415-4cam.conf
│           │   ├── fsm-imx464-3cam.conf
│           │   ├── fsm-imx464-4cam.conf
│           │   ├── fsm-imx477-3cam.conf
│           │   ├── fsm-imx477-4cam.conf
│           │   ├── fsm-imx565-3cam.conf
│           │   ├── fsm-imx565-4cam.conf
│           │   ├── fsm-imx585-3cam.conf
│           │   └── fsm-imx585-4cam.conf
│           ├── photon
│           │   ├── ardu-imx477.conf
│           │   ├── base.conf
│           │   ├── econ-ar0234.conf
│           │   ├── econ-ar0330.conf
│           │   ├── econ-ar0521.conf
│           │   ├── econ-imx415.conf
│           │   ├── rpi-imx219.conf
│           │   ├── vc-imx297.conf
│           │   ├── vc-imx327c.conf
│           │   └── vc-ov9281.conf
│           └── quark
│               ├── ardu-imx477.conf
│               ├── base.conf
│               ├── econ-ar0234.conf
│               ├── econ-ar0330.conf
│               ├── econ-ar0521.conf
│               ├── econ-imx415.conf
│               ├── rpi-imx219.conf
│               ├── vc-imx297.conf
│               ├── vc-imx327c.conf
│               └── vc-ov9281.conf
├── cti-flash.sh
├── extra
│   ├── cti-l4t-apt-source.list
│   ├── cti-l4t-utils_4.9.253-tegra-32.7.2-20220630-CTI-NANO-V002_arm64.deb
│   ├── cti-ota-public.asc
│   ├── nvidia-l4t-apt-source_32.7.2-20220630-CTI-NANO-V002_arm64.deb
│   ├── nvidia-l4t-camera_32.7.2-20220630-CTI-NANO-V002_arm64.deb
│   ├── nvidia-l4t-init_32.7.2-20220630-CTI-NANO-V002_arm64.deb
│   ├── nvidia-l4t-oem-config_32.7.2-20220630-CTI-NANO-V002_arm64.deb
│   └── nvidia-l4t-tools_32.7.2-20220630-CTI-NANO-V002_arm64.deb
└── kernel
    ├── dtb
    │   ├── tegra210-nano-cti-NGX003-ARDU-IMX477-2CAM.dtb
    │   ├── tegra210-nano-cti-NGX003.dtb
    │   ├── tegra210-nano-cti-NGX003-ECON-AR0234-2CAM.dtb
    │   ├── tegra210-nano-cti-NGX003-ECON-AR0330-2CAM.dtb
    │   ├── tegra210-nano-cti-NGX003-ECON-AR0521-2CAM.dtb
    │   ├── tegra210-nano-cti-NGX003-ECON-IMX415-2CAM.dtb
    │   ├── tegra210-nano-cti-NGX003-RPI-IMX219-2CAM.dtb
    │   ├── tegra210-nano-cti-NGX003-VC-IMX297-2CAM.dtb
    │   ├── tegra210-nano-cti-NGX003-VC-IMX327c-2CAM.dtb
    │   ├── tegra210-nano-cti-NGX003-VC-OV9281-2CAM.dtb
    │   ├── tegra210-nano-cti-NGX004-ARDU-IMX477-2CAM.dtb
    │   ├── tegra210-nano-cti-NGX004.dtb
    │   ├── tegra210-nano-cti-NGX004-ECON-AR0234-2CAM.dtb
    │   ├── tegra210-nano-cti-NGX004-ECON-AR0330-2CAM.dtb
    │   ├── tegra210-nano-cti-NGX004-ECON-AR0521-2CAM.dtb
    │   ├── tegra210-nano-cti-NGX004-ECON-IMX415-2CAM.dtb
    │   ├── tegra210-nano-cti-NGX004-RPI-IMX219-2CAM.dtb
    │   ├── tegra210-nano-cti-NGX004-VC-IMX297-2CAM.dtb
    │   ├── tegra210-nano-cti-NGX004-VC-IMX327c-2CAM.dtb
    │   ├── tegra210-nano-cti-NGX004-VC-OV9281-2CAM.dtb
    │   ├── tegra210-nano-cti-NGX007.dtb
    │   ├── tegra210-nano-cti-NGX007-FSM-IMX290-3CAM.dtb
    │   ├── tegra210-nano-cti-NGX007-FSM-IMX290-4CAM.dtb
    │   ├── tegra210-nano-cti-NGX007-FSM-IMX296-4CAM.dtb
    │   ├── tegra210-nano-cti-NGX007-FSM-IMX297-4CAM.dtb
    │   ├── tegra210-nano-cti-NGX007-FSM-IMX334-3CAM.dtb
    │   ├── tegra210-nano-cti-NGX007-FSM-IMX335-3CAM.dtb
    │   ├── tegra210-nano-cti-NGX007-FSM-IMX335-4CAM.dtb
    │   ├── tegra210-nano-cti-NGX007-FSM-IMX412-3CAM.dtb
    │   ├── tegra210-nano-cti-NGX007-FSM-IMX412-4CAM.dtb
    │   ├── tegra210-nano-cti-NGX007-FSM-IMX415-3CAM.dtb
    │   ├── tegra210-nano-cti-NGX007-FSM-IMX415-4CAM.dtb
    │   ├── tegra210-nano-cti-NGX007-FSM-IMX464-3CAM.dtb
    │   ├── tegra210-nano-cti-NGX007-FSM-IMX464-4CAM.dtb
    │   ├── tegra210-nano-cti-NGX007-FSM-IMX477-3CAM.dtb
    │   ├── tegra210-nano-cti-NGX007-FSM-IMX477-4CAM.dtb
    │   ├── tegra210-nano-cti-NGX007-FSM-IMX565-3CAM.dtb
    │   ├── tegra210-nano-cti-NGX007-FSM-IMX565-4CAM.dtb
    │   ├── tegra210-nano-cti-NGX007-FSM-IMX585-3CAM.dtb
    │   └── tegra210-nano-cti-NGX007-FSM-IMX585-4CAM.dtb
    ├── Image
    ├── kernel_supplements.tbz2
    ├── nvidia-l4t-kernel_4.9.253-tegra-32.7.2-20220630-CTI-NANO-V002_arm64.deb
    ├── nvidia-l4t-kernel-dtbs_4.9.253-tegra-32.7.2-20220630-CTI-NANO-V002_arm64.deb
    ├── nvidia-l4t-kernel-headers_4.9.253-tegra-32.7.2-20220630-CTI-NANO-V002_arm64.deb
    └── zImage

```