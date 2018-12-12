FROM alpine:3.6

RUN apk --no-cache add build-base \
    openssl-dev \
    curl \
    zlib-dev \
    git \
    && git clone https://github.com/TelegramMessenger/MTProxy \
    && cd MTProxy \
    && make \
    && cd objs/bin \
    && curl -s https://core.telegram.org/getProxySecret -o proxy-secret \
    && curl -s https://core.telegram.org/getProxyConfig -o proxy-multi.conf

WORKDIR /MTProxy/objs/bin
EXPOSE 8089
ENTRYPOINT [ "./mtproto-proxy",\
"-u", "nobody", \
"-p", "8089", \
"--aws-pwc", "proxy-secret", \
"proxy-multi.conf", \
"-M", "1"]