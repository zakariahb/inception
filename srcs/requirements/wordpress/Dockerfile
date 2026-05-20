FROM debian:12

RUN apt update && apt install -y \
    wget \
    tar \
    php \
    php-fpm \
    php-mysql \
    php-curl \
    php-gd \
    php-mbstring \
    php-xml \
    php-zip

# Download WordPress
RUN wget https://wordpress.org/latest.tar.gz -P /tmp && \
    tar -xzf /tmp/latest.tar.gz -C /tmp

# Move to web root
RUN mkdir -p /var/www/html && \
    mv /tmp/wordpress/* /var/www/html/

# Permissions
RUN chown -R www-data:www-data /var/www/html

WORKDIR /var/www/html

CMD ["php-fpm8.2", "-F"]