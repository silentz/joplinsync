#!/bin/bash

# create webdav user
USERNAME=$(cat $WEBDAV_USERNAME_FILE)
PASSWORD=$(cat $WEBDAV_PASSWORD_FILE)
htpasswd -bc /etc/nginx/htpasswd $USERNAME $PASSWORD

# copy server crt and key
cp $NGINX_CRT_FILE /server/keys/server.crt
cp $NGINX_KEY_FILE /server/keys/server.key

# run server
chown -R www-data:www-data /server/files
nginx -g 'daemon off;'
