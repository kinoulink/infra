#!/usr/bin/env bash

apt-get install apt-transport-https ca-certificates

apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D

echo "deb https://apt.dockerproject.org/repo ubuntu-trusty main" > /etc/apt/sources.list.d/docker.list

apt-get update

#apt-get install -y linux-image-extra-$(uname -r)

#apt-get install -y apparmor

apt-get install -y docker-engine

usermod -aG docker kinoulink
usermod -aG docker ubuntu

curl -L https://github.com/docker/compose/releases/download/1.6.2/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose

chmod +x /usr/local/bin/docker-compose

echo 'DOCKER_OPTS="--log-driver=syslog --log-opt syslog-address=udp://127.0.0.1:514 --log-opt tag=docker"' >> /etc/default/docker