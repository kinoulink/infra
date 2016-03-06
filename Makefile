sync:
	rsync . ubuntu@dev.bizlunch.private:/var/bizlunch/infra -advr  \
	        --exclude=.git \
	        --exclude=.idea

docker/build/images:
	./bin/docker/build base-images base
	./bin/docker/build base-images java
	./bin/docker/build base-images elasticsearch
	./bin/docker/build base-images mongodb
	./bin/docker/build base-images nginx
	./bin/docker/build base-images nginx_php

	./bin/docker/build stacks/public api
	./bin/docker/build stacks/public messenger
	./bin/docker/build stacks/public search
	./bin/docker/build stacks/public webapp

docker/cacher/start:
	docker build --rm -t bizlunch/apt-cacher base-images/apt-cacher

	docker run -d -p 3142:3142 \
					--name apt-cacher-ng \
					-h apt-cacher-ng \
					bizlunch/apt-cacher
