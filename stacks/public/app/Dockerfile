FROM phusion/baseimage:0.9.19

RUN apt update && \
	apt install -y  net-tools make \
					php php-curl php-zip php-pdo php-gd php-xml php-apcu php-mysql php-intl \
					nginx-light \
					ffmpeg

RUN mkdir /run/php /etc/service/nginx /etc/service/php /opt/tmp && \
	chown www-data /opt/tmp

ADD services/nginx    /etc/service/nginx/run
RUN chmod +x          /etc/service/nginx/run

ADD services/php   /etc/service/php/run
RUN chmod +x       /etc/service/php/run

ADD services/cron   /etc/cron.d/ktv

ADD services/init   /root/init
RUN chmod +x       /root/init && \
	echo "source /root/init" >> ~/.bashrc && \
	chmod 600 /etc/crontab

RUN mkdir -p /opt/ktv/fs/cache /var/lib/php/session && \
	chown www-data:www-data -R /opt/ktv/fs /var/lib/php/session

RUN rm -rf /etc/service/sshd

EXPOSE 80

WORKDIR /var/www