#!/bin/sh

cd /opt

tar xzvf eva-dist.tgz || exit 1
find . -type d -name "eva*" -maxdepth 1 -exec mv -f {} eva \;
cd eva
echo "SKIP='pandas'" > /etc/venv
./install/build-venv /
