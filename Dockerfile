FROM jenkins/jenkins:lts-centos
USER root

RUN yum install wget python38-pip -y
RUN wget -q https://github.com/akamai/cli/releases/download/1.2.1/akamai-1.2.1-linuxamd64 -O /usr/local/bin/akamai && \
  chmod +x /usr/local/bin/akamai
RUN wget -q https://github.com/akamai/cli-purge/releases/download/1.0.1/akamai-purge-1.0.1-linuxamd64 -O /usr/local/bin/akamai-purge && \
  chmod +x /usr/local/bin/akamai-purge
RUN pip3 install httpie-edgegrid

# Amazon Linux 2 docker gid is 1950
RUN groupadd -g 1950 docker && \
  usermod -aG docker jenkins

USER jenkins
WORKDIR /var/jenkins_home
