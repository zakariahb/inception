# Use Alpine as the base image
FROM alpine:3.22

# Install nginx
RUN apk update && apk add --no-cache nginx openssl

# Create required directories
RUN mkdir -p /var/www/html && \
    echo "<html><body><h1>Welcome to nginx</h1><p>Hello from Docker</p></body></html>" > /var/www/html/zakaria.html
RUN openssl req -x509 -nodes -days 365 \
-newkey rsa:2048 \
-keyout /etc/nginx/zalaksya.key \
-out /etc/nginx/zalaksya.crt \
-subj "/C=MA/ST=Khouribga/L=Khouribga/O=MyCompany/CN=localhost"
# Copy custom nginx config (optional)
# COPY nginx.conf 
COPY conf/nginx.conf /etc/nginx/http.d/default.conf
# Expose HTTP port
EXPOSE 443

# Start nginx in foreground

CMD ["nginx", "-g", "daemon off;"]