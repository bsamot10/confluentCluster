docker run -d \
        -h confluent-<node_id> \
        --name confluent-<node_id> \
        -e NODE_ID=<node_id> \
        --ip 10.0.1.11 \
        --network overlay-cluster \
        -it bsamot10/confluent-cluster
	
. services.sh
