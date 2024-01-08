docker exec -d confluent-<node_id> bash -c "cd /confluent/bash/ && . start-zookeeper.sh"
sleep 10
docker exec -d confluent-<node_id> bash -c "cd /confluent/bash/ && . start-kafka.sh"
#sleep 10
#docker exec -d confluent-<node_id> bash -c "cd /confluent/bash/ && . start-schema.sh"
#sleep 10
#docker exec -d confluent-<node_id> bash -c "cd /confluent/bash/ && . start-connect.sh"
#sleep 10
#docker exec -d confluent-<node_id> bash -c "cd /confluent/bash/ && . start-ksql.sh"
