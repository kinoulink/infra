#!/usr/bin/env bash

export LC_ALL=en_US.UTF-8

apt-get update

apt-get install -y htop wget curl make git

adduser --disabled-password --gecos "" kinoulink

usermod -a -G sudo kinoulink
usermod -a -G www-data kinoulink

echo %kinoulink ALL=NOPASSWD:ALL > /etc/sudoers.d/kinoulink
chmod 0440 /etc/sudoers.d/kinoulink

chown kinoulink /var/kinoulink

echo "LC_ALL=en_US.UTF-8" >> /etc/default/locale
echo "export LC_ALL=en_US.UTF-8" >> /root/.bashrc