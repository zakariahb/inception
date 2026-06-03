#!/bin/sh
set -e

rm -rf /var/lib/mysql/*
rm -rf /tmp/init.sql/tmp/init.sql
INIT_DB=/tmp/init.sql

cat > "$INIT_DB" <<EOF
CREATE DATABASE IF NOT EXISTS $DATABASE;
CREATE USER $USER@'%' IDENTIFIED BY $PASSWORD;
GRANT ALL PRIVILEGES ON $DATABASE.* TO $USER@'%';
FLUSH PRIVILEGES;
EOF

sleep 5

mariadb-install-db --user=mysql --datadir=/var/lib/mysql

mysqld --user=mysql --init-file="$INIT_DB"