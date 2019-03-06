FROM eclipse/stack-base:ubuntu

USER root
RUN apt-get update && \
    apt-get install -y ruby ruby-dev build-essential && \
    gem install octopress && \
    apt-get autoremove -y ruby-dev build-essential && \
    apt-get -y clean
USER user
