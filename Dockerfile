FROM balenalib/armv7hf-debian:sid-build as build
MAINTAINER Stefan Kastenholz <stefan.kastenholz@gmail.com>

RUN install_packages libusb-1.0-0-dev build-essential wget
RUN wget --no-check-certificate -qO - 'https://git.zerfleddert.de/hmcfgusb/releases/hmcfgusb-0.103.tar.gz' | tar xvz
RUN cd hmcfgusb-* && make

FROM balenalib/armv7hf-debian:sid-run

COPY --from=build hmcfgusb-0.103/hmland /usr/local/bin/hmland

EXPOSE 1000

CMD /usr/local/bin/hmland -p 1000 -I
