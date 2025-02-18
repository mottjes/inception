#!/bin/bash

# create necessary directory for the socket for PHP-FPM
mkdir -p /run/php 

# go into the right directory
cd /var/www/html

# Check if WordPress config is there
if [ -f ./wp-config.php ]
then
    echo "WordPress is already installed."
else
    echo "WordPress is not installed. Installing..."

    # Download WP-CLI
    curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

    # Make it executable
    chmod +x wp-cli.phar

    # Move it to a directory in PATH
    mv wp-cli.phar /usr/local/bin/wp

    echo "WP-CLI installed successfully."

    # Download WordPress core on /var/www/html
    wp core download --path=/var/www/html --allow-root

    # Create a wp-config.php file
    wp config create --dbname=$DB_NAME --dbuser=$DB_USER --dbpass=$DB_PASS --dbhost=$DB_HOST --allow-root

    # Install WordPress
    wp core install --url=mottjes.42.fr --title=Inception --admin_user=$WP_ADMIN_USER --admin_password=$WP_ADMIN_PASS --admin_email=$WP_ADMIN_EMAIL --allow-root

    # create wordpress user
    wp user create $WP_USER $WP_USER_EMAIL --role=author --user_pass=$WP_USER_PASS --porcelain --allow-root

    # install theme
    wp theme install twentytwentyfour --activate --allow-root

    echo "WordPress installed successfully."
fi

# Start PHP-FPM in the foreground
exec "$@" 