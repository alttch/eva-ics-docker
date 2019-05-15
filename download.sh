#!/bin/sh

REPO=https://get.eva-ics.com

if [ "x$1" = "x--test" ]; then
  REPO=https://test.eva-ics.com
fi

VER=`curl -s ${REPO}/update_info.json|jq -r .version`
BUILD=`curl -s ${REPO}/update_info.json|jq -r .build`

rm -f build/eva-dist.tgz
rm -f run/eva-dist.tgz

wget ${REPO}/${VER}/stable/eva-${VER}-${BUILD}.tgz -O build/eva-dist.tgz || exit 1
cp -v build/eva-dist.tgz run/
