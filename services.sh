docker exec -d confluent-<node_id> bash -c "cd /usr/local/confluent/bash/ && . start-zookeeper.sh"
sleep 10
docker exec -d confluent-<node_id> bash -c "cd /usr/local/confluent/bash/ && . start-kafka.sh"
. cleanup.sh
sleep 10
docker exec -d confluent-<node_id> bash -c "cd /usr/local/confluent/bash/ && . start-schema.sh"
sleep 10
docker exec -d confluent-<node_id> bash -c "cd /usr/local/confluent/bash/ && . start-connect.sh"
#sleep 10
#docker exec -d confluent-<node_id> bash -c "cd /usr/local/confluent/bash/ && . start-ksql.sh"
