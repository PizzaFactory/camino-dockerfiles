FROM eclipse/cpp_gcc:ubuntu-trusty

USER root
RUN apt-get update && apt-get install -y wget bzip2 && \
    wget http://ev3rt-git.github.io/public/ev3rt-prepare-ubuntu.sh && \
    yes 1 | bash ev3rt-prepare-ubuntu.sh && \
    rm ev3rt-prepare-ubuntu.sh && \
    apt-get -y clean && \
    rm -fr /var/lib/apt/lists/*
USER user
