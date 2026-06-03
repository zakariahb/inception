cd /var/www/html
set -e

if [ ! -f wp-config.php ]; then
    echo "Downloading WordPress..."
    ls -la
    wp core download --allow-root || echo "Error: wp core download"
    wp config create --dbname=$DB_NAME --dbuser=$DB_USER --dbpass=$DB_PASSWORD --dbhost=$DB_HOST --allow-root || echo "Error: wp config create"
    wp core install --url=$WORDPRESS_URL --title=$WORDPRESS_TITLE --admin_user=$WORDPRESS_ADMIN_USER --admin_password=$WORDPRESS_ADMIN_PASSWORD --admin_email=$WORDPRESS_ADMIN_EMAIL --allow-root || echo "Error: wp core install"
    wp user create $WP_GST_USER $WP_GST_EMAIL --role=author --user_pass=$WP_GST_PASSWORD --allow-root || echo "Error: wp user create"
    echo "WordPress downloaded and configured."
else
    echo "WordPress is already downloaded."
fi

# Set proper permissions
chown -R www-data:www-data /var/www/html
chmod -R 755 /var/www/html

echo "Starting PHP-FPM..."
php-fpm7.4 -F