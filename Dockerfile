FROM alpine:3.4
MAINTAINER Jason Rivers <docker@jasonrivers.co.uk>

ENV NGINX_VERSION 1.9.15

RUN	apk update			\
 && apk add				\
		git			    \
		gcc		    	\
		binutils-libs	\
		binutils		\
		gmp			    \
		isl			    \
		libgomp			\
		libatomic		\
		libgcc			\
		openssl			\
		pkgconf			\
		pkgconfig		\
		mpfr3			\
		mpc1			\
		libstdc++		\
		ca-certificates	\
		libssh2			\
		curl			\
		expat			\
		pcre			\
		musl-dev		\
		libc-dev		\
		pcre-dev		\
		zlib-dev		\
		openssl-dev		\
		make            \
 &&	cd /tmp/	        \
 && wget http://nginx.org/download/nginx-${NGINX_VERSION}.tar.gz \
 && git clone https://github.com/arut/nginx-rtmp-module.git \
 && cd /tmp \
 &&	tar xzf nginx-${NGINX_VERSION}.tar.gz \
 &&	cd nginx-${NGINX_VERSION} \
 && ./configure --prefix=/usr/share/nginx  \
                --conf-path=/etc/nginx/nginx.conf \
                --sbin-path=/usr/sbin \
                --http-log-path=/var/log/nginx/access.log \
                --error-log-path=/var/log/nginx/error.log \
                --lock-path=/var/lock/nginx.lock \
                --pid-path=/run/nginx.pid \
                --http-client-body-temp-path=/tmp/body \
                --http-fastcgi-temp-path=/tmp/fastcgi \
                --http-proxy-temp-path=/tmp/proxy \
                --http-scgi-temp-path=/tmp/scgi \
                --http-uwsgi-temp-path=/tmp/uwsgi \
                --with-pcre-jit \
                --with-ipv6 \
                --with-http_ssl_module \
                --with-http_realip_module \
                --with-http_addition_module \
                --add-module=../nginx-rtmp-module \
 &&	make && make install

RUN	cd /etc/ 	&&	\
	tar cvzf /tmp/nginx-rtmp.tar.gz nginx /usr/sbin/nginx

EXPOSE 1935

CMD ["/usr/sbin/nginx", "-g", "daemon off;"]
