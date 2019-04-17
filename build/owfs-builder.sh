#!/bin/sh

cd /opt

wget https://github.com/owfs/owfs/releases/download/v3.2p1/owfs-3.2p1.tar.gz
tar xzvf owfs-3.2p1.tar.gz
cd owfs-3.2p1
./configure --prefix=/usr \
      "--disable-owtcl" \
      "--disable-owphp" \
      "--disable-owpython" \
      "--disable-zero" \
      "--disable-owshell" \
      "--disable-owhttpd" \
      "--disable-owftpd" \
      "--disable-owserver" \
      "--disable-owperl" \
      "--disable-owtcl" \
      "--disable-owtap" \
      "--disable-owmon" \
      "--disable-owexternal"
make
make install
