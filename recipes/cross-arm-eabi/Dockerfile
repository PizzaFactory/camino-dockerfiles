FROM eclipse/cpp_gcc
MAINTAINER Masaki Muranaka <monaka@pizzafactory.jp>

USER root

RUN add-apt-repository ppa:team-gcc-arm-embedded/ppa && \
    apt-get update && \
    apt-get install -y gcc-arm-embedded

USER user
