########## How To Use Docker Image ###############
##  Image Name: clouthinkin/blackhole
##  Git link: https://github.com/melthaw/blackhole-docker-up/blob/main/Dockerfile
##  Docker hub link: https://hub.docker.com/r/clouthinkin/blackhole/
##  Build docker image: docker build --no-cache -f Dockerfile -t clouthinkin/blackhole --rm=true .
##  Description: blackhole 1.2.* + jdk8
##################################################
# Base Docker image: https://hub.docker.com/r/clouthinkin/jdk/
from clouthinkin/jdk

LABEL maintainer="melthaw@gmail.com"

USER root

COPY ./container_files/docker-entrypoint.sh /
COPY ./container_files/usr/local/blackhole /usr/local/blackhole

RUN chmod +x /usr/local/blackhole/*.sh

EXPOSE 53
EXPOSE 80

WORKDIR /
ENTRYPOINT /docker-entrypoint.sh
