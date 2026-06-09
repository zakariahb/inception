#!/bin/sh
set -e

INIT_DB=/tmp/init.sql

cat > "$INIT_DB" <<EOF
CREATE DATABASE IF NOT EXISTS $DATABASE;
CREATE USER '$USER'@'%' IDENTIFIED BY '$PASSWORD';
GRANT ALL PRIVILEGES ON $DATABASE.* TO '$USER'@'%';
FLUSH PRIVILEGES;
EOF

sleep 5

if [ ! -d /var/lib/mysql/mysql ]; then
    mariadb-install-db --user=mysql --datadir=/var/lib/mysql
fi

mysqld --user=mysql --init-file="$INIT_DB"