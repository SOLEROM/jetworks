#!/bin/bash

COMPAT_MAJOR=("32")
COMPAT_MINOR=("7.2")

COMPAT_JETSON=("Nano")

CTI_L4T_VER="NANO-32.7.2-V002"


#utility functions
chkroot(){

    if [ $EUID -ne 0 ]
    then
        echo "Please run as sudo or root"
        exit 1
    fi
}

chkhost(){

    if [ $( uname -i | grep -c x86) -lt 1 ]; then
        echo "This version of the CTI-L4T BSP must be installed on the x86 Host system"
        exit 1
    fi

}

#check if bsp installed in the correct folder on host machine
chkfolder(){
    
    if [ $(basename $(dirname $(pwd))) != "Linux_for_Tegra" ] || [ $(basename $(pwd)) != "CTI-L4T" ]; then
        echo "This BSP should be extracted in the Linux_for_Tegra directory"
        echo "of your Jetpack install. This install script  must be run from the"
        echo "Linux_for_Tegra/CTI-L4T directory"
        exit 2
    fi

}

update_debsrc_list(){
    if [ -f ../rootfs/etc/apt/sources.list.d/nvidia-l4t-apt-source.list ]; then
        echo "Suppressing nvidia-l4t-apt-source"
        if ! type sed > /dev/null; then
            mv ../rootfs/etc/apt/sources.list.d/nvidia-l4t-apt-source.list ../rootfs/etc/apt/sources.list.d/nvidia-l4t-apt-source.list.old  
        else
            sed -i 's/^/#/' ../rootfs/etc/apt/sources.list.d/nvidia-l4t-apt-source.list
        fi
    fi
}

install_extra(){
    rm ../nv_tegra/l4t_deb_packages/nvidia-l4t-apt-source_*
    rm ../nv_tegra/l4t_deb_packages/nvidia-l4t-camera_*
    rm ../nv_tegra/l4t_deb_packages/nvidia-l4t-init_*
    rm ../nv_tegra/l4t_deb_packages/nvidia-l4t-oem-config_*
    rm ../nv_tegra/l4t_deb_packages/nvidia-l4t-tools_*
    cp ./extra/*.deb ../nv_tegra/l4t_deb_packages/
}

install_conf(){

    cp -rf ./conf/* ../

}

install_dtb(){
    cp ./kernel/dtb/* ../kernel/dtb/

}

install_kernel(){
    # remove old debs 
    rm ../kernel/*.deb
    
    # copy kernel debs
    cp ./kernel/*.deb ../kernel
    cp ./kernel/*Image ../kernel
    cp ./kernel/kernel_supplements.tbz2 ../kernel/
}


install_bl(){
    if [ -d ./bl ]; then
		rm ../bootloader/*.deb
		cp -r ./bl/* ../bootloader/
	fi
}


install_ver_file(){

    if [ ! -d "../rootfs/etc/cti" ]; then
        mkdir ../rootfs/etc/cti
    fi  

    echo $CTI_L4T_VER > ../rootfs/etc/cti/CTI-L4T.version 

}

print_versions(){

    echo "Supported Version Information"
    echo "  CTI-L4T Board Support Package Version:" $CTI_L4T_VER
    
    echo "  Supported Linux for Tegra Release Versions: "
    for j in ${COMPAT_MINOR[@]}; do
        echo "    " $COMPAT_MAJOR"."$j
    done

    echo "  Supported Nvidia Jetson Module Hardware: "
    for k in ${COMPAT_JETSON[@]}; do
        echo "    " $k
    done

}

cleanup_files(){
    #cd to Linux_for_tegra directory and remove the CTI_L4T folder
	cd ..
	rm -r CTI-L4T
	exec $SHELL #execute the above command in the current shell
	echo "Cleaned up CTI-L4T..."
	echo "Back in Linux_for_Tegra directory"
}

#help functions 

usage(){
    echo -e "  Usage: ./install.sh "
    echo -e "  Before installing this BSP, please read the included readme.txt"
    echo -e "  To switch between different products, the Nano will need"
    echo -e "  to be re-flashed"
    echo -e "  Below are the compatible L4T versions and board profiles:\n"

    print_versions
}

verify_package(){
        #calculate the hash of resources.tgz to verify the integrity of the package
        echo "  Checking package integrity..."
        md5_expected=$(cat resources.md5)
        echo "     md5_expected = $md5_expected"
        md5_calculated=$(md5sum resources.tgz | cut -d ' ' -f 1)
        echo "     md5_calculated = $md5_calculated"

        if ! grep -q ${md5_calculated} resources.md5; then
                echo "  ERROR package appears to have been corrupted or tampered with!"
                echo "  Please try to download again, if problem persists contact"
                echo "  support@connecttech.com"
                exit 1 # abort
        fi
        echo "     package integrity verified!"
}


#start
usage

chkroot

chkfolder

verify_package

tar -pxzf resources.tgz

#install CTI-flash
cp cti-flash.sh ..
chmod +x ../cti-flash.sh

install_conf

install_bl

install_dtb

install_kernel

install_ver_file

install_extra

#update_debsrc_list

pushd ..

./apply_binaries.sh 

popd


# ensure the files finish copying 
sync

echo "CTI-L4T-$CTI_L4T_VER Installed!"

cleanup_files
