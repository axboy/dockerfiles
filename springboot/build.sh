#!/bin/bash
cd $(cd $(dirname $0) && pwd )

IMAGE_NAME='local/xxx-api'
CONTAINER_NAME='xxx-api'
PORT=8080

docker build -t ${IMAGE_NAME} .

count=`docker ps -a | grep ${CONTAINER_NAME} | wc -l`
if [ $count -gt 0 ];then
    echo 'stop & rm old container'
    docker stop ${CONTAINER_NAME}
    docker rm ${CONTAINER_NAME}
fi

echo 'run new container'
docker run -d --name ${CONTAINER_NAME} \
    -m 3g \
    -p ${PORT}:8080 \
    -e BOOT_ENV='dev' \
    -v /etc/localtime:/etc/localtime:ro \
    -v /data/logs/${CONTAINER_NAME}:/app/logs \
    ${IMAGE_NAME}