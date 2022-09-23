FROM maven:3.6.2-jdk-8
COPY ./app /usr/app
VOLUME /usr/app
WORKDIR /usr/app
RUN mvn clean verify
WORKDIR /usr/app/target
ENTRYPOINT ["../thumbnail.sh", "../examples/*"]