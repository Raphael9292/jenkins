#!/bin/bash
export REPOSITORY=raphael9292
export TAG=$REPOSITORY/jenkins:lts-centos-docker-1950

docker build --tag $TAG .
docker push $TAG 

# user root for test
# docker run -u root -it raphael9292/jenkins:lts-centos-docker-1950 sh
