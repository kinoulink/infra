FROM bizlunch/base

RUN curl -sL https://deb.nodesource.com/setup_4.x | bash - && \
	apt-get install -y nodejs

ADD service/messenger /etc/service/messenger

EXPOSE 80