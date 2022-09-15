FROM jenkins/jenkins:lts-jdk11
USER root
RUN curl https://get.docker.com/ > dockerinstall && chmod 777 dockerinstall && ./dockerinstall
# RUN apt install docker.io containerd docker-compose
# RUN groupadd -g 999 docker
RUN usermod -aG docker jenkins
USER 1000:999