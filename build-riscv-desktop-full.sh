#!/bin/bash
sudo rm -rf RISCVbian

# uncommet the branch you want to use
git clone --depth 1 -b starfive-v1-testing https://github.com/RichNeese/build.git

mkdir RISCVbian/userpatches

cd RISCVbian
./compile.sh desktop-full
