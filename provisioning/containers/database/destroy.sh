#!/usr/bin/env bash
BIN_DIR=$(cd `dirname "${BASH_SOURCE[0]}"` && pwd)
cd $BIN_DIR
source .env

./stop.sh
docker rm $CONTAINER_NAME
