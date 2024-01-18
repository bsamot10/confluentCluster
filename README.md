# confluentCluster
Docker container for a 3-node kafka cluster (not for production) using confluent's 7.5.2 distribution (file confluent-7.5.2.tar.gz in https://packages.confluent.io/archive/7.5/).

The present deployment supports 5 confluent services:

1. zookeeper
2. kafka
3. schema registry
4. kafka connect
5. ksql
   
## Requirements
3 Linux nodes with docker engine installed in each one of them. 

Resource requirements depend on the use case. I am using 4gb ram and 40gb storage on each node for testing purposes.

## Step 0
If the nodes do not share the same subnet, install openssh-server in every node and use it to produce public keys and provide the relevant authorizations to each node. 

## Step 1
Choose one of the nodes to be the leader of the docker swarm. 

Enter the leader node and type ```docker swarm init --advertise-addr <LEADER_NODE_IP>```, using the IP of the leader node.

The output of the above command generates the code that you should run in the remaining 2 nodes.

Copy the code and paste the command in each one of the 2 remaining nodes, so that the nodes join the swarm.

If necessary, check the instructions here: https://docs.docker.com/engine/reference/commandline/swarm_init/.

## Step 2
Load the repository's files and folders in each one of the nodes.

## Step 3
Create an overlay nertwork.

Run ```. overlay.sh``` in the leader node.

## Step 4
Assign an id in every node. 

Run ```. node_id.sh 1```, ```. node_id.sh 2```, ```. node_id.sh 3``` in each node correspondingly.

## Step 5
Pull the image from my docker hub (https://hub.docker.com/repositories/bsamot10).

Run ```. pull.sh``` in every node.

## Step 6
Start confluence services in every node.

Run ```. run.sh``` in every node.

## Step 7
Enter the containers to verify that confluent services are running.

Run ```. shell.sh``` in every node.

Run ```jps``` inside the containers.

If everything has gone well, the ```jps``` command should print all 5 services.
