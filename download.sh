#!/bin/sh

VER=`curl -s https://get.eva-ics.com/update_info.json|jq -r .version`
BUILD=`curl -s https://get.eva-ics.com/update_info.json|jq -r .build`

rm -f build/eva-dist.tgz
rm -f run/eva-dist.tgz

wget https://get.eva-ics.com/${VER}/stable/eva-${VER}-${BUILD}.tgz -O build/eva-dist.tgz || exit 1
cp -v build/eva-dist.tgz run/
