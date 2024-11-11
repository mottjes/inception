# Pull the debian image
FROM debian:bullseye

# Install nginx
RUN apt -y update && apt -y install nginx

# Copy the config into the container
COPY ./conf/nginx.conf /etc/nginx/nginx.conf

# Allowed port
EXPOSE 443

# Starts nginx
CMD ["nginx", "-g", "daemon off;"]