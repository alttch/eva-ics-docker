#!/bin/sh

cd /opt || exit 1
tar xzvf eva-dist.tgz || exit 1
find . -type d -name "eva*" -maxdepth 1 -exec mv -f {} eva \; || exit 1
cd eva || exit 1
echo "SYSTEM_NAME=eva_changeme" > ./etc/eva_config
PIP_EXTRA_OPTIONS="-i https://pub.lab.altt.ch/mirror/pypi/musl-x86_64/local" \
  MASTERKEY=mchangeme DEFAULTKEY=dchangeme VENV_CONFIG=/venv.yml \
  bash -x ./easy-setup -p all --link --cloud-manager --auto || exit 1
rm -f ./log/*

./sbin/eva-tinyapi -C sfa -F destroy_user u=operator || exit 1
./sbin/eva-tinyapi -C sfa -F destroy_key i=operator || exit 1
./sbin/eva-tinyapi -C sfa -F save || exit 1

./sbin/eva-control stop || exit 1

for p in uc lm sfa; do
  AUTO_PREFIX=1 ./sbin/eva-registry-cli delete data/${p}/boot-id || exit 8
  AUTO_PREFIX=1 ./sbin/eva-registry-cli \
    set-field config/${p}/main server/log-stdout true -p boolean > /dev/null || exit 8
  AUTO_PREFIX=1 ./sbin/eva-registry-cli \
    set-field config/${p}/service stdout /proc/1/fd/1 > /dev/null || exit 8
  AUTO_PREFIX=1 ./sbin/eva-registry-cli \
     set-field config/${p}/service stderr /proc/1/fd/2 > /dev/null || exit 8
done
./sbin/eva-registry-cli purge || exit 8
./sbin/registry-control stop || exit 1
find ./runtime/registry -name "*.bak[0-9]*.jsonc" -exec rm -f {} \;
rm -f ./easy-setup
exit 0
