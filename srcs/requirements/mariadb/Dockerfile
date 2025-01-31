# Use Debian Bullseye as the base image
FROM debian:bullseye

# Update package lists and install MariaDB server
RUN apt update && \
    apt upgrade -y && \
    apt install -y mariadb-server

# Expose the default MariaDB port
EXPOSE 3306

# Copy MariaDB config to container
COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/

# Copy entrypoint script to container
COPY ./tools/entrypoint.sh .

# Make the entrypoint script executable
RUN chmod +x entrypoint.sh

# Set the entrypoint to the script
ENTRYPOINT ["./entrypoint.sh"]

# provides default arguments for the ENTRYPOINT
CMD ["mysqld"]