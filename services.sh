docker exec -d confluent-<node_id> bash -c "cd /usr/local/confluent/bash/ && . start-zookeeper.sh"
sleep 20
docker exec -d confluent-<node_id> bash -c "cd /usr/local/confluent/bash/ && . start-kafka.sh"
#sleep 20
#docker exec -d confluent-<node_id> bash -c "cd /usr/local/confluent/bash/ && . start-schema.sh"
#sleep 20
#docker exec -d confluent-<node_id> bash -c "cd /usr/local/confluent/bash/ && . start-connect.sh"
#sleep 20
#docker exec -d confluent-<node_id> bash -c "cd /usr/local/confluent/bash/ && . start-ksql.sh"
