echo -e "\njmx.sh"
docker exec confluent-<node_id> bash -c "echo 'JMX_PORT=9999' >> ~/.bashrc && source ~/.bashrc"
