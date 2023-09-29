FROM ubuntu:20.04

RUN ln -s /usr/share/zoneinfo/UTC /etc/localtime

RUN apt update -y && \
    apt install -y bsdmainutils apache2-utils \
                   nginx nginx-extras \
                   libnginx-mod-http-dav-ext

COPY webdav.conf /etc/nginx/sites-available/default

WORKDIR /bucket
RUN mkdir -p /bucket/files
COPY entrypoint.sh ./entrypoint.sh
