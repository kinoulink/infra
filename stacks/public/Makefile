build:
	docker build --rm -t bizlunch/api-app app
	docker build --rm -t bizlunch/api-search search
	docker build --rm -t bizlunch/messenger messenger
	docker build --rm -t bizlunch/webapp web

up:
	docker-compose -p public -f docker-compose.yml up -d --force-recreate
	docker-compose -p public logs

init:
	docker exec mongo bash -c "cd /tmp && tar -xzvf /share/dump.tar.gz &&  mongorestore"
	docker exec api php /var/www/bin/console dev es:import