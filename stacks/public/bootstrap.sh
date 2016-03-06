#!/usr/bin/env bash

cd /var/bizlunch/infra

sh bin/provisioning/base.sh

sh bin/provisioning/docker.sh

make docker/build/images