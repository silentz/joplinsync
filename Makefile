SHELL := /bin/bash
.PHONY: all webdav nginx

all: webdav nginx git

webdav:
	mkdir -p ./secrets
	echo "webdav_user" > ./secrets/webdav_username.txt
	dd if=/dev/urandom of=/dev/stdout bs=16 count=1 status=none \
		|  hexdump -ve '1/1 "%.2x"' \
		> ./secrets/webdav_password.txt

nginx:
	mkdir -p ./secrets
	openssl genrsa 8192 > ./secrets/server.key
	openssl req -new -x509 -subj "/C=US" \
                -key ./secrets/server.key > ./secrets/server.crt

git:
	mkdir -p ./secrets
	openssl genrsa 4096 > ./secrets/git.key
	openssl rsa -in ./secrets/git.key -outform PEM -pubout -out ./secrets/git.pub
