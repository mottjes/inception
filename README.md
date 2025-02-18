# Inception

Inception is a System Administration project focused on Docker and containerization. It involves setting up a small infrastructure composed of different services using Docker containers.

## Overview

### Setup

1. NGINX with TLSv1.2 or TLSv1.3 only
2. WordPress + php-fpm (without NGINX)
3. MariaDB (without NGINX)

![inception_architecture](https://github.com/user-attachments/assets/5ef856a8-2557-43d5-b91a-4e9703ab1dd9)

### Prerequisites

- Custom Dockerfiles for each service
- Use Alpine or Debian (penultimate stable version)
- No ready-made Docker images (except Alpine/Debian)
- Two users in WordPress database (one administrator)
- NGINX as the only entrypoint (port 443, TLSv1.2 or TLSv1.3)
- Use of environment variables for sensitive data (.env file and Docker secrets)

More information about the project is in the [subject.pdf](https://github.com/mottjes/inception/blob/main/subject.pdf)

## Prerequisites

1. Install Docker and Docker Compose

2. Add the user to the docker group (to run docker commands without sudo and root mode)

## Usage

1. Clone the repository:
```
git clone https://github.com/mottjes/inception.git
```
2. Navigate to the project directory:
```
cd inception
```
3. Generate an self-signed SSL/TLS certificate and private key using OpenSSL for NGINX:
```
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout ./srcs/requirements/nginx/tools/ssl/nginx-selfsigned.key -out ./srcs/requirements/nginx/tools/ssl/nginx-selfsigned.crt -subj "/C=DE/L=WOB/O=42/OU=student/CN=mottjes.42.fr"
```
4. In the srcs folder, create an .env with the following variables
```
# wordpress setup
WP_ADMIN_USER=
WP_ADMIN_PASS=
WP_ADMIN_EMAIL=

WP_USER=
WP_USER_EMAIL=
WP_USER_PASS=

# mariadb setup
DB_NAME=
DB_USER=
DB_PASS=
DB_HOST=
DB_ROOT_PASS=
```
5. edit the hosts file to acess the Wordpress website with mottjes.42.fr (optional)
```
sudo nano /etc/hosts
```
paste in:
```
127.0.0.1 mottjes.42.fr
```
6. Build the images and deploy the infrastructure:
```
make build
```
7. Start the containers:
```
make up
```
8. Stop the containers:
```
make down
```
9. Remove all containers, images networks, and volumes
(!!! Run with sudo to remove all the wordpress and mariadb files for a full clean !!!)
```
make clean
```