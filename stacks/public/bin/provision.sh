#!/usr/bin/env bash

cd /var/kinoulink/infra

sh bin/provisioning/base.sh

sh bin/provisioning/docker.sh

mkdir -p /data/media

mount.cifs //kinoulink.file.core.windows.net/media-${K_ENV} /data/media -o "vers=3.0,"

su kinoulink  << EOF

	mkdir ~/.ssh

	echo "
source /var/kinoulink/infra/stacks/public/bin/functions.sh
	" >> ~/.bashrc

	echo "
Host *.cloudapp.net
    User kinoulink
    IdentityFile /var/kinoulink/id_rsa
	" > ~/.ssh/config
EOF

source /var/kinoulink/infra/stacks/public/bin/functions.sh

k_docker_build_base_images

k_docker_build_images

