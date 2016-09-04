FROM phusion/baseimage:0.9.19

RUN apt-get update && \
    apt-get install -yq --no-install-recommends \
            nfs-common && \
    apt-get clean autoclean && \
    apt-get autoremove -y && \
    rm -rf /var/lib/apt/lists/*

ADD init    /etc/my_init.d/mount

VOLUME /opt/ktv/shares/server
VOLUME /opt/ktv/shares/infra

WORKDIR /opt/ktv/shares