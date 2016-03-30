FROM kinoulink/nginx_php

RUN apt-get install -y \
				php5-dev \
				php5-imagick \
				php-pear

RUN 	pecl install mongo

RUN echo "extension=mongo.so" > /etc/php5/fpm/conf.d/20-mongodb.ini && \
	echo "extension=mongo.so" > /etc/php5/cli/conf.d/20-mongodb.ini && \
	echo "extension=mongo.so" > /etc/php5/mods-available/mongodb.ini

RUN apt-get remove -y php5-dev php-pear && \
	apt-get autoremove -y && \
	rm -rf /var/lib/apt/*

RUN ln -s /usr/local/bin/composer.phar /usr/local/bin/composer

RUN wget -O /usr/local/bin/mo https://raw.githubusercontent.com/tests-always-included/mo/master/mo && \
	chmod +x /usr/local/bin/mo

ADD nginx       /etc/service/nginx/config
ADD php-fpm     /etc/service/phpfpm/config

ARG K_ENV

RUN cd /etc/service/nginx/config && \
	cat nginx.tmpl | mo > nginx.conf && \
	nginx -t -c $PWD/nginx.conf

RUN mkdir -p /var/kinoulink/upload && \
	chown www-data:www-data /var/kinoulink/upload

WORKDIR /var/www