#!/bin/bash

if [ ! -f /var/www/html/wp-config.php ]; then
    cp /tmp/wp-config.php /var/www/html/
fi

exec php-fpm8.2 -F