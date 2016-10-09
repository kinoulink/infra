#!/bin/bash

KTV_STACK=$1

source ./stacks/$1/vars.sh

docker-compose -p $1 -f ./stacks/$1/docker-compose.yml ${@:2}
