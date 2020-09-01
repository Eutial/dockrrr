FROM node:lts

LABEL maintainer="dev@ebon.network"

RUN apt-get update && apt-get install -y \
    bluetooth \
    bluez \
    libbluetooth-dev \
    libudev-dev \
    && rm -rf /var/lib/apt/lists/* \
    && npm set global-style=true \
    && npm set package-lock=false \
    && npm set audit=false \ 
    && npm set fund=false \
    && mkdir /homebridge

RUN npm install -g --unsafe-perm homebridge

WORKDIR /homebridge
VOLUME /homebridge

COPY startup.sh .

CMD ["bash", "startup.sh"]