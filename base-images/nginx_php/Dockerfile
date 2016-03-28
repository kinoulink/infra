FROM kinoulink/nginx

RUN add-apt-repository ppa:ondrej/php5-5.6  && \
	apt-get update

RUN	apt-get -y install php5 php5-cli php5-fpm php5-curl php5-geoip php5-gd

ADD services/php-fpm  /etc/service/phpfpm

RUN apt-get install -y git

RUN curl -sS https://getcomposer.org/installer | php && \
	mv composer.phar /usr/local/bin/composer.phar && \
	alias composer='/usr/local/bin/composer.phar' && \
	echo "alias composer='/usr/local/bin/composer.phar'" >> /root/.bashrc