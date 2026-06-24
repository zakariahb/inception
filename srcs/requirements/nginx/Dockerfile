FROM debian:12

RUN apt update && apt install -y \
    nginx \
    openssl 
RUN openssl req -x509 -nodes -days 365 \
    -newkey rsa:2048 \
    -keyout /etc/nginx/zalaksya.key \
    -out /etc/nginx/zalaksya.crt \
    -subj "/C=MA"
COPY conf/nginx.conf /etc/nginx/conf.d/nginx.conf

CMD ["nginx", "-g", "daemon off;"]