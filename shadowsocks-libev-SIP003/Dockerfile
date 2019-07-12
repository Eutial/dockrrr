FROM alpine:latest as obfs-builder
RUN apk add --no-cache git \
  asciidoc \
  autoconf \
  automake \
  build-base \
  g++ \
  gcc \
  libev-dev \
  libpcre32 \
  libtool \
  linux-headers \
  make \
  openssl \
  xmlto \
  zlib-dev
RUN git clone https://github.com/shadowsocks/simple-obfs.git \
  && cd simple-obfs \
  && git submodule update --init --recursive \
  && ./autogen.sh \
  && ./configure \
  && make

FROM alpine:latest as shadowsocks-builder
RUN apk add --no-cache \
  asciidoc \
  autoconf \
  automake \
  build-base \
  c-ares-dev \
  git \
  libev-dev \
  libtool \
  libsodium-dev \
  linux-headers \
  mbedtls-dev \
  pcre-dev \
  xmlto

RUN git clone https://github.com/shadowsocks/shadowsocks-libev.git \
  && cd shadowsocks-libev \
  && git submodule update --init --recursive \
  && ./autogen.sh \
  && ./configure \
  && make

FROM alpine:latest
COPY --from=shadowsocks-builder /shadowsocks-libev/src/ss-server /usr/bin/ss-server
COPY --from=obfs-builder /simple-obfs/src/obfs-server /usr/bin/obfs-server
RUN apk add --no-cache libev \
    libsodium \
    mbedtls \
    pcre \
    c-ares \
    haveged
WORKDIR /etc/shadowsocks-libev
CMD [ "ss-server", "-c", "/etc/shadowsocks-libev/config.json" ]