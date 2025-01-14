# pull debian bullseye as base image
FROM debian:bullseye

# update system and install php-fmp and curl
RUN apt update && \
    apt upgrade -y && \
    apt install php-fpm php-mysqli curl -y

# copy config to container
COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d/.

# create necessary directory for php-fpm to run
RUN mkdir -p /run/php

# allow port
EXPOSE 9000

# start php-fpm in foreground
CMD ["php-fpm7.4", "-F"]