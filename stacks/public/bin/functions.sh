#!/usr/bin/env bash

: ${BIZLUNCH_ENV:=dev}
: ${BZ_ROOT:=/var/bizlunch/}

alias bz_api_console="docker exec api php /var/www/bin/console ${BIZLUNCH_ENV} "
alias bz_api_config="docker exec api php /var/www/bin/console ${BIZLUNCH_ENV} config"
alias bz_api_php="docker exec -ti api php "

alias bz_mongo_shell="docker exec -ti mongo mongo bizlunch"

function bz_docker_shell()
{
	if [ "$#" -ne 1 ]; then
	    echo "Illegal number of parameters"
	fi

	docker exec -ti $1 bash
}

function bz_docker_build()
{
	if [ "$#" -ne 2 ]; then
	    echo "Illegal number of parameters"
	    return -1
	fi

	docker build --rm -t bizlunch/$2 $1/$2
}

function bz_dev_rsync()
{
	if [ "$#" -ne 1 ]; then
	    echo "Illegal number of parameters"
	    return -1
	fi

	rsync /var/bizlunch/$1 ubuntu@dev.bizlunch.private:/var/bizlunch \
							-advr -e "ssh -o StrictHostKeyChecking=no" \
	                        --exclude=.git --exclude=.idea
}

function bz_dev_deploy_api()
{
	docker exec api php /var/www/bin/console dev config

	VERSION=$(docker exec api php /var/www/bin/console dev version:bump)

	bz_dev_rsync "api"

	bz_slack_message "api" "Nouvelle version $VERSION API en dev!"

	bz_rollbar_version "dev" ${VERSION}
}

function bz_prod_rsync()
{
	if [ "$#" -ne 1 ]; then
	    echo "Illegal number of parameters"
	    return -1
	fi

	rsync /var/bizlunch/$1 ubuntu@prod.bizlunch.private:/var/bizlunch/$1 -advr --exclude=.git --exclude=.idea
}

function bz_slack_message()
{
	payload="payload={\"channel\": \"#$1\", \"username\": \"BizlunchBot\", \"text\": \"$2\"}"

	curl -X POST --data-urlencode "${payload}" https://hooks.slack.com/services/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
}

function bz_rollbar_version()
{
	curl -X POST  https://api.rollbar.com/api/1/deploy/ \
	  -F access_token=66106d0d8b7040ecaa833bda301f8814 \
	  -F environment=$1 \
	  -F revision=$2 \
	  -F local_username=grunt
}

export BIZLUNCH_ENV
export BZ_ROOT