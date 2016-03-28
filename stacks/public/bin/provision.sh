#!/usr/bin/env bash

cd /var/kinoulink/infra

sh bin/provisioning/base.sh

sh bin/provisioning/docker.sh

echo "
172.31.2.52 dev.kinoulink.private
172.31.2.52 prod.kinoulink.private
" >> /etc/hosts

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

