FROM debian:12
RUN apt update && apt install -y \
    php-fpm \
    php-mysql \
    wget \
    curl
RUN sed -i 's|^listen = .*|listen = 0.0.0.0:9000|' \
    /etc/php/8.2/fpm/pool.d/www.conf
COPY tools/script.sh /tmp/script.sh
RUN chmod +x /tmp/script.sh
CMD ["/tmp/script.sh"]
