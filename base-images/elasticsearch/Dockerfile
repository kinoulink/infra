FROM bizlunch/java

RUN wget https://download.elasticsearch.org/elasticsearch/release/org/elasticsearch/distribution/deb/elasticsearch/2.2.0/elasticsearch-2.2.0.deb && \
	dpkg -i elasticsearch-2.2.0.deb && \
	unlink elasticsearch-2.2.0.deb

RUN rm -rf /var/lib/apt/lists/*

ENV PATH /usr/share/elasticsearch/bin:$PATH

RUN set -ex \
	&& for path in \
		/usr/share/elasticsearch/data \
		/usr/share/elasticsearch/logs \
		/usr/share/elasticsearch/config \
		/usr/share/elasticsearch/config/scripts \
	; do \
		mkdir -p "$path"; \
		chown -R elasticsearch:elasticsearch "$path"; \
	done

COPY services/elasticsearch/config/logging.yml /usr/share/elasticsearch/config/

ADD services/elasticsearch /etc/service/elasticsearch

RUN /usr/share/elasticsearch/bin/plugin install lmenezes/elasticsearch-kopf/2.0

VOLUME /usr/share/elasticsearch/data

EXPOSE 9200 9300