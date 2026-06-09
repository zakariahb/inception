FROM debian:12

RUN apt update && apt install -y mariadb-server mariadb-client 
RUN mkdir -p /run/mysqld && chown -R mysql:mysql /run/mysqld
COPY conf/mariadb.cnf /etc/mysql/mariadb.conf.d/mariadb.cnf
COPY init.sh /init.sh
RUN chmod +x init.sh 

CMD ["/init.sh"]