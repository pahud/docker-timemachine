#!/bin/bash

AFP_SHARE_DIR='/o/tm'

docker stop timemachine
docker rm timemachine
docker run -d -h timemachine --name timemachine -p 548:548 \
-e AFP_SHARE_DIR=${AFP_SHARE_DIR} \
pahud/timemachine 
