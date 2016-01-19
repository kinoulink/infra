FROM bizlunch/nginx_php

RUN apt-get update && \
	apt-get install php5-mongo

RUN echo "extension=mcrypt.so" > /etc/php5/fpm/conf.d/20-mcrypt.ini