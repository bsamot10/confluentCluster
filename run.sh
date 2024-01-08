docker run -d \
	-h confluent-<node_id> \
	--name confluent-<node_id> \
	--ip 10.0.1.1<node_id> \
	--network overlay-cluster \
	-it bsamot10/confluent-cluster

. myid.sh
. server-properties.sh
. connect-properties.sh
. services.sh
