#!/usr/bin/env bash

echo "export LC_ALL=en_US.UTF-8" >> ~/.bashrc
echo "export LC_ALL=en_US.UTF-8" >> ~/.profile
echo "export BZ_ROOT=/var/bizlunch/" >> /.profile

export LC_ALL=en_US.UTF-8

sudo su

apt-get update

apt-get install -y htop wget curl make git

chown ubuntu:ubuntu /var/bizlunch

echo "LC_ALL=en_US.UTF-8" >> /etc/default/locale
echo "export LC_ALL=en_US.UTF-8" >> /root/.bashrc

