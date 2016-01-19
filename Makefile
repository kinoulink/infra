sync:
	rsync

docker/dev-machine/create:
	docker-machine create --virtualbox-cpu-count 4 --virtualbox-memory 4096 --driver virtualbox  bizlunch

docker/dev-machine/start:
	docker-machine start bizlunch

	eval "$$(docker-machine env bizlunch)"

	docker-machine ssh bizlunch "   mkdir /var/bizlunch && \
									cd /var/bizlunch && \
                                    ln -s /Users/tom/www/bizlunch/api       api && \
                                    ln -s /Users/tom/www/bizlunch/infra     infra && \
                                    ln -s /Users/tom/www/bizlunch/webapp    webapp && \
                                    ln -s /Users/tom/www/bizlunch/chat      messenger"

docker/dev-machine/stop:
	docker-machine stop bizlunch

docker/build/base-images:
	docker build --rm -t bizlunch/base base-images/base
	docker build --rm -t bizlunch/java base-images/java
	docker build --rm -t bizlunch/elasticsearch base-images/java+elasticsearch
	docker build --rm -t bizlunch/mongodb base-images/mongodb
	docker build --rm -t bizlunch/nginx base-images/nginx
	docker build --rm -t bizlunch/nginx_php base-images/nginx+php

docker/cacher/start:
	docker build -t bizlunch/apt-cacher base-images/apt-cacher

	docker run -d -p 3142:3142 \
					--name apt-cacher-ng \
					-h apt-cacher-ng \
					bizlunch/apt-cacher

init/hosts:
	echo "192.168.99.100 api.local.bizlunch.fr webapp.local.bizlunch.fr local.bizlunch.fr messenger.local.bizlunch.fr" >> /etc/hosts
