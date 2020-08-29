FROM alpine:latest
LABEL maintainer="dev@ebon.network"
LABEL aria2_version="1.35.0"

RUN apk update && apk add --no-cache \
    aria2 \
    && mkdir -p /aria2/downloads \
    && mkdir -p /aria2/conf \
    && touch /aria2/conf/aria2.session

COPY aria2.conf /aria2/conf/aria2.conf

EXPOSE 6800

CMD ["aria2c", "--conf-path=/aria2/conf/aria2.conf"]