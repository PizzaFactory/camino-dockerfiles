FROM eclipse/stack-base:ubuntu
ARG branch=master
ARG symbol=SYS

USER root
RUN apt-get update
RUN apt-get install -y \
    clang-4.0 lldb-4.0 libclang-4.0-dev cmake make automake libbz2-dev libssl-dev \
    libgmp3-dev autotools-dev build-essential libicu-dev python2.7-dev python3-dev \
    autoconf libtool curl zlib1g-dev doxygen graphviz
RUN apt-get upgrade -y

# Clone eosio.cdt
WORKDIR /opt
RUN git clone -b ${branch} https://github.com/eosio/eosio.cdt --recursive

# Checkout eosio.cdt
WORKDIR /opt/eosio.cdt
RUN git submodule update --recursive

# Build eosio.cdt
RUN ./build.sh ${symbol}

# Install eosio.cdt
RUN ./install.sh
USER user
