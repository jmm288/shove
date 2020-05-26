#!/bin/bash
user=${1:-'jbarton'}
database_name=${2:-'pige'}
database_password=${3:-'mysqltest'}
database_host=${4:-'0.0.0.0'}

docker rm -f mysql
docker run -d --name mysql -p 3306:3306 -e "MYSQL_ROOT_PASSWORD=root" -v /mnt/mysql:/var/opt/mysql mysql:latest
echo "waiting 15 seconds to ensure MySQL starts up fully..."
sleep 15
docker exec -i mysql mysql -u root -proot <<< "create database $database_name";
docker exec -i mysql mysql -u root -proot <<< "create user $user@$database_host identified by '$database_password'";
docker exec -i mysql mysql -u root -proot <<< "grant all privileges on $database_name.* to '$user'@'$database_host'";
docker rm -f pig-e
docker run -d --name pig-e -p 8000:8000 -p 5000:5000 -e DATABASE_NAME=$database_name -e DATABASE_USER=$user -e DATABASE_PASSWORD=$database_password -e DATABASE_HOST=$database_host -e DATABASE_PORT='3306' 435901930649.dkr.ecr.us-east-1.amazonaws.com/pig-e:0.0.0