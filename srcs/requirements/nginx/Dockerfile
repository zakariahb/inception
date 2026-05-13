# Use Alpine as the base image
FROM debian:12

# Install nginx
RUN apt update && apt install  nginx -y && apt install openssl

RUN mkdir -p /var/www/html && \
    echo "<html><body><h1>Welcome to nginx</h1><p>Hello from Docker</p></body></html>" > /var/www/html/index.html
# Create required directories
RUN openssl req -x509 -nodes -days 365 \
-newkey rsa:2048 \
-keyout /etc/nginx/zalaksya.key \
-out /etc/nginx/zalaksya.crt \
-subj "/C=MA/ST=Khouribga/L=Khouribga/O=MyCompany/CN=localhost"
# Copy custom nginx config (optional)
# COPY nginx.conf /etc/nginx/nginx.conf
COPY conf/nginx.conf /etc/nginx/http.d/default.conf

# Start nginx in foreground
CMD ["nginx", "-g", "daemon off;"]



FROM debian:12

RUN apt update && apt install -y \
    nginx \
    openssl \
 && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /var/www/html && \
    echo "<html><body><h1>Welcome</h1></body></html>" > /var/www/html/index.html

RUN openssl req -x509 -nodes -days 365 \
    -newkey rsa:2048 \
    -keyout /etc/nginx/zalaksya.key \
    -out /etc/nginx/zalaksya.crt \
    -subj "/C=MA/ST=Khouribga/L=Khouribga/O=MyCompany/CN=localhost"

COPY conf/nginx.conf /etc/nginx/nginx.conf

CMD ["nginx", "-g", "daemon off;"]