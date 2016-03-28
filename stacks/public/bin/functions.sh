#!/usr/bin/env bash

source /var/kinoulink/infra/bin/functions.sh

alias k_api_console="docker exec api php /var/www/bin/console ${K_ENV} "
alias k_api_composer="docker exec api composer "
alias k_api_config="docker exec api php /var/www/bin/console ${K_ENV} config"
alias k_api_php="docker exec -ti api php "

alias k_mongo_shell="docker exec -ti mongo mongo kinoulink"

function k_run()
{
	docker-compose -p public -f docker-compose.yml up -d --force-recreate
	docker-compose -p public logs
}

function k_add_sample_data()
{
	docker exec mongo bash -c "cd /tmp && tar -xzvf /share/dump.tar.gz &&  mongorestore"
	docker exec api php /var/www/bin/console dev es:import
}

function k_dev_rsync()
{
	if [ "$#" -ne 1 ]; then
	    echo "Illegal number of parameters"
	    return -1
	fi

	rsync /var/kinoulink/$1 k-dev.cloudapp.net:/var/kinoulink \
							-advr -e "ssh -o StrictHostKeyChecking=no" \
	                        --exclude=.git --exclude=.idea
}

function k_dev_deploy_webapp()
{
	rsync /var/kinoulink/webapp/gen/builds/src/dev k-dev.cloudapp.net:/var/kinoulink/webapp/gen/builds/src \
							-advr -e "ssh -o StrictHostKeyChecking=no" \
	                        --exclude=.git --exclude=.idea
}

function k_dev_deploy_api()
{
	docker exec api php /var/www/bin/console dev config

	VERSION=$(docker exec api php /var/www/bin/console dev version:bump)

	k_dev_rsync "api"

	k_slack_message "api" "Nouvelle version $VERSION API en dev!"

	k_rollbar_version "dev" ${VERSION}
}

function k_prod_rsync()
{
	if [ "$#" -ne 1 ]; then
	    echo "Illegal number of parameters"
	    return -1
	fi

	rsync /var/kinoulink/$1 ubuntu@prod.kinoulink.private:/var/kinoulink/$1 -advr --exclude=.git --exclude=.idea
}

cd /var/kinoulink