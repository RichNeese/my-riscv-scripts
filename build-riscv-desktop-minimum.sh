#!/bin/bash
sudo rm -rf build

# uncommet the branch you want to use
git clone --depth 1 git clone --depth 1 -b starfive-v1-testing https://github.com/RichNeese/build.git

cd build
./compile.sh desktop-minimum
