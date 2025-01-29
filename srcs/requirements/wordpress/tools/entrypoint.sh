#!/bin/bash

cd /var/www/html

# Check if WP-CLI is installed
if ! command -v wp &> /dev/null;
then
    echo "WP-CLI is not installed. Installing..."

    # Download WP-CLI
    curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

    # Make it executable
    chmod +x wp-cli.phar

    # Move it to a directory in PATH
    mv wp-cli.phar /usr/local/bin/wp

    echo "WP-CLI installed successfully."
else
    echo "WP-CLI is already installed."
fi

# Check if WordPress is installed
if ! wp core is-installed 2>/dev/null; 
then
    echo "WordPress is not installed. Installing..."

    # Download WordPress core on /var/www/html
    wp core download --path=/var/www/html --allow-root

    # Create a wp-config.php file
    wp config create --dbname=$DB_NAME --dbuser=$DB_USER --dbpass=$DB_PASSWORD --dbhost=$DB_HOST --allow-root

    # Install WordPress
    wp core install --url=$DOMAIN_NAME --title=$WP_TITLE --admin_user=$WP_ADMIN_USER --admin_password=$WP_ADMIN_PASS --admin_email=$WP_ADMIN_EMAIL --allow-root

    # create wordpress user
    wp user create $WP_USER $WP_USER_EMAIL --role=author --user_pass=$WP_USER_PASS --porcelain --allow-root

    echo "WordPress installed successfully."
else
    echo "WordPress is already installed."
fi

# Start PHP-FPM in the foreground
exec "$@"