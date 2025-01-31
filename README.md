# Inception

Inception is a System Administration project focused on Docker and containerization. It involves setting up a small infrastructure composed of different services using Docker containers.

### ## Overview

- Use Alpine or Debian (penultimate stable version)
- Custom Dockerfiles for each service
- No ready-made Docker images (except Alpine/Debian)
- Two users in WordPress database (one administrator)
- NGINX as the only entrypoint (port 443, TLSv1.2 or TLSv1.3)
- Use of environment variables (recommended: .env file and Docker secrets)

More information about the project is in the [subject.pdf](https://github.com/mottjes/inception/blob/main/subject.pdf)

### Setup

1. NGINX with TLSv1.2 or TLSv1.3 only
2. WordPress + php-fpm (without NGINX)
3. MariaDB (without NGINX)

![inception_architecture](https://github.com/user-attachments/assets/5ef856a8-2557-43d5-b91a-4e9703ab1dd9)

## Usage

1. Clone the repository:
```
git clone https://github.com/Xperaz/inception.git
```
2. Navigate to the project directory:
```
cd inception
```
3. In the srcs folder, fill out the ExampleEnvFile with and save it as srcs/.env

...

4. Build the images and deploy the infrastructure:
```
make build
```
5. Start the containers:
```
make up
```
6. Stop the containers:
```
make down
```
7. Remove all containers, networks, and volumes
```
make clean
```
8. removes all Docker resources defined in the specified Docker Compose file and additionally removes local Docker images that were used by the services
```
make fclean
```
