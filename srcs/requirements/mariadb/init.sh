#!/bin/sh

set -e

rm -rf /var/lib/mysql/*

if [ ! -d "/var/lib/mysql/mysql" ]; then
    mysql_install_db --user=mysql --datadir=/var/lib/mysql
    echo "db initialized ........................................."
    nohup mysqld --user=mysql --datadir=/var/lib/mysql --bind-address=0.0.0.0 > /dev/null 2>&1 &

    sleep 5

    mysql -u root << EOF
    CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;
    CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';
    GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%';
    FLUSH PRIVILEGES;
EOF


fi


until false; do
    echo "ayayayayay"
    sleep 5
done