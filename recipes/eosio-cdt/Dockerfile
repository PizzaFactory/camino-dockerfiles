FROM camino.azurecr.io/eclipse/stack-base:ubuntu-xenial
ARG branch=master

USER root
RUN wget -O - https://apt.llvm.org/llvm-snapshot.gpg.key|sudo apt-key add -
RUN echo "deb http://apt.llvm.org/xenial/ llvm-toolchain-xenial-8 main\ndeb-src http://apt.llvm.org/xenial/ llvm-toolchain-xenial-8 main" > /etc/apt/sources.list.d/clang-8.list
RUN apt-get update
RUN apt-get install -y \
    clang-8 lldb-8 lld-8 cmake make automake libbz2-dev libssl-dev \
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
RUN ./build.sh

# Install eosio.cdt
RUN ./install.sh
USER user
