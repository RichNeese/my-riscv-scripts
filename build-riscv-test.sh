#!/bin/bash
sudo rm -rf build

# uncommet the branch you want to use

git clone --depth 1 -b starfive-v1-testing https://github.com/RichNeese/build.git

mkdir build/userpatches

cat > build/userpatches/config-desktop-riscv.conf << DELIM
# Read build script documentation https://docs.armbian.com/Developer-Guide_Build-Options/
# for detailed explanation of these options and for additional options not listed here

KERNEL_CONFIGURE="NO"                   # leave empty to select each time, set to "yes" or "no" to skip dialog prompt
CLEAN_LEVEL="make,debs"                 # comma-separated list of clean targets: "make" = make clean for selected kernel and u-boot,
                                        # "debs" = delete packages in "./output/debs" for current branch and family,
                                        # "alldebs" = delete all packages in "./output/debs", "images" = delete "./output/images",
                                        # "cache" = delete "./output/cache", "sources" = delete "./sources"
                                        # "oldcache" = remove old cached rootfs except for the newest 8 files

DEST_LANG="en_US.UTF-8"                 # en_US.UTF-8

# advanced
EXTERNAL_NEW="prebuilt"                 # compile and install or install prebuilt additional packages
INSTALL_HEADERS=""                      # install kernel headers package

USE_TORRENT="yes"                       # use torrent network for faster toolchain and cache download
CARD_DEVICE=""                          # device name /dev/sdx of your SD card to burn directly to the card when done
COMPRESS_OUTPUTIMAGE="xz,sha,gpg"

ROOTFS_TYPE=ext4                         # ROOTFS_TYPE=etx4/f2fs/btrfs Default=ext4
USE_GITHUB_UBOOT_MIRROR=yes

#REPOSITORY_INSTALL=u-boot,kernel,armbian-config,armbian-firmware
                                         # REPOSITORY_INSTALL= Used to shorten build times.
                                         # Used prebuilt pkgs/bsp
                                         # options: u-boot,kernel,armbian-config,armbian-firmware
NO_APT_CACHER=NO
#BETA=no                                # Beta needed for Beta kernels
SKIP_EXTERNAL_TOOLCHAINS=no             # Disable the pull of External_toolschains

EXPERT=yes                             # EXPERT needed for building CSC Boards/Desktops
BOARD=starfive                          # Board= starfive / nezha.
RELEASE=jammy                             # Release=sid or jammy
BRANCH=current                          # BRANCH=current
BUILD_DESKTOP=yes                       # Comment out or change yes to no to build cli

#DESKTOP_ENVIRONMENT=xfce		# Desktop=supported:icewm/lxqt/mate/xfce
					# DDescktop=CSC:awesome/budgie/cinnamon/enlightenment/gnome/kde-plasma/xmonad

DESKTOP_ENVIRONMENT_CONFIG_NAME=config_base # options config_base more to come

DESKTOP_APPGROUPS_SELECTED="3d-mesa accessabilty app-launcher archivers desktop_tools development disk-tools editors file-share fonts graphics internet multimedia net-tools office pkg-tools printing remote_desktop shells system-info-tools terminals web-dev"
DELIM

cd build

#basic
./compile.sh desktop-riscv