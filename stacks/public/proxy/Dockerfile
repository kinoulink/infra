FROM kinoulink/nginx

RUN cd /tmp && \
	wget https://github.com/jwilder/docker-gen/releases/download/0.7.0/docker-gen-linux-amd64-0.7.0.tar.gz && \
	tar xvzf docker-gen-linux-amd64-0.7.0.tar.gz && \
	mv docker-gen /usr/local/bin/docker-gen && \
	chmod +x /usr/local/bin/docker-gen

ADD service/gen             /etc/service/gen
ADD service/nginx/config    /etc/service/nginx/config

WORKDIR /var/www