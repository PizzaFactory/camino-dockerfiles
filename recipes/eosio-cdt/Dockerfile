FROM eclipse/stack-base:ubuntu as builder
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

# Making eosio.cdt latest images
FROM eclipse/stack-base:ubuntu
USER root
#RUN add-apt-repository ppa:ubuntu-toolchain-r/test
#RUN apt-get update
#RUN apt-get upgrade -y
COPY --from=builder /usr/local/lib/* /usr/local/lib/
COPY --from=builder /usr/local/eosio.cdt /usr/local/eosio.cdt
#COPY --from=builder /usr/include/boost/* /usr/local/eosio.cdt/include/boost/
USER user
ENV LD_LIBRARY_PATH /usr/local/lib
ENV PATH /usr/local/eosio.cdt/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

