FROM debian:8.6
MAINTAINER Juracy Filho <juracy@gmail.com>

RUN apt-get update && \
    apt-get install -y wget build-essential libssl-dev libcurl4-gnutls-dev gettext expat libexpat1-dev zlib1g-dev man

ENV GIT_VERSION=2.11.0
ENV GIT_FILENAME=git-${GIT_VERSION}
ENV GIT_ARCHIVE=${GIT_FILENAME}.tar.gz

RUN cd /tmp && \
    wget https://www.kernel.org/pub/software/scm/git/${GIT_ARCHIVE}

RUN cd /tmp && \
    tar xfz ${GIT_ARCHIVE} && \
    cd ${GIT_FILENAME} && \
    make -j4 prefix=/usr all && \
    make prefix=/usr install && \
    cd /tmp && \
    rm -rf ${GIT_FILENAME} && \
    apt-get remove -y wget build-essential libssl-dev libcurl4-gnutls-dev gettext expat libexpat1-dev zlib1g-dev && \
    apt-get autoremove -y

ENTRYPOINT /bin/bash
