if [ -z $1 ]
then
        echo "ERROR: please input the 'node_id' command line argument.";
        exit 1;
fi

for file in {run.sh,shell.sh,myid.sh,connect-properties.sh,server-properties.sh,services.sh,conf/myid,conf/connect-distributed.properties,conf/server.properties};
do sed -i "s/<node_id>/$1/g" $file; done;
