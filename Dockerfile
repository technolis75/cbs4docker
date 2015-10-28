# This is a comment
# FROM ubuntu:14.04
FROM centos:7
MAINTAINER Harry Bonneto <harry.bonneto@technolis.fr>
EXPOSE 80 443 9444 9445
ENV CBS_HOME /usr/local/cbs
RUN ["sh", "-c", "export", "CBS_HOME"]
# ENV USER_HOME ${CBS_HOME}/user
# ENV LOG_HOME ${CBS_HOME}/logs
VOLUME /usr/local/cbs/user /usr/local/cbs/logs /usr/local/cbs/conf
# /usr/local/cbs/download
RUN ["sh", "-c", "mkdir /p", "${CBS_HOME}"]
# COPY resources/cbs-nix.tar.gz
WORKDIR ${CBS_HOME}
# RUN ["sh", "-c", "cp -f", "cbs-nix.tar.gz", "${CBS_HOME}/"]
# RUN ["sh", "-c", "cp -f", "resources/cbs-nix.tar.gz", "${CBS_HOME}/"]
RUN ["sh", "-c", "cd", "${CBS_HOME}"]
ADD http://ahsay-dn.ahsay.com/v7/7300/cbs-nix.tar.gz cbs-nix.tar.gz
RUN ["gunzip", "cbs-nix.tar.gz"]
#RUN ["dnf", "-q", "-y", "install", "tar", "--allowerasing", "--nogpgcheck"]
RUN ["tar", "-xf", "cbs-nix.tar"]
# CMD ["sh", "-c",  "${CBS_HOME}/bin/install.sh"]
RUN ["sh", "-c",  "/usr/local/cbs/bin/install.sh"]
RUN ["rm", "-f", "cbs-nix.tar"]
CMD ["/usr/local/cbs/bin/startup.sh"]
