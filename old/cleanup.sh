docker exec confluent-<node_id>  bash -c 'for topic in {_schemas,_schema_encoders,_dek_registry_keys,connect-offsets,connect-configs,connect-status}; 
do kafka-configs --topic $topic --bootstrap-server 10.0.1.1<node_id>:9092 --add-config "cleanup.policy=compact" --alter; done;'
