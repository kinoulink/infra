#!/usr/bin/env bash

export LC_ALL=en_US.UTF-8

apt-get update

apt-get install -y htop wget curl make git

chown ubuntu:ubuntu /var/bizlunch

echo "LC_ALL=en_US.UTF-8" >> /etc/default/locale
echo "export LC_ALL=en_US.UTF-8" >> /root/.bashrc