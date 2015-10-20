# This is a comment
# FROM fedora:22
FROM ubuntu:14.04
MAINTAINER Harry Bonneto <harry.bonneto@technolis.fr>
EXPOSE 80 443 9444 9445
# ADD http://ahsay-dn.ahsay.com/v7/7300/cbs-nix.tar.gz cbs-nix.tar.gz
ENV CBS_HOME /usr/local/cbs
ENV USER_HOMES ${CBS_HOME}/users
ENV LOG_HOMES ${CBS_HOME}/logs
VOLUME /usr/local/cbs/users /usr/local/cbs/logs /usr/local/cbs/conf 
# /usr/local/cbs/download
RUN ["sh", "-c", "mkdir /p", "${CBS_HOME}"]
# COPY resources/cbs-nix.tar.gz 
WORKDIR ${CBS_HOME} 
# RUN ["sh", "-c", "cp -f", "cbs-nix.tar.gz", "${CBS_HOME}/"]
# RUN ["sh", "-c", "cp -f", "resources/cbs-nix.tar.gz", "${CBS_HOME}/"]
RUN ["sh", "-c", "cd", "${CBS_HOME}"]
# ADD http://192.168.0.77/dev.bo.eplateforme/cbs-nix.tar.gz cbs-nix.tar.gz
ADD http://ahsay-dn.ahsay.com/v7/7300/cbs-nix.tar.gz cbs-nix.tar.gz
RUN ["gunzip", "cbs-nix.tar.gz"]
#RUN ["dnf", "-q", "-y", "install", "tar", "--allowerasing", "--nogpgcheck"]
RUN ["tar", "-xf", "cbs-nix.tar"]
# CMD ["sh", "-c",  "${CBS_HOME}/bin/install.sh"]
RUN ["sh", "-c",  "bin/install.sh"]
