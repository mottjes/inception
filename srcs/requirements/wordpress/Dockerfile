# pull debian bullseye as base image
FROM debian:bullseye

# update system and install php-fpm and curl
RUN apt update -y && \
    apt upgrade -y && \
    apt install php-fpm php-mysqli curl -y

# create folder to start php-fpm
RUN mkdir -p /run/php

# allow port
EXPOSE 9000

# copy config and script to container
COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d/.
COPY ./conf/script.sh .
RUN chmod +x script.sh

# run script to start php-fpm in foreground
CMD ["./script.sh"]