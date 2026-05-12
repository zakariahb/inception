# FROM alpine:3.22

# RUN  apk update && apk add --no-cache mariadb mariadb-client
# # RUN mariadb-secure-installation
# # RUN mariadb-install-db --user=mysql --datadir=/var/lib/mysql
# # COPY init.sh /init.sh

# # RUN chmod +x /init.sh

# CMD ["mariadb"]

# # CMD ["/etc/init.d/mariadb", "setup"]

FROM alpine:3.22

RUN apk add --no-cache mariadb mariadb-client

# Create runtime directories
RUN mkdir -p /run/mysqld /var/lib/mysql && \
    chown -R mysql:mysql /run/mysqld /var/lib/mysql

# Initialize database
RUN mariadb-install-db --user=mysql --datadir=/var/lib/mysql

EXPOSE 3306

# Run server in foreground
CMD ["mariadbd", "--user=mysql", "--console"]