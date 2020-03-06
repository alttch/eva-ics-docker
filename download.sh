#!/bin/sh -e

REPO=https://get.eva-ics.com

if [ "x$1" = "x--test" ]; then
  REPO=https://test.eva-ics.com
fi

VER=`curl -sL ${REPO}/update_info.json|jq -r .version`
BUILD=`curl -sL ${REPO}/update_info.json|jq -r .build`

echo -n ${VER}-${BUILD} > eva_build

rm -f build/eva-dist.tgz
rm -f run/eva-dist.tgz

wget ${REPO}/${VER}/nightly/eva-${VER}-${BUILD}.tgz -O build/eva-dist.tgz
cp -vf build/eva-dist.tgz run/
