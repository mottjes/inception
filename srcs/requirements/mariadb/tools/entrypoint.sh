#!/bin/bash

# Create necessary directory for the socket for MariaDB
    mkdir -p /var/run/mysqld

# To be able to delete mariadb data later on for testing purposes
    chmod -R 777 /var/lib/mysql

# Set correct permissions for the directory where the socket is being created
    chown -R mysql:mysql /var/run/mysqld

# Check if the init.sql is there
if [ ! -f "/etc/mysql/init.sql" ];
then
    echo "CREATE DATABASE IF NOT EXISTS $DB_NAME;" >> init.sql
    echo "CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$DB_PASS';" >> init.sql
    echo "GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'%' IDENTIFIED BY '$DB_PASS';" >> init.sql
    echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '$DB_ROOT_PASS';"
    echo "FLUSH PRIVILEGES;" >> init.sql
    mv init.sql /etc/mysql/init.sql
fi

# Start MariaDB server
exec "$@"