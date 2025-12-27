++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
+    Board Support Package ReadMe for Connect Tech Nvidia Jetson Nano Carriers
+    BSP Version:    NANO-32.7.2 V002
+    Date:        2022/07/04        
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++    

================================================================================
Introduction
================================================================================

    This Board Support Package adds support for Connect Tech Jetson Nano Family
    carrier boards to Linux4Tegra. It includes any extra files required
    to use all the features of the carriers.

    Please check the "Product Specific Details" section for what features
    for your board is supported with this BSP release and the "Changes"
    section for the changes made between versions.
    You can check which version of the BSP you have installed by running:

          cat /etc/cti/CTI-L4T.version     

    Check for the Latest Version of the CTI-L4T BSP at:

    http://connecttech.com/resource-center/l4t-board-support-packages/ 
    
    Please check the requirements section for minimum requirements.

    More detailed Release Note can be found here:

    http://connecttech.com/resource-center/cti-l4t-nvidia-jetson-board-support-package-release-notes/


================================================================================
Requirements    
================================================================================

    -x86 based host machine running Ubuntu 18.04
    -Jetpack 4.6.2 installed via Nvidia SDK Manager (from Nvidia Embedded Download Center)
     or via source packages from Nvidia's website
    -Production Nano module
    -Connect Tech Nano Family Carrier 
    -USB Cable for flashing 

    *L4T version can be found in /etc/nv_tegra_release and will look like this:
    # R32 (release), REVISION: 7.2
    
================================================================================
Supported Cameras in BSP    
================================================================================
    - ECON: e-CAM24_CUNANO AR0234
    - ECON: e-CAM30_CUNANO AR0330
    - ECON: e-CAM50_CUNANO AR0521
    - ECON: e-CAM80_CUNANO IMX415
    - ArduCam: IMX477
    - Raspberry Pi Camera Module v2: IMX219
    - Vision Components: IMX297
    - Vision Components: IMX327C
    - Vision Components: OV9281
    - Framos: IMX290
    - Framos: IMX296
    - Framos: IMX297
    - Framos: IMX327
    - Framos: IMX334
    - Framos: IMX335
    - Framos: IMX412
    - Framos: IMX415
    - Framos: IMX462
    - Framos: IMX464
    - Framos: IMX477
    - Framos: IMX565
    - Framos: IMX585

================================================================================
Installation (Prefered approach)
================================================================================
    1. Before Installing the BSP you will need to install Jetpack 4.6.2 on the x86
           host system using the Nvidia SDK Manager or from the source packages on 
       Nvidia's website as detailed below.

    2. Copy the CTI-L4T-NANO-32.7.2-V###.tgz package into ~/nvidia/nvidia_sdk/
       JetPack_4.6.2_Linux_JETSON_NANO_TARGETS/Linux_for_Tegra/

    3. Extract the BSP:

        tar -xzf CTI-L4T-NANO-32.7.2-V###.tgz


    4. Change into the CTI-L4T directory:
        
        cd ./CTI-L4T

    5. Run the install script (as root or sudo) to 
       automatically install the BSP files to the correct locations:

        sudo ./install.sh
        cd ..

    6. The CTI-L4T BSP is now installed on the host system and it should now be
       able to flash the Nano.

    7. To flash on the Nano use the following (do not add ".conf"):
        
        CTI Assisted Flashing:
        ./cti-flash.sh

        Manual Flash:
        ./flash.sh cti/nano/photon/base mmcblk0p1
        
================================================================================
Installing JetPack from SDK Manager 
================================================================================
    1. Please follow installation steps from kdb374 for Jetpack 4.2+ 
        http://connecttech.com/resource-center/kdb374/

