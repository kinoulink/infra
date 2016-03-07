#!/usr/bin/env bash

cd /var/bizlunch/infra

sh bin/provisioning/base.sh

sh bin/provisioning/docker.sh

echo "
172.31.2.52 dev.bizlunch.private
172.31.2.52 prod.bizlunch.private
" >> /etc/hosts

make docker/build/images

su vagrant  << EOF
	echo "
export LC_ALL=en_US.UTF-8
. /var/bizlunch/infra/stacks/public/bin/functions.sh
cd /var/bizlunch
	" >> ~/.bashrc

	echo "
Host dev.bizlunch.private
    User ubuntu
    IdentityFile /var/bizlunch/id_rsa

Host prod.bizlunch.private
    User ubuntu
    IdentityFile /var/bizlunch/id_rsa
	" >> ~/.ssh/config
EOF

cd stacks/public

make up