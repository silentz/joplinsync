FROM ubuntu:20.04

# setup timezone
RUN ln -s /usr/share/zoneinfo/UTC /etc/localtime

# install deps
RUN apt update -y && \
    apt install -y git

# init git
RUN git config --global --add safe.directory '*'

# init structure
WORKDIR /gitsync
RUN mkdir -p /gitsync/repo

# copy entrypoint script
COPY ./scripts/entrypoint.sh ./entrypoint.sh
