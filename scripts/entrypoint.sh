#!/bin/bash

apt update && apt install php php-mysql mysql-server -y

service mysql start

mysql --user=root --execute="CREATE DATABASE hesk;"

php -S 0.0.0.0:8000