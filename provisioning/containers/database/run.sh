#!/bin/sh
BIN_DIR=$(cd `dirname "${BASH_SOURCE[0]}"` && pwd)
cd $BIN_DIR
source .env

docker run --name $CONTAINER_NAME \
  -p 45432:5432 \
  -d mdillon/postgis:9.4
