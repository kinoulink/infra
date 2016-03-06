#!/usr/bin/env bash

# Usage: "bootstrap.sh /Users/toto/bizlunch

TARGET_DIR=$1

if [ -d "$TARGET_DIR" ]; then
	echo "<!> $TARGET_DIR already exists! <!>"
    exit 0
fi

mkdir $TARGET_DIR

cd $TARGET_DIR

git clone git@github.com:bizlunch/infra.git
git clone git@github.com:bizlunch/test.git
git clone git@github.com:bizlunch/website.git

git clone git@bitbucket.org:bizlunch/webapp.git
git clone git@bitbucket.org:bizlunch/api.git
git clone git@bitbucket.org:bizlunch/chat.git

cd infra/stacks/public

vagrant up

exit 1

#sudo echo "192.168.69.100 api.local.bizlunch.fr local.bizlunch.fr messenger.local.bizlunch.fr webapp.local.bizlunch.fr" >> /etc/hosts
