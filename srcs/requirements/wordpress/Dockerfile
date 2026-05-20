FROM debian:12
<<<<<<< HEAD
RUN apt update && apt install -y wget
RUN cd /tmp
RUN wget https://wordpress.org/latest.tar.gz && tar -xf latest.tar.gz
RUN apt install php php-fpm -y
COPY wp.sh /wp.sh
RUN chmod +x wp.sh
CMD ["php-fpm8.2","-F"]
# RUN mv wordpress /var/www/html && chown www-data:www-data /var/www/html -R
=======

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
>>>>>>> f7a35e6ea2f4d5e88401c44eb88eaa70310c7a7b
