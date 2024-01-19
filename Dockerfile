FROM bsamot10/ubuntu:22.04

RUN mkdir /usr/local/confluent
ENV CONFLUENT_HOME=/usr/local/confluent
ENV JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64
ENV PATH=$PATH:$CONFLUENT_HOME/bin

WORKDIR /usr/local/confluent

RUN curl -O https://packages.confluent.io/archive/7.5/confluent-7.5.2.tar.gz
RUN tar -xvzf confluent-7.5.2.tar.gz
RUN rm confluent-7.5.2.tar.gz
RUN mv confluent-7.5.2/* .
RUN rmdir confluent-7.5.2

RUN mkdir connectors
COPY connectors/debezium-connector-mysql-1.9.2.Final-plugin.tar.gz .
RUN tar -xvzf debezium-connector-mysql-1.9.2.Final-plugin.tar.gz
RUN rm debezium-connector-mysql-1.9.2.Final-plugin.tar.gz
RUN mv debezium-connector-mysql connectors/debezium-connector-mysql

RUN mkdir /var/lib/zookeeper
RUN touch /var/lib/zookeeper/myid
COPY conf/zookeeper.properties etc/kafka/zookeeper.properties
COPY conf/schema-registry.properties etc/schema-registry/schema-registry.properties
COPY conf/ksql-server.properties etc/ksqldb/ksql-server.properties
COPY conf/kafka-server-start bin/kafka-server-start
RUN chmod 755 bin/kafka-server-start
#COPY jars/cruise-control-metrics-reporter-2.5.135-SNAPSHOT.jar share/java/kafka/cruise-control-metrics-reporter-2.5.135-SNAPSHOT.jar
COPY bash bash

ENTRYPOINT bash
