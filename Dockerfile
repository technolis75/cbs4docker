FROM centos:7
MAINTAINER Harry Bonneto <harry.bonneto@technolis.fr>
# RUN yum -y install net-tools
ENV CBS_HOME=/usr/local/cbs USER=root
#VOLUME /usr/local/cbs/user /usr/local/cbs/logs
RUN mkdir /p $CBS_HOME
# RUN cd $CBS_HOME
RUN ["sh", "-c", "cd", "${CBS_HOME}"]
WORKDIR $CBS_HOME
ADD http://ahsay-dn.ahsay.com/v7/7300/cbs-nix.tar.gz cbs-nix.tar.gz
RUN gunzip cbs-nix.tar.gz && tar -xf cbs-nix.tar
EXPOSE 80 443
VOLUME /usr/local/cbs/user /usr/local/cbs/logs /usr/local/cbs/conf
#CMD ["/usr/local/cbs/bin/install.sh"]
RUN /usr/local/cbs/bin/install.sh
CMD ["/usr/local/cbs/bin/install.sh"]
