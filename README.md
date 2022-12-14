# DevOps: Task 7
Sperton DevOps Technical Test

## How to Deploy
__1. Install Git__
Open your console and run this command
```console
sudo apt-get install git
```
__2. Install Docker__
```console
sudo snap install docker
```
__3. Install Docker Compose__
```console
apt-get install docker-compose
```
__4. Init Docker Swarm__
```console
docker swarm init --advertise-addr 192.168.0.1
```
__5. Clone this Repository__
```console
git clone https://github.com/el-aprico/DevOps-Task-7.git && cd DevOps-Task-7
```
__6. Deploy the Application__
```console
./deploy.sh
```

## Explanation

Overall, the tech stack is :
* PHP 8.1 with Apache web server #https://hub.docker.com/_/php
We will deploy CakePHP Framework here.
I modify the homepage to see which server is serving the request.
Modify the bootstrap to enable .env and change cache setting (unfortunately, CakePHP doesn't allow to set cache directly from .env file).
The volume is not stored in container. So if we change the file, it will applied to all running container.
* MySQL 8.0 #https://hub.docker.com/_/mysql
To store data application.
* Redis 7.0.5 #https://hub.docker.com/_/redis
To store cache in application.
* phpMyAdmin 5.2.0 with Apache web server #https://hub.docker.com/_/phpmyadmin
To manage the database.
* phpRedisAdmin #https://hub.docker.com/r/erikdubbelboer/phpredisadmin
To manage the application cache.

Additional, i add the docker registry to store application image locally.
Its already up when you deploy the application.
* Docker registry #https://hub.docker.com/_/registry
To store your docker image locally.
* Docker registry frontend #https://hub.docker.com/r/konradkleine/docker-registry-frontend
To list all docker image.

## Testing
Open the browser and access:
* Docker registry frontend http://localhost:9003
* CakePHP http://0.0.0.0:9000
* phpMyAdmin http://0.0.0.0:9001
* phpRedisAdmin http://0.0.0.0:9002

#### Thank You
