FROM alpine:latest
LABEL maintainer="dev@ebon.network"
LABEL aria2_version="1.35.0"

RUN apk update && apk add --no-cache \
    aria2 \
    && mkdir /aria2-downloads \
    && mkdir /aria2

VOLUME /aria2
VOLUME /aria2-downloads

EXPOSE 6800/tcp
EXPOSE 60880/tcp
EXPOSE 60881-60889/udp

CMD aria2c --conf-path=/aria2/aria2.conf
