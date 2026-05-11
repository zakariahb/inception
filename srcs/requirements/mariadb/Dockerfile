# FROM alpine:3.22

# RUN  apk update && apk add --no-cache mariadb mariadb-client

FROM alpine:3.22

RUN apk add --no-cache mariadb mariadb-client

RUN mkdir -p /run/mysqld && \
    chown -R mysql:mysql /run/mysqld

RUN mariadb-install-db --user=mysql --datadir=/var/lib/mysql

EXPOSE 3306

CMD ["mariadbd", "--user=mysql"]