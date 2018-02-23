FROM resin/rpi-raspbian:jessie
MAINTAINER Stefan Kastenholz <stefan.kastenholz@gmail.com>

RUN apt-get update && apt-get install -y libusb-1.0-0-dev build-essential wget && rm -rf /var/lib/apt/lists/*
RUN wget --no-check-certificate -qO - 'https://git.zerfleddert.de/hmcfgusb/releases/hmcfgusb-0.103.tar.gz' | tar xvz
RUN cd hmcfgusb-* && make && mv hmland /usr/local/bin/ && cd .. && rm -r hmcfgusb-*

EXPOSE 1000

CMD /usr/local/bin/hmland -p 1000 -I
