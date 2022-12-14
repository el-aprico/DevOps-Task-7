#!/bin/sh

TIMESTAMP=$(date +%s)
REGISTRY_PORT=5000
STACK_NAME=cake-php-stack

# build your local registry

echo "========= START =========" >>log.txt
echo "Start Time $(date '+%Y-%m-%d %H:%M:%S')" >>log.txt

if [ ! "$(docker ps -q -f name=registry)" ]; then
  docker-compose -f docker-compose-registry.yml -p docker-registry up --build -d
fi

echo "Command: Build docker registry localhost:${REGISTRY_PORT}/app-php:${TIMESTAMP}" >>log.txt

docker build -t localhost:${REGISTRY_PORT}/app-php:${TIMESTAMP} ./app-php/

docker push localhost:${REGISTRY_PORT}/app-php:${TIMESTAMP}

echo "Command: Run docker swarm" >>log.txt

sed -i "s/APP_VERSION=.*/APP_VERSION=${TIMESTAMP}/g" .env

export $(sed '/^#/d' .env)

docker stack deploy --compose-file docker-compose-app.yml ${STACK_NAME}

echo "End Time $(date '+%Y-%m-%d %H:%M:%S')" >>log.txt


echo "========= END =========" >>log.txt

