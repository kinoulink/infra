#!/usr/bin/env bash

# Usage: "bootstrap.sh /Users/toto/kinoulink

TARGET_DIR=$1

if [ -d "$TARGET_DIR" ]; then
	echo "<!> $TARGET_DIR already exists! <!>"
    exit 0
fi

mkdir $TARGET_DIR

cd $TARGET_DIR

git clone git@github.com:kinoulink/infra.git
git clone git@github.com:kinoulink/webapp.git
cd infra/stacks/public

vagrant up

exit 1

#sudo echo "192.168.69.101 api.local.kinoulink.fr local.kinoulink.fr messenger.local.kinoulink.fr webapp.local.kinoulink.fr" >> /etc/hosts
