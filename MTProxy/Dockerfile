FROM ubuntu:18.04
LABEL maintainer="Eutial"

RUN apt-get update && apt-get install -y build-essential \
    libssl-dev \
    zlib1g-dev \
    curl \
    git \
    && rm -rf /var/lib/apt/lists/* \
    && git clone https://github.com/TelegramMessenger/MTProxy \
    && cd MTProxy \
    && make \
    && cd objs/bin \
    && curl -s https://core.telegram.org/getProxySecret -o proxy-secret \
    && curl -s https://core.telegram.org/getProxyConfig -o proxy-multi.conf

WORKDIR /MTProxy/objs/bin
EXPOSE 8888 443
ENTRYPOINT [ "./mtproto-proxy",\
"-u", "nobody", \
"-H", "443", \
"-p", "8888", \
"--aes-pwd", "proxy-secret", \
"proxy-multi.conf", \
"-M", "1"]