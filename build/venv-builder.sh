#!/bin/sh

cd /opt

tar xzvf eva-dist.tgz || exit 1
find . -type d -name "eva*" -maxdepth 1 -exec mv -f {} eva \;
cd eva
echo "SYSTEM_SITE_PACKAGES=1" > /etc/venv
echo "SKIP=\"pandas\"" >> /etc/venv
sed -i 's/cryptography==.*/cryptography==3.0/g' /opt/eva/install/mods.list
./install/build-venv /
