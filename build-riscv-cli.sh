#!/bin/bash
sudo rm -rf RISCVbian

# uncommet the branch you want to use
git clone --depth 1 git clone --depth 1 -b starfive-v1-testing https://github.com/RichNeese/build.git

cd RISCVbian
./compile.sh cli
