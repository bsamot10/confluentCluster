FROM ubuntu:22.04

USER root

RUN apt-get update
RUN apt-get dist-upgrade
RUN apt-get -y install openssh-server
RUN apt-get -y install gzip
RUN apt-get -y install tar
RUN apt-get -y install vim
RUN apt-get -y install curl
RUN apt-get -y install jq
RUN apt-get -y install cron
RUN apt-get -y install iputils-ping
RUN apt-get -y install net-tools
RUN apt-get -y install openjdk-11-jdk
RUN apt-get -y install kafkacat
RUN apt-get -y install scala

RUN mkdir confluent
RUN curl -O https://packages.confluent.io/archive/7.5/confluent-7.5.2.tar.gz
RUN tar -xvzf confluent-7.5.2.tar.gz
RUN rm confluent-7.5.2.tar.gz
RUN mv /confluent-7.5.2 /confluent/confluent-7.5.2

ENV JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64
ENV CONFLUENT_HOME=/confluent/confluent-7.5.2
ENV PATH=$PATH:$CONFLUENT_HOME/bin

RUN mkdir $CONFLUENT_HOME/connectors
COPY connectors/debezium-connector-mysql-1.9.2.Final-plugin.tar.gz .
RUN tar -xvzf debezium-connector-mysql-1.9.2.Final-plugin.tar.gz
RUN rm debezium-connector-mysql-1.9.2.Final-plugin.tar.gz
RUN mv /debezium-connector-mysql $CONFLUENT_HOME/connectors/debezium-connector-mysql

RUN mkdir /var/lib/zookeeper
RUN touch /var/lib/zookeeper/myid
COPY conf/zookeeper.properties $CONFLUENT_HOME/etc/kafka/zookeeper.properties
COPY conf/ksql-server.properties $CONFLUENT_HOME/etc/ksqldb/ksql-server.properties
COPY conf/schema-registry.properties $CONFLUENT_HOME/etc/schema-registry/schema-registry.properties
COPY jars/cruise-control-metrics-reporter-2.5.135-SNAPSHOT.jar  $CONFLUENT_HOME/share/java/kafka/cruise-control-metrics-reporter-2.5.135-SNAPSHOT.jar
COPY bash /confluent/bash

ENTRYPOINT bash

