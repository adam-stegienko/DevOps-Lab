FROM maven:3.6.2-jdk-8
COPY . /usr/thumbnailer
WORKDIR /usr/thumbnailer
RUN mvn verify
WORKDIR /usr/thumbnailer/target
ENTRYPOINT ["/bin/bash", "../thumbnail.sh", "../examples/*"]
