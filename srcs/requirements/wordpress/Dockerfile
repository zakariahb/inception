FROM debian:12
RUN apt update && apt install -y \
    php-fpm \
    php-mysql \
    wget \
    curl
COPY conf/wordpress.conf  /etc/php/8.2/fpm/pool.d/wordpress.conf
COPY tools/script.sh /tmp/script.sh
RUN chmod +x /tmp/script.sh
CMD ["tmp/script.sh"]
