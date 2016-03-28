FROM kinoulink/base

ADD services/nginx    /etc/service/nginx

RUN apt-key add /etc/service/nginx/apt.key

RUN echo "deb http://nginx.org/packages/ubuntu/ trusty nginx" >> /etc/apt/sources.list
RUN echo "deb-src http://nginx.org/packages/ubuntu/ trusty nginx" >> /etc/apt/sources.list

RUN apt-get update \
	&& 	apt-get -y install \
		nginx

RUN unlink /etc/nginx/nginx.conf

EXPOSE 80

CMD ["/sbin/my_init"]