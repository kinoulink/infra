sync:
	rsync . ubuntu@dev.bizlunch.private:/var/bizlunch/infra -advr  \
	        --exclude=.git \
	        --exclude=.idea

docker/dev-machine/create:
	docker-machine create --virtualbox-cpu-count 4 --virtualbox-memory 4096 --driver virtualbox  bizlunch

docker/dev-machine/stop:
	docker-machine stop bizlunch

docker/build/images:
	./bin/docker_build base-images base
	./bin/docker_build base-images java
	./bin/docker_build base-images elasticsearch
	./bin/docker_build base-images mongodb
	./bin/docker_build base-images nginx
	./bin/docker_build base-images nginx_php

	./bin/docker_build stacks/public api
	./bin/docker_build stacks/public messenger
	./bin/docker_build stacks/public search
	./bin/docker_build stacks/public webapp

docker/cacher/start:
	docker build --rm -t bizlunch/apt-cacher base-images/apt-cacher

	docker run -d -p 3142:3142 \
					--name apt-cacher-ng \
					-h apt-cacher-ng \
					bizlunch/apt-cacher

init/hosts:
	echo "192.168.99.100 api.local.bizlunch.fr webapp.local.bizlunch.fr local.bizlunch.fr messenger.local.bizlunch.fr" >> /etc/hosts
