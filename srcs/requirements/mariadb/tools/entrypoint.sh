#!/bin/bash

# Create necessary directory for the socket for MariaDB
    mkdir -p /var/run/mysqld

# Check if the database has been initialized
if [ ! -d "/var/lib/mysql/mysql" ];
then
    echo "Initializing MariaDB ..."

    # Set correct permissions for the directory where the socket is being created
    chown -R mysql:mysql /var/run/mysqld

    # initializes the database
    mariadb-install-db --user=mysql --datadir=/var/lib/mysql

    echo "CREATE DATABASE IF NOT EXISTS $DB_NAME;" >> init.sql
    echo "CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$DB_PASS';" >> init.sql
    echo "GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'%' IDENTIFIED BY '$DB_PASS';" >> init.sql
    echo "FLUSH PRIVILEGES;" >> init.sql

    mariadbd --user=mysql --bootstrap < init.sql

    rm init.sql

    echo "MariaDB initialization completed."
else
    echo "MariaDB already initialized, skipping initialization process."
fi

# To be able to delete mariadb data later on for testing purposes
    chmod -R 777 /var/lib/mysql

# Start MariaDB server
exec "$@"