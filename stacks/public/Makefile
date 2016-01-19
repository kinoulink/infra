build:
	docker build --rm -t bizlunch/api-app app
	docker build --rm -t bizlunch/api-search search
	docker build --rm -t bizlunch/messenger messenger

up:
	docker-compose -p bz_api -f docker-compose.yml up -d
	docker-compose -p bz_api logs

machine/create/preprod:
	#docker-machine rm bizlunch-api-preprod -f

	docker-machine create \
					--amazonec2-access-key "$(AWS_ACCESS_KEY_ID)" \
					--amazonec2-secret-key "$(AWS_SECRET_ACCESS_KEY)" \
					--amazonec2-instance-type "t2.medium" \
					--amazonec2-ssh-user "bizlunch" \
					--amazonec2-security-group "dev" \
					--amazonec2-region "eu-west-1" \
					--amazonec2-vpc-id "vpc-33dda556" \
					--amazonec2-subnet-id "subnet-1f0a267a" \
					--driver "amazonec2" \
					bizlunch-api-preprod

machine/set/preprod:
	eval "$$(docker-machine env bizlunch-api-preprod)"

init:
	docker exec public_api_1 php /var/www/bin/console dev import:data user
	docker exec public_api_1 php /var/www/bin/console dev es:import