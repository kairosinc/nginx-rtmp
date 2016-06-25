#!/bin/bash
set -ex

cd /tmp/nginx
./configure --prefix=/usr/share/nginx --conf-path=/etc/nginx/nginx.conf --sbin-path=/usr/sbin \
  --http-log-path=/var/log/nginx/access.log --error-log-path=/var/log/nginx/error.log \
  --lock-path=/var/lock/nginx.lock --pid-path=/run/nginx.pid \
  --http-client-body-temp-path=/tmp/body \
  --http-fastcgi-temp-path=/tmp/fastcgi \
  --http-proxy-temp-path=/tmp/proxy \
  --http-scgi-temp-path=/tmp/scgi \
  --http-uwsgi-temp-path=/tmp/uwsgi \
  --with-pcre-jit --with-ipv6 --with-http_ssl_module \
  --with-http_realip_module \
  --with-http_addition_module \
  --add-module=/tmp/nginx-rtmp-module
#  --with-http_stub_status_module
# --with-http_dav_module --with-http_geoip_module \
#  --with-http_gzip_static_module --with-http_image_filter_module \
#  --with-http_spdy_module --with-http_sub_module --with-http_xslt_module \#  --add-module=/tmp/ngx_pagespeed
#  --with-mail --with-mail_ssl_module --with-debug \
#  --add-module=/tmp/ngx_devel_kit \
#  --with-ld-opt="-Wl,-rpath,/usr/bin/luajit" \
#  --add-module=/tmp/lua-nginx-module

make -s -j $(cat /proc/cpuinfo | grep processor | wc -l) && make install

# copy rtmp stats template
cp /tmp/nginx-rtmp-module/stat.xsl /usr/share/nginx/html/