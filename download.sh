#!/bin/bash -e

REPO=https://get.eva-ics.com

if [ "$1" = "--test" ]; then
  REPO=https://test.eva-ics.com
fi

VER=`curl -sL ${REPO}/update_info.json|jq -r .version`
BUILD=`curl -sL ${REPO}/update_info.json|jq -r .build`

echo -n ${VER}-${BUILD} > eva_build

rm -f build/eva-dist.tgz
rm -f run/eva-dist.tgz

wget ${REPO}/${VER}/nightly/eva-${VER}-${BUILD}.tgz -O eva-dist.tgz || exit 1
wget ${REPO}/${VER}/nightly/update-${BUILD}.sh -O update-script || exit 1

echo "Downloaded EVA ICS ${VER} ${BUILD}"

#source <(tar xvf build/eva-dist.tgz --wildcards "eva-*/lib/eva/registry/info" -O)

#if [ -z "$YEDB_VERSION" ]; then
  #echo "Unable to get YEDB version"
#fi

#wget ${REPO}/yedb/yedb-${YEDB_VERSION}-x86_64-musl.tar.gz -O run/yedb.tgz
