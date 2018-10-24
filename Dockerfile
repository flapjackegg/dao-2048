# Using a compact OS
FROM daocloud.io/nginx:1.11-alpine

MAINTAINER Golfen Guo <golfen.guo@daocloud.io>

# Add 2048 stuff into Nginx server
COPY . /usr/share/nginx/html

EXPOSE 4000
EXPOSE 80

# Start Nginx and keep it running background and start php
CMD sed -i "s/ContainerID: /ContainerID: "$(hostname)"/g" /usr/share/nginx/html/index.html &&\
#	   	sed -i '0,/title/ s/80/4000/' /etc/nginx/conf.d/default.conf &&\
	   	nginx -g "daemon off;"
