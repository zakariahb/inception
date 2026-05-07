# Use Alpine as the base image
FROM alpine:3.22

# Install nginx
RUN apk update && apk add --no-cache nginx openssl

# Create required directories
RUN openssl req -x509 -nodes -days 365 \
-newkey rsa:2048 \
-keyout nginx.key \
-out nginx.crt \
-subj "/C=MA/ST=Khouribga/L=Khouribga/O=MyCompany/CN=localhost"
# Copy custom nginx config (optional)
# COPY nginx.conf /etc/nginx/nginx.conf

# Expose HTTP port
EXPOSE 80

# Start nginx in foreground
CMD ["nginx", "-g", "daemon off;"]