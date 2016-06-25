FROM phusion/baseimage:0.9.18
MAINTAINER cole@kairos.com

RUN echo 'APT::Install-Recommends 0;' >> /etc/apt/apt.conf.d/01norecommends \
 && echo 'APT::Install-Suggests 0;' >> /etc/apt/apt.conf.d/01norecommends \
 && export DEBIAN_FRONTEND=noninteractive \
 && apt-get update -qq \
 && apt-get install -yqq \
    gcc g++ make libc6-dev libpcre++-dev libssl-dev libxslt-dev libgd2-xpm-dev libgeoip-dev \
    perl libssl1.0.0 libxslt1.1 libgd3 libxpm4 libgeoip1 libav-tools \
    vim.tiny curl \
 && apt-get autoremove -y \
 && apt-get clean \
 && apt-get autoclean

# sudo tcpdump net-tools ca-certificates libluajit-5.1-dev

# copy deps and download deps (do not merge with other copies so caching works)
COPY deps.sh /tmp/deps.sh
RUN bash -c 'source /tmp/deps.sh && \
    for ((i=0;i<${#deps[@]};i++)); do \
        url=${deps[$i]}; \
        base=$(basename $url); \
        curl -L $url -o /tmp/$base; \
        mkdir -p ${target_dirs[$i]} && tar -zxf /tmp/$base --strip=1 -C ${target_dirs[$i]}; \
    done'

# copy and run the rest (do not merge with other copies so caching works)
COPY compile.sh /tmp/compile.sh
COPY etc/rc.local /etc/rc.local
RUN chmod +x /tmp/compile.sh \
 && /tmp/compile.sh \
 && chmod +x /etc/rc.local \
 && rm -Rf /tmp/* /var/lib/apt/lists/*;
