#!/bin/bash
sudo rm -rf RISCVbian

# uncommet the branch you want to use
git clone --depth 1https://github.com/150balbes/RISCVbian.git

mkdir RISCVbian/userpatches

cat > RISCVbian/userpatches/lib.config << DELIM
NO_APT_CACHER=yes
#APT_PROXY_ADDR=206.82.251.133:3142
#NO_HOST_RELEASE_CHECK=yes
DELIM

cd RISCVbian
./compile.sh desktop-minimum
