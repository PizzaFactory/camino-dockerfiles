FROM eclipse/cpp_gcc
MAINTAINER Masaki Muranaka <monaka@pizzafactory.jp>

ARG TOOL_RELEASE=2014R1
ARG RELEASE_SUFFIX=_45-RC2
ARG GCC_VERSION=4.5
USER root

RUN apt-get update && apt-get -y install bzip2

RUN mkdir -p /opt/uClinux
RUN curl -q http://master.dl.sourceforge.net/project/adi-toolchain/${TOOL_RELEASE}/${TOOL_RELEASE}${RELEASE_SUFFIX}/x86_64/blackfin-toolchain-${TOOL_RELEASE}${RELEASE_SUFFIX}.x86_64.tar.bz2 2>/dev/null | tar xCjf / -
RUN curl -q http://master.dl.sourceforge.net/project/adi-toolchain/${TOOL_RELEASE}/${TOOL_RELEASE}${RELEASE_SUFFIX}/x86_64/blackfin-toolchain-elf-gcc-${GCC_VERSION}-${TOOL_RELEASE}${RELEASE_SUFFIX}.x86_64.tar.bz2 2>/dev/null | tar xCjf / -
RUN curl -q http://master.dl.sourceforge.net/project/adi-toolchain/${TOOL_RELEASE}/${TOOL_RELEASE}${RELEASE_SUFFIX}/x86_64/blackfin-toolchain-uclibc-full-${TOOL_RELEASE}${RELEASE_SUFFIX}.x86_64.tar.bz2 2>/dev/null | tar xCjf / -

RUN echo export 'PATH=/opt/uClinux/bfin-elf/bin:/opt/uClinux/bfin-linux-uclibc/bin:/opt/uClinux/bfin-uclinux/bin:$PATH' >> /home/user/.bashrc

USER user
