#!/usr/bin/env bash

git pull

source ./bin/functions.sh

k_docker_build manager rsync
k_docker_build manager backoffice

k_docker_build public mysql
k_docker_build public server