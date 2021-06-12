#!/bin/sh

cd /opt

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh /dev/stdin -y
source $HOME/.cargo/env
tar xzvf eva-dist.tgz || exit 1
find . -type d -name "eva*" -maxdepth 1 -exec mv -f {} eva \;
cd eva
echo "SYSTEM_SITE_PACKAGES=1" > /etc/venv
echo "SKIP=\"pandas\"" >> /etc/venv
./install/build-venv /
