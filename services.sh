echo "start-zookeeper.sh"
docker exec -d confluent-<node_id> bash -c "cd /usr/local/confluent/bash/ && . start-zookeeper.sh"
sleep 20
docker exec confluent-<node_id> jps

echo "start-kafka.sh"
docker exec -d confluent-<node_id> bash -c "cd /usr/local/confluent/bash/ && . start-kafka.sh"
sleep 20
docker exec confluent-<node_id> jps

echo "cleanup.sh"
. cleanup.sh

echo "start-schema.sh"
docker exec -d confluent-<node_id> bash -c "cd /usr/local/confluent/bash/ && . start-schema.sh"
sleep 20
docker exec confluent-<node_id> jps

echo "start-connect.sh"
docker exec -d confluent-<node_id> bash -c "cd /usr/local/confluent/bash/ && . start-connect.sh"
sleep 20
docker exec confluent-<node_id> jps

#echo "start-ksql.sh"
#docker exec -d confluent-<node_id> bash -c "cd /usr/local/confluent/bash/ && . start-ksql.sh"
#docker exec confluent-<node_id> jps
