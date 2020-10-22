FROM alpine:latest

RUN apk --no-cache add openjdk11-jdk openjdk11-jmods
RUN apk --no-cache add git

ENV JAVA_HOME=/usr/lib/jvm/default-jvm
ENV PATH="$PATH:$JAVA_HOME/bin"

ADD https://services.gradle.org/distributions/gradle-6.7-bin.zip /opt/gradle.zip
RUN unzip /opt/gradle.zip -d /opt

ENV PATH "$PATH:/opt/gradle-6.7/bin"
COPY runtests /code/runtests
WORKDIR /code


ENTRYPOINT ["/code/runtests"]
#ENTRYPOINT ["/bin/sh"]

