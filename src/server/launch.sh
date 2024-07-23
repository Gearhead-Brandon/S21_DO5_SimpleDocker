#!bin/bash

sudo docker run -p 81:81 --name doc nginx

sudo docker cp ./server.c doc:/etc/nginx/
sudo docker cp ./nginx.conf doc:/etc/nginx/

sudo docker exec doc apt-get update

sudo docker exec doc apt-get install -y gcc spawn-fcgi libfcgi-dev

sudo docker exec doc gcc /etc/nginx/server.c -o /etc/nginx/webserver -lfcgi 

sudo docker exec doc spawn-fcgi -p 8080 /etc/nginx/webserver

sudo docker exec doc nginx -s reload

curl localhost:81/