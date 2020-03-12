#!/bin/bash

DOCKER_TAG="mxbn/zeppelin"

if [[ "$(docker images -q $DOCKER_TAG 2> /dev/null)" == "" ]]; then
    mkdir -p logs
    mkdir -p notebook
    docker build . -t $DOCKER_TAG
fi

docker run --rm -p 8080:8080 -v $PWD/logs:/logs -v $PWD/notebook:/notebook -e ZEPPELIN_LOG_DIR="/logs" -e ZEPPELIN_NOTEBOOK_DIR="/notebook" --name zeppelin $DOCKER_TAG
