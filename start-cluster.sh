#!/bin/bash

docker run -d -t --dns 127.0.0.1 -e NODE_TYPE=s -P --name slave1 -h slave1.lacolhost.com alvinhenrick/hadoop-dn
FIRST_IP=$(docker inspect --format="{{.NetworkSettings.IPAddress}}" slave1)
docker run --rm -i -t --dns 127.0.0.1 -e NODE_TYPE=m -e JOIN_IP=$FIRST_IP -P --name master -h master.lacolhost.com alvinhenrick/hadoop-nn-dn

