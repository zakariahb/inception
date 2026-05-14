FROM debian:12

RUN apt update && apt install -y mariadb-server mariadb-client 

COPY init.sh /init.sh
RUN chmod +x init.sh 

CMD ["/init.sh"]