FROM ubuntu:trusty

ENV HOME /root

ADD build build

ADD bin/my_init         /sbin/my_init
ADD bin/setuser         /sbin/setuser

RUN chmod +x -R build/* && chmod +x /sbin/*

RUN /build/prepare.sh

RUN /build/system_services.sh && \
	/build/utilities.sh && \
	/build/cleanup.sh

ENV LC_ALL          C.UTF-8
ENV LANG            en_US.UTF-8
ENV LANGUAGE        en_US.UTF-8

ARG APT_CACHER_HOST=172.18.0.1

RUN echo "Acquire::http { Proxy \"http://$APT_CACHER_HOST:3142\"; };" >> /etc/apt/apt.conf.d/01proxy
RUN echo 'Acquire::https::Proxy "false";' >> /etc/apt/apt.conf.d/01proxy
RUN echo 'Acquire::http::Proxy {download.oracle.com DIRECT;};' >> /etc/apt/apt.conf.d/01proxy

CMD ["/sbin/my_init"]