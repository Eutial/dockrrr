FROM ubuntu:18.04

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
EXPOSE 8089
ENTRYPOINT [ "./mtproto-proxy",\
"-u", "nobody", \
"-p", "8089", \
"--aes-pwd", "proxy-secret", \
"proxy-multi.conf", \
"-M", "1"]