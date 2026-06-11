FROM debian:12

RUN apt update && apt install -y mariadb-server mariadb-client
RUN mkdir  -p /run/mysqld && chown -R mysql:mysql /run/mysqld
# RUN mkdir -p /run/mysqld && chown -R mysql:mysql /run/mysqld
COPY conf/mariadb.cnf /etc/mysql/mariadb.conf.d/mariadb.cnf
COPY tools/init.sh tmp/init.sh
RUN chmod +x tmp/init.sh 

CMD ["tmp/init.sh"]