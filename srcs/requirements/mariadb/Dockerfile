FROM debian:bookworm

RUN apt update && apt install -y mariadb-server mariadb-client
RUN mkdir  -p /run/mysqld && chown -R mysql:mysql /run/mysqld
COPY conf/mariadb.cnf /etc/mysql/mariadb.conf.d/mariadb.cnf
COPY tools/script.sh tmp/script.sh
RUN chmod +x tmp/script.sh 

CMD ["tmp/script.sh"]