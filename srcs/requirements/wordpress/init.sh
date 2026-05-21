#!/bin/bash

# Wait for DB (important in Docker)
until mysqladmin ping -h mariadb --silent; do
  sleep 2
done

# Create wp-config.php automatically
cp /var/www/html/wp-config-sample.php /var/www/html/wp-config.php

# Inject DB values from env
sed -i "s/database_name_here/$MYSQL_DATABASE/" /var/www/html/wp-config.php
sed -i "s/username_here/$MYSQL_USER/" /var/www/html/wp-config.php
sed -i "s/password_here/$MYSQL_PASSWORD/" /var/www/html/wp-config.php
sed -i "s/localhost/mariadb/" /var/www/html/wp-config.php

# Start PHP-FPM
exec php-fpm -F
