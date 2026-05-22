FROM debian:12
RUN apt update && apt install -y \
    php-fpm \
    php-mysql \
    wget \
    curl

RUN wget https://wordpress.org/latest.tar.gz -P /tmp && \
    tar -xzf /tmp/latest.tar.gz -C /tmp

RUN mkdir -p /var/www/html && \
    mv /tmp/wordpress/* /var/www/html/

# Permissions
RUN chown -R www-data:www-data /var/www/html


COPY conf/wordpress.conf  /etc/php/8.2/fpm/pool.d/wordpress.conf
COPY conf/wp-config.php /var/www/html/wp-config.php
CMD ["php-fpm8.2", "-F"]
