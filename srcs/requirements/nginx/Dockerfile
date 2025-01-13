# pull debian bullseye as base image
FROM debian:bullseye

# update system and install nginx
RUN apt update -y && \
    apt upgrade -y && \
    apt install nginx -y

# allow port
EXPOSE 80

# copy config to container
COPY ./conf/default /etc/nginx/sites-available/default

# run nginx in foreground
CMD ["nginx", "-g", "daemon off;"]