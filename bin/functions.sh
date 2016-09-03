#!/usr/bin/env bash

: ${K_ROOT:=/opt/ktv/shares/}

source ${K_ROOT}config_host.sh

export K_ENV
export K_ROOT
export LC_ALL=en_US.UTF-8

alias dc="docker-compose"
alias d="docker"
#alias git="docker run -v $(pwd):/root/work --rm samueldebruyn/debian-git git"

function k_docker_shell()
{
	if [ "$#" -ne 1 ]; then
	    echo "Illegal number of parameters"
	fi

	docker exec -ti $1 bash
}

function k_docker_build()
{
	if [ "$#" -ne 2 ]; then
	    echo "Illegal number of parameters"
	    return -1
	fi

	docker build --rm -t ktv_$2 ${K_ROOT}infra/stacks/$1/$2

	docker tag ktv_$2:latest 252343880797.dkr.ecr.eu-west-1.amazonaws.com/ktv_$2:latest

	docker push 252343880797.dkr.ecr.eu-west-1.amazonaws.com/ktv_$2:latest
}

function k_docker_build_base_images()
{
	k_docker_build base-images base
	k_docker_build base-images apt-cacher
	k_docker_build base-images mongodb
	k_docker_build base-images nginx
	k_docker_build base-images nginx_php
}

function k_slack_message()
{
	payload="payload={\"channel\": \"#$1\", \"username\": \KinouBot\", \"text\": \"$2\"}"

#	curl -X POST --data-urlencode "${payload}" https://hooks.slack.com/services/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
}

function k_rollbar_version()
{
	echo "<!> Not implemented yet <!>"
#	curl -X POST  https://api.rollbar.com/api/1/deploy/ \
#	  -F access_token=66106d0d8b7040ecaa833bda301f8814 \
#	  -F environment=$1 \
#	  -F revision=$2 \
#	  -F local_username=grunt
}