#!/bin/sh
rm -rf /var/lib/mysql
set -e
if [ ! -d "/var/lib/mysql/mysql" ]; then
    mariadb-install-db --user=mysql \
       --datadir=/var/lib/mysql
       echo "Initializing DB..."
    mysqld_safe &
    echo "Initializing DB..."
    sleep 5
    echo "Initializing DB..."
    mysql -e "CREATE DATABASE wordpress;"
    mysql -e "GRANT ALL PRIVILEGES ON wordpress.* TO 'wordpress'@'%' IDENTIFIED BY 'password';"
    mysql -e "SHOW databases;"
    sleep 5
    mysqladmin shutdown
fi
exec mysqld --user=mysql
