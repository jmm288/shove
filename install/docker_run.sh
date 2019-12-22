#!/bin/bash

docker rm -f mysql
docker run -d --name mysql -p 3306:3306 -e "MYSQL_ROOT_PASSWORD=root" -v /mnt/mysql:/var/opt/mysql mysql:latest
docker exec -i mysql mysql -u root -proot <<< "create database shove";

docker rm -f shove
docker run -d --name shove -p 8000:8000 -p 5000:5000 -e DATABASE_NAME='shove' -e DATABASE_USER='root' -e DATABASE_PASSWORD='root' -e DATABASE_HOST='0.0.0.0' -e DATABASE_PORT='3306' 435901930649.dkr.ecr.us-east-1.amazonaws.com/shove:0.0.0