================================================================================
Installing JetPack from Nvidia's Source packages (Alternate approach)
================================================================================

    1. Go to https://developer.nvidia.com/embedded/linux-tegra-archive and click on
       the green button labeled "32.7.2 >".       
    
    2. Download the "L4T Driver Package (BSP)" and "Sample Root Filesystem" files for Nano.
       Afterwards, you should have the files "Jetson-210_Linux_R32.7.2_aarch64.tbz2" and 
       "Tegra_Linux_Sample-Root-Filesystem_R32.7.2_aarch64.tbz2".
       
    2. Create a directory named ~/nvidia/nvidia_sdk/JetPack_4.6.2_Linux_JETSON_NANO_TARGETS/
       and copy the "Jetson-210_Linux_R32.7.2_aarch64" file you downloaded into 
       that directory.
       
    3. Unzip the tarball:
       
       "sudo tar jxf Jetson-210_Linux_R32.7.2_aarch64.tbz2"
       
       You should now have a new directory called Linux_for_Tegra in your 
       "JetPack_4.6.2_Linux_JETSON_NANO_TARGETS" folder. Change directories into that 
       and then copy the "Tegra_Linux_Sample-Root-Filesystem_R32.7.2_aarch64.tbz2" 
       file you downloaded into the rootfs folder inside.
       
    4. Change into the rootfs folder and unzip the tarball:
    
       "sudo tar jxf Tegra_Linux_Sample-Root-Filesystem_R32.7.2_aarch64.tbz2"
       
    5. You can change directories back to ~/nvidia/nvidia_sdk/JetPack_4.6.2_Linux_JETSON_NANO_TARGETS/Linux_for_Tegra/ 
       and run:

       "sudo ./apply_binaries.sh" 
       
       if you wish to flash one of Nvidia's devkits, or move on to installing CTI's BSP.
       
    6. Copy the CTI-L4T-NANO-32.7.2-V###.tgz package into ~/nvidia/nvidia_sdk/
      JetPack_4.6.2_Linux_JETSON_NANO_TARGETS/Linux_for_Tegra/
      
    7.  Extract the BSP:

        tar -xzf CTI-L4T-NANO-32.7.2-V###.tgz

    8. Change into the CTI-L4T directory:
        
        cd ./CTI-L4T

    9. Run the install script (as root or sudo) to 
       automatically install the BSP files to the correct locations:

        sudo ./install.sh
        cd ..

    10. The CTI-L4T BSP is now installed on the host system and it should now be
       able to flash the Nano.

    11. To flash on the Nano use the following (do not add ".conf"):
        
        CTI Assisted Flashing:
        ./cti-flash.sh

        Manual Flash:
        ./flash.sh cti/nano/photon/base mmcblk0p1 
      
================================================================================
Flashing Nano
================================================================================
   
    1. Connect the Nano and Carrier (or Dev-Kit) to the computer via USB
       Following the instructions in the appropriate manual.
    2. Put the system to be flashed into recovery mode, following the 
       instructions in the appropriate manual
    3. To flash on the Nano use the following (do not add ".conf"):
        
        CTI Assisted Flashing:
        ./cti-flash.sh

        Manual Flash:
        ./flash.sh cti/nano/photon/base mmcblk0p1
        
    4. Once the flashing has completed, the Nano will reboot 
    
================================================================================
Switching Profiles on Nano
================================================================================

1. Open a terminal on the NANO

2. Run "sudo cti-nano-fdt.sh"

3. Select the profile you wish to switch to from the menu

4. Restart the system

Note: This script updates dtb by appending/replacing the FDT variable in extlinux.conf
      It also sets root=/dev/mmcblk0p1 by modifying the "APPEND" variable

================================================================================
Upgrading to a New Package Release
================================================================================
    Note that using sudo apt-get upgrade may break dependencies required by
    the Nvidia Jetpack.

    It is recommended you reflash your module if you wish to update to a 
    newer package version.

    Deb Packages are still provided on the CTI deb server, and our source list
    is still provided in the release. If you wish to use apt-get upgrade, 
    you can do so at your own risk:
    
    run:
    apt-get update
    apt-get upgrade nvidia-l4t-core

    Note that you will need to use the device tree switching script described in
    the previous section to reselect your configuration.
    This will ensure that you are using the updated device tree.


================================================================================
Package Integrity Check
================================================================================
    The BSP release package contains a hash file "resources.md5" which is 
    calculated and stored by our build system at deployment.

    The install.sh script will automatically run a hash calculation and compare
    it to "resources.md5" to see if any data has changed since. Your installation
    will fail if the package contents are incomplete, modified or corrupt. 
    If this happens, please try to reinstall the package. 
    
    If the problem persists contact support@connecttech.com.

================================================================================
Product Specific Details
================================================================================

--------------------------------------------------------------------------------
NGX003 (Photon)
--------------------------------------------------------------------------------
    
    - USB 3.0 Support
    - USB OTG Support
    - MIPI Camera Support
    - HDMI Support
    - Micro SD Card Support
    - NVMe Card Support
    - PoE Support
    - Wifi/Bluetooth Card Support
    - Cellular Card Support
    - RGB LED Support
    - UART Support
    - I2C Support
    - GPIO Support
    - Fan + Tachometer Support
    
--------------------------------------------------------------------------------
NGX004 (Quark)
--------------------------------------------------------------------------------

    - USB 3.0 Support
    - USB OTG Support
    - MIPI Camera Support
    - Micro SD Card
    - Ethernet
    - GbE PCI Support
    - UART Support
    - I2C Support
    - GPIO Support
    - SPI Support
    - PWM Support(Note, as of this revision, only works on pin 38 of the I/O header)
    - Fan + Tachometer Support
    
