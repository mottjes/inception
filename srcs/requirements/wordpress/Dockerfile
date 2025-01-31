# Use Debian Bullseye as the base image
FROM debian:bullseye

# Update package lists and install PHP-FPM and curl
RUN apt update && \
    apt upgrade -y && \
    apt install -y \
    php7.4-fpm \
    php7.4-mysql \
    curl

# Expose port 9000
EXPOSE 9000

# Copy PHP-FPM config to container
COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d/

# Copy entrypoint script to container
COPY ./tools/entrypoint.sh .

# Make the entrypoint script executable
RUN chmod +x entrypoint.sh

# Set the entrypoint to the script
ENTRYPOINT ["./entrypoint.sh"]

# provides default arguments for the ENTRYPOINT
CMD ["php-fpm7.4", "-F"]