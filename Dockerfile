FROM maven:3.6.3-jdk-11 AS builder

FROM eclipse-temurin:11

USER root
ADD https://github.com/karatelabs/karate/releases/download/v1.1.0/karate-1.1.0.jar karate-1.1.0.jar

COPY logback.xml logback.xml
COPY features/ features/
COPY entrypoint.sh entrypoint.sh

ENTRYPOINT ["/bin/bash", "-c", "./entrypoint.sh"]
