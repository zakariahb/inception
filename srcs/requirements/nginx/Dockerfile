FROM debian:12

RUN apt update && apt install -y \
    nginx \
    openssl 

RUN mkdir -p /var/www/html && \
    echo "<html><body><h1>Welcome</h1></body></html>" > /var/www/html/index.html

RUN openssl req -x509 -nodes -days 365 \
    -newkey rsa:2048 \
    -keyout /etc/nginx/zalaksya.key \
    -out /etc/nginx/zalaksya.crt \
    -subj "/C=MA/ST=Khouribga/L=Khouribga/O=MyCompany/CN=localhost"

 COPY conf/nginx.conf /etc/nginx/conf.d/nginx.conf


CMD ["nginx", "-g", "daemon off;"]