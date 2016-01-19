FROM bizlunch/nginx

RUN apt-get update

RUN	apt-get -y install php5-fpm php5-mysql php5-curl php5-mcrypt php5-cli

ADD services/php-fpm  /etc/service/phpfpm