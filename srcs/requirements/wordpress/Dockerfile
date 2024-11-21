# Pull the debian image
FROM debian:bullseye

# Update System and install
RUN apt -y update && \
    apt -y upgrade && \
    apt -y install php-fpm

# Starts php-fpm in foreground
CMD ["php-fpm", "-F"]