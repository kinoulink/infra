#!/bin/bash

KTV_STACK=$1

source ./stacks/$1/vars.sh

DOCKER_HOST=$DOCKER_HOST docker ${@:2}