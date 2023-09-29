FROM ubuntu:20.04

# setup timezone
RUN ln -s /usr/share/zoneinfo/UTC /etc/localtime

# install deps
RUN apt update -y && \
    apt install -y bsdmainutils \
                   apache2-utils \
                   nginx \
                   nginx-extras \
                   libnginx-mod-http-dav-ext \
                   openssl

# init structure
WORKDIR /server
RUN mkdir -p /server/keys
RUN mkdir -p /server/files

# generate ssl certificates
RUN openssl genrsa 8192 > /server/keys/server.key
RUN openssl req -new -x509 -subj "/C=US" \
                -key /server/keys/server.key > /server/keys/server.crt

# copy nginx config
COPY ./nginx/webdav.conf /etc/nginx/sites-available/default

# copy entrypoint script
COPY ./scripts/entrypoint.sh ./entrypoint.sh
