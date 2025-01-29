# Use Debian Bullseye as the base image
FROM debian:bullseye

# Update package lists and install MariaDB server
RUN apt update && \
    apt upgrade -y && \
    apt install -y mariadb-server && \
# create necessary directory for the socket for MariaDb
    mkdir -p /run/mysqld && \
# sets correct permissions for the directory where the socket is being created
    chown mysql:mysql /run/mysqld && \
    chmod 755 /run/mysqld

# Expose the default MariaDB port
EXPOSE 3306

# Copy MariaDB config to container
COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/

# Copy MariaDB init script to container
COPY ./tools/init.sql /etc/mysql/init.sql

# Start MariaDB in the foreground
CMD ["mysqld"]