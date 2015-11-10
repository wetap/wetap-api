#!/bin/sh
BIN_DIR=$(cd `dirname "${BASH_SOURCE[0]}"` && pwd)
cd $BIN_DIR
source .env

docker stop $CONTAINER_NAME
