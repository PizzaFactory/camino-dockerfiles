FROM codenvy/ubuntu_rails
MAINTAINER Masaki Muranaka <monaka@pizzafactory.jp>

ENV DEBIAN_FRONTEND noninteractive

USER root

RUN apt-get update && \
	apt-get install -y gperf && \
	apt-get -y autoremove && \
	apt-get -y autoclean

USER user
