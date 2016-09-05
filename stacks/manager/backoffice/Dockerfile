FROM phusion/baseimage:0.9.19

RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections

RUN apt update && \
	apt install -y  net-tools make git \
					php php-curl php-zip php-pdo php-gd php-xml php-apcu php-mysql php-intl \
					nginx-light

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN mkdir /run/php /etc/service/nginx /etc/service/php

ADD services/nginx      /etc/service/nginx/run
ADD services/php        /etc/service/php/run
ADD services/cron       /etc/cron.d/ktv
ADD services/init       /etc/my_init.d/install
ADD services/install    /opt/ktv/bin/install

#RUN chmod +x       /root/init && \
#	echo "source /root/init" >> ~/.bashrc && \

RUN mkdir -p /opt/ktv/fs/cache /var/lib/php/session && \
	chown www-data:www-data -R /opt/ktv /var/lib/php/session && \
	chmod 600 /etc/cron.d/ktv

ADD nginx.conf /etc/nginx/nginx.conf
ADD php.ini    /etc/php/7.0/fpm/php.ini
ADD php.ini    /etc/php/7.0/cli/php.ini

RUN rm -rf /etc/service/sshd

ENV COMPOSER_HOME /opt/ktv/composer

VOLUME /opt/ktv/composer/cache

USER www-data

EXPOSE 80