FROM bizlunch/nginx_php

RUN apt-get install -y php5-dev php-pear libsasl2-dev

RUN mkdir -p /usr/local/openssl/include/openssl/ && \
    ln -s /usr/include/openssl/evp.h /usr/local/openssl/include/openssl/evp.h && \
    mkdir -p /usr/local/openssl/lib/ && \
    ln -s /usr/lib/x86_64-linux-gnu/libssl.a /usr/local/openssl/lib/libssl.a && \
    ln -s /usr/lib/x86_64-linux-gnu/libssl.so /usr/local/openssl/lib/

RUN 	pecl install mongodb

RUN echo "extension=mongodb.so" > /etc/php5/fpm/conf.d/20-mongodb.ini && \
	echo "extension=mongodb.so" > /etc/php5/cli/conf.d/20-mongodb.ini && \
	echo "extension=mongodb.so" > /etc/php5/mods-available/mongodb.ini
