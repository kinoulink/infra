#!/bin/bash

KTV_STACK=$1

source ./stacks/$1/vars.sh

DOCKER_HOST=$DOCKER_HOST docker-compose -p $1 -f ./stacks/$1/docker-compose.yml ${@:2}
