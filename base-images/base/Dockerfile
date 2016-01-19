FROM ubuntu:trusty

ENV HOME /root

ADD build build

ADD bin/my_init /sbin/my_init
ADD bin/setuser /sbin/setuser

RUN chmod +x -R build/* && chmod +x /sbin/*

RUN /build/prepare.sh

RUN /build/system_services.sh && \
	/build/utilities.sh && \
	/build/cleanup.sh

#RUN echo 'Acquire::http { Proxy "http://apt-cacher-ng:3142"; };' >> /etc/apt/apt.conf.d/01proxy

#RUN echo 'Acquire::http::Proxy {download.oracle.com DIRECT;};' >> /etc/apt/apt.conf.d/01proxy

CMD ["/sbin/my_init"]