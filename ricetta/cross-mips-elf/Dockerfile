FROM codenvy/cpp_gcc
MAINTAINER Masaki Muranaka <monaka@pizzafactory.jp>

USER root

RUN curl -q https://sourcery.mentor.com/public/gnu_toolchain/mips-sde-elf/mips-2016.05-7-mips-sde-elf-i686-pc-linux-gnu.tar.bz2 2>/dev/null | tar xCjf /opt -
RUN mkdir -p /opt/src/
RUN curl -q https://sourcery.mentor.com/public/gnu_toolchain/mips-sde-elf/mips-2016.05-7-mips-sde-elf.src.tar.bz2 2>/dev/null > /opt/src/gcc.src.tar.bz2

RUN echo 'PATH=/opt/sourceryg++-2016.05/bin:$PATH' >> /home/user/.bashrc

USER user
