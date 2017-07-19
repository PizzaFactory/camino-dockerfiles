FROM cantinona/cross-nios2-elf
MAINTAINER Masaki Muranaka <monaka@pizzafactory.jp>

USER root

ENV DEBIAN_FRONTEND noninteractive

RUN dpkg --add-architecture i386
RUN apt-get update -y && apt-get install -y uncrustify ruby perl libc6:i386 libstdc++6:i386 && apt-get autoremove && apt-get autoclean

RUN curl -q https://www.toppers.jp/download.cgi/a-rtegen-1.3.0.src.tar.gz 2>/dev/null | tar xCzf /usr/share -
RUN rm /usr/share/a-rtegen/bin/bin/uncrustify.exe
RUN ln -s /usr/bin/uncrustify /usr/share/a-rtegen/bin/bin/uncrustify.exe
RUN sed -i -e 's|/bin/sh|/bin/bash|g' /usr/share/a-rtegen/bin/bin/rtegen.sh

RUN mkdir -p /usr/share/toppers-cfg
RUN curl https://www.toppers.jp/download.cgi/cfg-linux-static-1_9_5.gz 2>/dev/null | tar xCzf /usr/share/toppers-cfg -
RUN chmod +x /usr/share/toppers-cfg/cfg
RUN curl https://www.toppers.jp/download.cgi/cfg-1.9.5.tar.gz 2>/dev/null > /usr/share/toppers-cfg/cfg-1.9.5.tar.gz

USER user

