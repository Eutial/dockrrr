FROM alpine:latest as builder

LABEL maintainer "Kaesarine"

RUN apk add --no-cache git \
    gcc \
    autoconf \
    make \
    libtool \
    automake \
    zlib-dev \
    openssl \
    asciidoc \
    xmlto \
    libpcre32 \
    libev-dev \
    g++ \
    linux-headers

RUN git clone https://github.com/shadowsocks/simple-obfs.git \
    && cd simple-obfs \
    && git submodule update --init --recursive \
    && ./autogen.sh \
    && ./configure \
    && make

FROM alpine:latest
EXPOSE 443

COPY --from=builder /simple-obfs/src/obfs-server /usr/bin/obfs-server

RUN apk add --no-cache libev-dev

WORKDIR /etc/simple-obfs

CMD [ "obfs-server", "-c", "/etc/simple-obfs/config.json" ]