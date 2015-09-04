FROM debian:jessie
MAINTAINER Pirmin Tapken <ookami.gnu@gmail.com>
RUN apt-get update && apt-get dist-upgrade -y
ADD https://www.dropbox.com/download?dl=packages/debian/dropbox_2015.02.12_amd64.deb /root/dropbox_2015.02.12_amd64.deb
RUN dpkg -i /root/dropbox_2015.02.12_amd64.deb || apt-get install -f -y
RUN addgroup --gid 1000 user
RUN adduser \
        --home /home/user \
        --shell /bin/bash \
        --no-create-home \
        --uid 1000 \
        --gid 1000 \
        --disabled-password \
        --gecos "" \
        user
RUN mkdir -p /home/user
VOLUME /home/user
USER user
