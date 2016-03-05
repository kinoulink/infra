build:
	docker build --rm -t bizlunch/api-app app
	docker build --rm -t bizlunch/api-search search
	docker build --rm -t bizlunch/messenger messenger
	docker build --rm -t bizlunch/webapp web

up:
	docker-compose -p public -f docker-compose.yml up -d --force-recreate
	docker-compose -p public logs

machine/create/preprod:
	#docker-machine rm bizlunch-api-preprod -f

	docker-machine --debug create \
					--amazonec2-access-key "$(AWS_ACCESS_KEY_ID)" \
					--amazonec2-secret-key "$(AWS_SECRET_ACCESS_KEY)" \
					--amazonec2-instance-type "t2.medium" \
					--amazonec2-ssh-user "bizlunch" \
					--amazonec2-security-group "dev" \
					--amazonec2-region "eu-west-1" \
					--amazonec2-vpc-id "vpc-33dda556" \
					--amazonec2-subnet-id "subnet-1f0a267a" \
					--driver "amazonec2" \
					bizlunch-public-preprod

dev/start:
	docker-machine start bizlunch

	eval "$$(docker-machine env bizlunch)"

	sleep 2

	docker rm -f $$(docker ps -aq)

dev/symlinks:
	docker-machine ssh bizlunch "   mkdir /var/bizlunch && \
									cd /var/bizlunch && \
                                    ln -s /Users/tom/www/bizlunch/api       api && \
                                    ln -s /Users/tom/www/bizlunch/infra     infra && \
                                    ln -s /Users/tom/www/bizlunch/webapp    webapp && \
                                    ln -s /Users/tom/www/bizlunch/chat      messenger"

machine/set/preprod:
	eval "$$(docker-machine env bizlunch-api-preprod)"

init:
	docker exec api php /var/www/bin/console dev import:data user
	docker exec api php /var/www/bin/console dev es:import