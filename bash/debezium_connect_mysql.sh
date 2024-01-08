curl -i -X POST -H "Accept:application/json" -H "Content-Type:application/json" http://localhost:8083/connectors/ -d '
{
  "name": "debezium-demo-connector",  
  "config": {  
    "connector.class": "io.debezium.connector.mysql.MySqlConnector",
    "tasks.max": "1",  
    "database.hostname": "10.0.1.10",  
    "database.port": "3306",
    "database.user": "kafka",
    "database.password": "password",
    "database.server.id": "10101",  
    "database.server.name": "mysql",  
    "database.include.list": "dev",  
    "database.history.kafka.bootstrap.servers": "0.0.0.0:9092",  
    "database.history.kafka.topic": "schema-changes.debezium-demo",
    "key.converter": "io.confluent.connect.avro.AvroConverter",
    "value.converter": "io.confluent.connect.avro.AvroConverter",
    "key.converter.schema.registry.url": "http://0.0.0.0:8081",
    "value.converter.schema.registry.url": "http://0.0.0.0:8081",
    "topic.prefix": "dev"
  }
}'
