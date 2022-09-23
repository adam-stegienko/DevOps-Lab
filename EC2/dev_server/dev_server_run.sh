#!/bin/bash

docker rm -f developer_server
# docker run --name=developer_server -v ~/.m2/repository:/home/.m2/repository  --interactive --tty --entrypoint /bin/bash maven:3.6.2-jdk-8
docker build -t dev_server_image:1.0 .
docker run --name=developer_server -it dev_server_image:1.0
