#!/bin/bash

USERNAME=webdav_user
PASSWORD=$(dd if=/dev/urandom of=/dev/stdout \
              bs=16 count=1 status=none |  hexdump -ve '1/1 "%.2x"')

htpasswd -bc /etc/nginx/htpasswd $USERNAME $PASSWORD

echo "Username: $USERNAME"
echo "Password: $PASSWORD"

chown -R www-data:www-data /bucket/files
nginx -g 'daemon off;'
