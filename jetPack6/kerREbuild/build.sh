# def

export TOP_DIR=/out
export L4T_DIR=$TOP_DIR/Linux_for_Tegra
export LDK_ROOTFS_DIR=$TOP_DIR/Linux_for_Tegra/rootfs
export ARCH=arm64
export TEGRA_KERNEL_OUT=$TOP_DIR/kernel_out
export CROSS_COMPILE=$TOP_DIR/toolchain/aarch64--glibc--stable-2022.08-1/bin/aarch64-buildroot-linux-gnu-
export LOCALVERSION=-tegra
export NVIDIA_SRC=$TOP_DIR/kernel_sources/Linux_for_Tegra/source/
export KERNEL_HEADERS=$TOP_DIR/kernel_sources/Linux_for_Tegra/source/kernel/kernel-jammy-src



## prepare tree
* run inside docker to make everthing root id;

cd $TOP_DIR
mkdir $TOP_DIR/kernel_out -p
mkdir $TOP_DIR/kernel_sources
tar -xjpf Jetson_Linux_R36.4.4_aarch64.tbz2
tar -xjpf  Tegra_Linux_Sample-Root-Filesystem_R36.4.4_aarch64.tbz2 -C Linux_for_Tegra/rootfs/


cd $L4T_DIR
./apply_binaries.sh


cd $TOP_DIR/kernel_sources
tar -xjpf $TOP_DIR/public_sources.tbz2


cd $NVIDIA_SRC
tar -xjpf kernel_src.tbz2
tar xf kernel_oot_modules_src.tbz2
tar xf nvidia_kernel_display_driver_source.tbz2


## build
cd $KERNEL_HEADERS
make ARCH=arm64 O=$TEGRA_KERNEL_OUT tegra_prod_defconfig
make ARCH=arm64 O=$TEGRA_KERNEL_OUT Image -j4
make ARCH=arm64 O=$TEGRA_KERNEL_OUT modules -j4
make ARCH=arm64 O=$TEGRA_KERNEL_OUT dtbs

make ARCH=arm64 O=$TEGRA_KERNEL_OUT modules_install INSTALL_MOD_PATH=$LDK_ROOTFS_DIR

## burn

* the compiled kernel and modules appear in:
ls $TEGRA_KERNEL_OUT

* The ready-to-flash system build resides in:
ls $L4T_DIR

