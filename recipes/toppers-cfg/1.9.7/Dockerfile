FROM eclipse/cpp_gcc

USER root
RUN apt-get update && apt-get install bzip2
WORKDIR /tmp/sources
RUN curl http://ftp.meisei-u.ac.jp/mirror/apache/dist/xerces/c/3/sources/xerces-c-3.2.2.tar.bz2 | tar xjf -
RUN git clone https://github.com/TOPPERS-ContributedSoftware/cfg.git -b 1.9.7

WORKDIR /tmp/build
RUN /tmp/sources/xerces-c-3.2.2/configure --prefix=/usr --disable-network --disable-shared
RUN make && make install

# The commit log tells "Add from cfg-1.9.6.tar.gz"
WORKDIR /tmp/sources/cfg
RUN apt-get install -y libboost-dev libboost-regex-dev libboost-system-dev \
    libboost-filesystem-dev libboost-program-options-dev
RUN ./configure --with-libraries=/usr/lib/x86-64-linux-gnu --with-xml
RUN sed -i -e 's/OPTIONS=/OPTIONS=-static/' Makefile.config
RUN sed -i -e '45,45 s/$/ -lpthread -ldl/' Makefile
RUN make
