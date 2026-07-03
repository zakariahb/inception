FROM debian:12

RUN apt update && apt install -y mariadb-server mariadb-client
RUN mkdir  -p /run/mysqld && chown -R mysql:mysql /run/mysqld
RUN sed -i 's/^bind-address.*/bind-address = 0.0.0.0/' \
    /etc/mysql/mariadb.conf.d/50-server.cnf
COPY tools/init.sh tmp/init.sh
RUN chmod +x tmp/init.sh 

CMD ["tmp/init.sh"]
