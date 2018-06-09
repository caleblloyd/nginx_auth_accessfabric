FROM ubuntu:18.04 AS build

RUN mkdir -p /opt/nginx
WORKDIR /opt/nginx
COPY / /opt/nginx/nginx_auth_accessfabric

RUN apt-get update && \
    apt-get install -y \
        curl \
        gcc \
        libcurl4-openssl-dev \
        libjansson-dev \
        libpcre3-dev \
        libssl-dev \
        make \
        openssl \
        zlib1g-dev

ENV LIBXJWT_VERSION="1.0.2"
ENV LIBXJWT_INST_DIR="/opt/local-libxjwt"
RUN curl -SsL -o "libxjwt-${LIBXJWT_VERSION}.tar.gz" "https://github.com/ScaleFT/libxjwt/releases/download/v${LIBXJWT_VERSION}/libxjwt-${LIBXJWT_VERSION}.tar.gz" \
    && tar -xzf "libxjwt-${LIBXJWT_VERSION}.tar.gz" \
    && cd "libxjwt-${LIBXJWT_VERSION}" \
    && ./configure \
    && make \
    && make DESTDIR="${LIBXJWT_INST_DIR}" install

ENV LIBXJWT_INC="${LIBXJWT_INST_DIR}/usr/local/include"
ENV LIBXJWT_LIB="${LIBXJWT_INST_DIR}/usr/local/lib"

ENV NGINX_VERSION="1.14.0"
RUN curl -SsL -o "nginx-${NGINX_VERSION}.tar.gz" "http://nginx.org/download/nginx-${NGINX_VERSION}.tar.gz" \
    && tar -xzf "nginx-${NGINX_VERSION}.tar.gz" \
    && cd "nginx-${NGINX_VERSION}" \
    && ./configure --add-dynamic-module=../nginx_auth_accessfabric \
    && make \
    && make install
