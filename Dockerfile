FROM jenkins:2.7.4

MAINTAINER Willian Resille

USER root

RUN echo 'deb http://http.debian.net/debian wheezy-backports main' >> /etc/apt/sources.list.d/backports.list

RUN apt-get update -y

RUN apt-get install apt-transport-https ca-certificates -y

RUN apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D

RUN echo 'deb https://apt.dockerproject.org/repo debian-jessie main' >> /etc/apt/sources.list.d/docker.list

RUN apt-get update

RUN apt-cache policy docker-engine

RUN apt-get update -y

RUN apt-get install docker-engine -y

RUN gpasswd -a jenkins docker

USER jenkins