--------------------------------------------------------------------------------
NGX007 (Boson)
--------------------------------------------------------------------------------
    - USB 3.0 Support
    - USB OTG Support
    - FRAMOS Camera Support
    - Display(HDMI)
    - Micro SD Card
    - GbE Phy Support
    - UART Support
    - SPI Support
    - I2C Support
    - PWM Support
    - NVMe Card Support    
    - Fan + Tachometer Support

================================================================================
Changes
================================================================================
       
Version NANO-32.7.2 V002, July 04, 2022
    - Added IMX585 support to Boson.
    - Added MD5 hash checksum check to install script.

Version NANO-32.7.2 V001, May 13, 2022
    - Initial Release on Jetpack 4.6.2.
    - Added Fan Tachometer support for Quark, Photon and Boson.

Version NANO-32.7.1 V002, Apr 26, 2022
    - Added Support for Framos IMX296, IMX297, IMX335, IMX464, IMX477
      and IMX565 to Boson.
    - Added PTN5150 Current advertisement config support for NGX014 to NGX004 dtb
      (NGX014 = Quark + PTN5150 USB CC Logic Chip)

Version NANO-32.7.1 V001, Apr 12, 2022
    - Initial Release for Jetpack 4.6.1 L4T 32.7.1
    - Added support for Framos IMX412 to Boson

Version NANO-32.6.1 V005, Jan 20, 2022
    - Added support for ECON e-CAM24_CUNANO to Photon and Quark.
    - Organized cti configurations to match what is seen in our
      t194/t186 packages (board name is now a folder).

Version NANO-32.6.1 V004, Dec 10, 2021
    - Adding support for FRAMOS IMX290/IMX327/IMX462 to Boson carrier
    - Adding support for ECON e-CAM80_CUNANO to Photon and Quark carrier
    - New naming convention for conf files to include camera provider

Version NANO-32.6.1 V003, Oct 6, 2021
    - Adding support for FRAMOS IMX334 to Boson carrier

Version NANO-32.6.1 V002, Sept 21, 2021
    - Adding support for Boson carrier

Version NANO-32.6.1 V001, August 26, 2021
    - Initial release on Jetpack 4.6 L4T 32.6.1
    - Adds updates addressed in Nvidia's latest release on August 2021

Version NANO-32.5 V001, Feb 19, 2020
    - Initial release on Jetpack 4.5 L4T 32.5

Version NANO-32.4.4 V003, Jan 14, 2021
    - Added support for IMX477 camera.

Version NANO-32.4.4 V002, Jan 07, 2021
    - Added support for ECON AR0330 and AR0521 camera sensor

Version NANO-32.4.4 V001, Oct 29, 2020
    - Initial release on Jetpack 4.4 L4T 32.4.4 

Version NANO-32.4.3 V003, Oct 21, 2020
    -Added support for Vision Components: IMX327c and OV9281

Version NANO-32.4.3 V002, Oct 05, 2020
    - Supports apt-get upgrade
    - Upgrade support from cti debian server from this version onwards
    - Installs a script to enable DTB switching using dd command
        - Script: cti-nano-fdt.sh
        - Install path: /usr/bin

Version NANO-32.4.3 V001, July 27, 2020
    - Initial release on Jetpack 4.4 L4T 32.4.3

Version NANO-32.4.2 V001, June 05, 2020
    - Initial release on Jetpack 4.4 L4T 32.4.2

Version NANO-32.3.1 V005, May 29, 2020
    - Fixed login loop issue
    - Added deb packages

Version NANO-32.3.1 V004, May 06, 2020
    - Previous release is broken
    - Quark is not supported.
    - NVME issue is resolved.
    - Fixed install script.

Version NANO-32.3.1 V003, Apr 15, 2020
    - Added support for Quark

Version NANO-32.3.1 V001, Feb 28, 2020
    - Initial release on Jetpack 4.3

Version NANO-32.2.1 V001, Jan 09, 2020
    - Initial release on Jetpack 4.2.2

Version 300, September 11, 2019
    - Initial Release for the Nano
 
================================================================================
            Contacting Connect Tech
================================================================================
     If you have any problems, questions or suggestions regarding the
       Board Support Package and hardware, please feel free to contact
    Connect Tech Inc.

       Connect Tech can be reached in a variety of ways:

          TEL:    1 519 836 1291 or 1-800-426-8979 in North America
           FAX:     1 519 836 4878
           Email:
                   Sales:      sales@connecttech.com

              Tech Support:   support@connecttech.com

          Web:     http://www.connecttech.com

    Be sure to check the support section of our home page for answers to
       technical questions at http://www.connecttech.com.
       Also be sure to browse the knowledge data base.
    If you don't find what you are looking for, please contact the
    support department and let us know. We will be glad to help you.
================================================================================
