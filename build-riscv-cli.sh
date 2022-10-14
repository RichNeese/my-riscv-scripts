#!/bin/bash
sudo rm -rf build

# uncommet the branch you want to use
git clone -b risc-v https://github.com/150balbes/build.git

mkdir build/userpatches

cat > build/userpatches/config-cli.conf << DELIM
# Read build script documentation https://docs.armbian.com/Developer-Guide_Build-Options/
# for detailed explanation of these options and for additional options not listed here

KERNEL_ONLY="NO"                        # leave empty to select each time, set to "yes" or "no" to skip dialog prompt
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
LIB_TAG="risc-v"                        # change to "branchname" to use any branch currently available.
USE_TORRENT="yes"                       # use torrent network for faster toolchain and cache download
CARD_DEVICE=""                          # device name /dev/sdx of your SD card to burn directly to the card when done
COMPRESS_OUTPUTIMAGE="xz,sha,gpg"

ROOTFS_TYPE=ext4                         # ROOTFS_TYPE=ext2/ext3/etx4/f2fs/btrfs Default=ext4
USE_GITHUB_UBOOT_MIRROR=yes
                                         # REPOSITORY_INSTALL= Used to shorten build times.
                                         # Used prebuilt pkgs/bsp
                                         # options: u-boot,kernel,armbian-config,armbian-firmware
#REPOSITORY_INSTALL=u-boot,kernel,armbian-config,armbian-firmware

#BETA=no                                 # Beta needed for Beta kernels
SKIP_EXTERNAL_TOOLCHAINS=no              # Disable the pull of External_toolschains
#SUBREVISION=                            # add custom name on to file
BOARD=starfive                           # Board= Starfive or nezha.
RELEASE=sid                              # Release=debian:bullseye/sid ubunt:focal/jammy
BRANCH=current                           # BRANCH=current/edge
BUILD_DESKTOP=no                         # Comment out or change yes to no to build cli

DELIM

cat > build/userpatches/lib.config << DELIM
NO_APT_CACHER=yes
APT_PROXY_ADDR=206.82.251.133:3142
NO_HOST_RELEASE_CHECK=yes
DELIM

cd build
./compile.sh cli