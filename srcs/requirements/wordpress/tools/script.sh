#!/bin/bash
cd /var/www/html/
if [ ! -f /var/www/html/wp-config.php ]; then
    curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
    chmod +x wp-cli.phar
    mv wp-cli.phar /usr/local/bin/wp
    wp core download --locale=en_US --allow-root
    
    wp config create --path="/var/www/html/" --dbname=$DATABASE --dbuser=$USER --dbpass=$PASSWORD --dbhost=$HOST:3306 --allow-root
    wp core install \
        --url=$HOSTNAME \
        --title=$TITLE \
        --admin_user=$ADMIN \
        --admin_password=$ADMINPASS \
        --admin_email=$ADMINEMAIL \
        --allow-root 
    wp user create $USERNAME $USEREMAIL --role=$ROLE \
        --user_pass=$USERPASS \
        --allow-root

fi
exec php-fpm8.2 -F