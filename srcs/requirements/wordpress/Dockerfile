FROM debian:12
RUN apt update && apt install -y wget
RUN cd /tmp
RUN wget https://wordpress.org/latest.tar.gz && tar -xf latest.tar.gz
# RUN mv wordpress /var/www/html && chown www-data:www-data /var/www/html -R