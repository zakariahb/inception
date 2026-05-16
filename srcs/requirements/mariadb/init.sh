#!/bin/sh
set -e

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