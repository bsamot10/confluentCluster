echo "start-zookeeper.sh"
docker exec -d confluent-<node_id> bash -c "cd /usr/local/confluent/bash/ && . start-zookeeper.sh"
sleep 20
docker exec confluent-<node_id> jps

echo -e "\nstart-kafka.sh"
docker exec -d confluent-<node_id> bash -c "cd /usr/local/confluent/bash/ && . start-kafka.sh"
sleep 20
docker exec confluent-<node_id> jps

echo -e "\ncleanup.sh"
. cleanup.sh

echo -e "\nstart-schema.sh"
docker exec -d confluent-<node_id> bash -c "cd /usr/local/confluent/bash/ && . start-schema.sh"
sleep 20
docker exec confluent-<node_id> jps

echo -e "\nstart-connect.sh"
docker exec -d confluent-<node_id> bash -c "cd /usr/local/confluent/bash/ && . start-connect.sh"
sleep 20
docker exec confluent-<node_id> jps

#echo -e "\nstart-ksql.sh"
#docker exec -d confluent-<node_id> bash -c "cd /usr/local/confluent/bash/ && . start-ksql.sh"
#docker exec confluent-<node_id> jps
