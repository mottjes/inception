# Use Debian Bullseye as the base image
FROM debian:bullseye

# Update package lists and install NGINX
RUN apt update && \
    apt upgrade -y && \
    apt install -y nginx

# Expose port 80
EXPOSE 80

# Copy NGINX config to container
COPY ./conf/default /etc/nginx/sites-available/

# Start NGINX in the foreground
CMD ["nginx", "-g", "daemon off;"]
