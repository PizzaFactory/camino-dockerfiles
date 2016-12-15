FROM pf0camino/cross-nios2-elf
MAINTAINER Masaki Muranaka <monaka@pizzafactory.jp>

USER root

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -y && apt-get install -y uncrustify && apt-get autoremove && apt-get autoclean

RUN curl -q https://sourcery.mentor.com/public/gnu_toolchain/nios2-elf/sourceryg++-2016.05-9-nios2-elf-i686-pc-linux-gnu.tar.bz2 2>/dev/null | tar xCjf /opt -

RUN curl -q https://www.toppers.jp/download.cgi/a-rtegen-1.3.0.tar.gz 2>/dev/null | tar xCzf /usr/share -
RUN rm /usr/share/a-rtegen/bin/bin/uncrustify.exe
RUN ln -s /usr/bin/unrustify /usr/share/a-rtegen/bin/bin/uncrustify.exe
RUN sed -i -e 's|/bin/sh|/bin/bash|g' /usr/share/a-rtegen/bin/bin/rtegen.sh

RUN mkdir -p /usr/share/toppers-cfg
RUN curl https://www.toppers.jp/download.cgi/cfg-linux-static-1_9_5.gz 2>/dev/null | zcat > /usr/share/toppers-cfg/cfg
RUN chmod +x /usr/share/toppers-cfg/cfg

RUN echo 'PATH=$PATH:/usr/share/a-rtegen/bin/bin:/opt/sourceryg++-2016.05/bin' >> /home/user/.bashrc

USER user

