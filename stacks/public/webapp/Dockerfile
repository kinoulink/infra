FROM bizlunch/nginx

RUN curl -sL https://deb.nodesource.com/setup | bash -

RUN apt-get install -y -qq  \
							nodejs \
							ca-certificates \
							git \
							make \
							ruby-dev \
							ssh

RUN gem install --no-rdoc --no-ri compass

RUN npm -g install npm@latest-2

RUN npm -g install gulp bower

ADD ssh /root/.ssh

RUN cd /root && \
	touch .ssh/known_hosts && \
	chmod 600 .ssh/* && \
    ssh-keyscan bitbucket.org >> .ssh/known_hosts

RUN git config --global url."https://".insteadOf git:// && \
    git config --global user.email "you@example.com" && \
    git config --global user.name "Your Name" && \
	mkdir -p /var/bizlunch/sources

ADD bin /var/bizlunch/bin

RUN /var/bizlunch/bin/clone

RUN cd /var/bizlunch/sources && \
	npm install && \
    bower install --allow-root