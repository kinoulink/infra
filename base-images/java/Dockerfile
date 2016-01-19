FROM bizlunch/base

RUN echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections

RUN add-apt-repository ppa:webupd8team/java && \
	apt-get update && \
	apt-get install -y oracle-java8-installer

RUN java -version

