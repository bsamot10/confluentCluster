docker run -d \
        -h confluent-<node_id> \
        --name confluent-<node_id> \
        --ip 10.0.1.1<node_id> \
        --network overlay-cluster \
	--restart unless-stopped \
        -it bsamot10/confluent-cluster

echo -e "\myid.sh"
. myid.sh
echo -e "\nserver-properties.sh"
. server-properties.sh
echo -e "\nconnect-properties.sh"
. connect-properties.sh
. services.sh
