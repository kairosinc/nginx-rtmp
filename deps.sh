#!/bin/bash
RTMP_VERSION=1.1.7
NPS_VERSION=1.9.32.4
NGINX_VERSION=1.9.15

deps=(
    "http://nginx.org/download/nginx-${NGINX_VERSION}.tar.gz"
    "https://github.com/arut/nginx-rtmp-module/archive/v${RTMP_VERSION}.tar.gz"
    # "https://github.com/pagespeed/ngx_pagespeed/archive/v${NPS_VERSION}-beta.tar.gz"
    # "https://dl.google.com/dl/page-speed/psol/${NPS_VERSION}.tar.gz"
    # "https://github.com/simpl/ngx_devel_kit/archive/v0.2.19.tar.gz"
    # "https://github.com/openresty/lua-nginx-module/archive/v0.9.19.tar.gz"
);
target_dirs=(
    "/tmp/nginx"
    "/tmp/nginx-rtmp-module"
    # "/tmp/ngx_pagespeed"
    # "/tmp/ngx_pagespeed/psol"
    # "/tmp/ngx_devel_kit"
    # "/tmp/lua-nginx-module"
);

