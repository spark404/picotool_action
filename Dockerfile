FROM ubuntu:latest

ENV DEBIAN_FRONTEND="noninteractive" TZ="Europe/Amsterdam"

RUN apt-get update -y
RUN apt-get install -y build-essential ninja-build gcc-arm-none-eabi git cmake libusb-1.0-0-dev pkg-config

RUN git clone https://github.com/raspberrypi/pico-sdk.git
ENV PICO_SDK_PATH=/pico-sdk

COPY build-picotool.sh /build-picotool.sh
RUN /build-picotool.sh


FROM ubuntu:latest
ENV DEBIAN_FRONTEND="noninteractive" TZ="Europe/Amsterdam"
RUN apt-get update -y
RUN apt-get install -y libusb-1.0-0
COPY --from=0 /picotool/build/picotool /usr/bin

ENTRYPOINT ["/usr/bin/picotool"]
