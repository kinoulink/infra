#!/usr/bin/env bash

sudo yum install -y nfs-utils

sudo mkdir -p /opt/ktv/shares/infra /opt/ktv/shares/app

sudo mount -t nfs4 -o nfsvers=4.1 $(curl -s http://169.254.169.254/latest/meta-data/placement/availability-zone).fs-328570fb.efs.eu-west-1.amazonaws.com:/ /opt/ktv/shares/infra

sudo mount -t nfs4 -o nfsvers=4.1 $(curl -s http://169.254.169.254/latest/meta-data/placement/availability-zone).fs-5785709e.efs.eu-west-1.amazonaws.com:/ /opt/ktv/shares/app

sudo chown -R ec2-user:ec2-user /opt/ktv/shares