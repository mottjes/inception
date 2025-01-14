# pull debian bullseye as base image
FROM debian:bullseye

# update system and install nginx
RUN apt update && \
    apt upgrade -y && \
    apt install nginx -y

# copy config to container
COPY ./conf/default /etc/nginx/sites-available/

# allow port
EXPOSE 80

# start nginx in foreground
CMD ["nginx", "-g", "daemon off;"]