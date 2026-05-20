#!/bin/sh
set -e
<<<<<<< HEAD

rm -rf /tmp/init.sql
rm -rf /var/lib/mysql/*
=======
rm -rf /var/lib/mysql/*
rm -rf /tmp/init.sql/tmp/init.sql
>>>>>>> f7a35e6ea2f4d5e88401c44eb88eaa70310c7a7b
INIT_DB=/tmp/init.sql

cat > "$INIT_DB" <<EOF
CREATE DATABASE IF NOT EXISTS wordpress;
CREATE USER 'wordpress'@'%' IDENTIFIED BY 'password';
GRANT ALL PRIVILEGES ON wordpress.* TO 'wordpress'@'%';
FLUSH PRIVILEGES;
EOF

sleep 5

mariadb-install-db --user=mysql --datadir=/var/lib/mysql

mysqld --user=mysql --init-file="$INIT_DB"