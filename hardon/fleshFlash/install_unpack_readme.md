
# 4.1.2 Installing JetPack from Nvidia Embedded Download Center

1. Create a new directory for installing the Jetpack. Referred to as <BSP_ROOT>
   in these instructions. 

2. Go to Jetpack Release Page https://developer.nvidia.com/embedded/jetson-linux-r3644

3. Download the "Driver Package (BSP)" and "Sample Root Filesystem" files for
   Orin modules (t234 platform). 

4. Put the "L4T Driver Package (BSP)" and "Sample Root Filesystem" in <BSP_ROOT>.
   Afterwards, you should have the following files in <BSP_ROOT>
   - Jetson_Linux_R36.4.4_aarch64.tbz2
   - Tegra_Linux_Sample-Root-Filesystem_R36.4.4_aarch64.tbz2

5. Extract the "L4T Driver Package" tarball: 

    cd <BSP_ROOT>
    sudo tar -jxf Jetson_Linux_R36.4.4_aarch64.tbz2

6. You should now have a new directory called Linux_for_Tegra in your <BSP_ROOT> folder.
   Extract the "Sample Root Filesystem" into Linux_for_Tegra/rootfs. 

    sudo tar -C Linux_for_Tegra/rootfs/ -xjf Tegra_Linux_Sample-Root-Filesystem_R36.4.4_aarch64.tbz2


================================================================================
 4.2 CTI BSP Installation
================================================================================

1. Copy the CTI-L4T-ORIN-NX-NANO-36.4.4-V###.tgz package into <BSP_ROOT>/Linux_for_Tegra.

    If you are using Nvidia's SDK manager then "<BSP_ROOT>" will be:
   ~/nvidia/nvidia_sdk/<JetPack_Version>_Linux_JETSON_NX_ORIN_TARGETS/
    or
    ~/nvidia/nvidia_sdk/<JetPack_Version>_Linux_JETSON_NANO_ORIN_TARGETS/
    depending on your target module.

    Otherwise if manually installing from the Nvidia Embedded Download Center
    <BSP_ROOT> will be the folder created previously

    cp CTI-L4T-ORIN-NX-NANO-36.4.4-V###.tgz <BSP_ROOT>/Linux_for_Tegra

2. Extract the BSP: tar -xzf CTI-L4T-ORIN-NX-NANO-36.4.4-V###.tgz
    cd <BSP_ROOT>/Linux_for_Tegra
    sudo tar -xzf CTI-L4T-ORIN-NX-NANO-36.4.3-V###.tgz

3. Change into the CTI-L4T directory:
   cd <BSP_ROOT>/Linux_for_Tegra/CTI-L4T

4. Run the install script (as root or sudo) to automatically install the BSP files
   to the correct locations:
    
    sudo ./install.sh
    #return to Linux_for_Tegra
    cd ..

5. The CTI-L4T BSP is now installed on the host system and it should now be able
   to flash the Orin-NX/Orin-NANO module.


================================================================================
================================================================================
  5. Flashing Orin-NX/Orin-NANO Modules
================================================================================
================================================================================
1. Connect an NVMe m.2 card to one of the m.2 slots on your Orin-nx/Orin-nano carrier.

2. Connect the NX/NANO Orin and Carrier to the computer via USB, following the 
   instructions in the appropriate manual.

3. Put the system to be flashed into recovery mode, following the 
   instructions in the appropriate manual


4. There are two options for flashing Jetson modules:

    Using CTI's automated script:
        ./cti-flash.sh
    
        Follow the menu and select your desired configuration. Once selected,
    
        the device will start to flash.


    Using the Manual Method with cti-nvme-flash:

        Note do not add the ".conf" file extension to the <config> parameter:
    
        Manual Flash (standard mode): 
             ./cti-nvme-flash.sh cti/<module>/<boardname>/<config> 
    
        <module> is either orin-nx or orin-nano depending on your module.
   
        Manual Flash (super mode):
            SUPER_MODE=1 ./cti-nvme-flash.sh cti/<module>/<boardname>/<config>
 
        Examples:  
                ./cti-nvme-flash.sh cti/orin-nx/boson/base
             ./cti-nvme-flash.sh cti/orin-nano/boson/base
             SUPER_MODE=1 ./cti-nvme-flash.sh cti/orin-nx/hadron/base

5. Once the flashing has completed, the Orin-nx/Orin-nano will reboot 

================================================================================
================================================================================
 6. Upgrading to a New Package Release
================================================================================
================================================================================

Upgrading L4T or CTI-BSP versions without reflashing is not currently supported.


================================================================================
================================================================================
 7. Switching Profiles on Orin-NX/Orin-NANO
================================================================================
================================================================================
1. Open a terminal on the Orin-NX/Orin-NANO

2. Run "sudo cti-orin-nx-nano-fdt.sh"

3. Select the profile you wish to switch to from the menu.

4. Select the target module (Orin-NX or Orin-NANO) from the menu.

5. Restart the system

Note: This script updates the dtb by appending/replacing the FDT variable in extlinux.conf
This script does not support switching to super mode. When board is flashed into super mode,
this script cannot switch back to normal mode the module needs to be reflashed.
