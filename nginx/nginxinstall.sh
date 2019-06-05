#!/bin/bash
b_dir="/usr/local/src"
ng_dir="/usr/local/src/nginx-1.16.0"

cd $b_dir
tar xf nginx-1.16.0.tar.gz
cd $ng_dir
./configure --user=nginx  --group=nginx --prefix=/usr/local/nginx --with-http_stub_status_module  --with-http_sub_module  --with-http_ssl_module  --with-pcre
#if [$? -ne 0]
#then
#  echo "./configue 发生错误" >> /root/install.log
#  exit 1
#fi
make && make install
#if [$? -ne 0]
#then
#  echo "make && make install 发生错误" >> /root/install.log
#  exit 2
#fi
groupadd -g 66 nginx
useradd -g nginx -u 66 -M -s /sbin/nologin  nginx
