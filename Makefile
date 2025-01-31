COMPOSE_FILE = ./srcs/docker-compose.yml

.PHONY: build up down logs clean help

all: up

# Build Docker images
build: 
	docker compose -f $(COMPOSE_FILE) build

# Start the application
up: 
	docker compose -f $(COMPOSE_FILE) up

# Stop the application
down:
	docker compose -f $(COMPOSE_FILE) down

# Remove all containers, networks, and volumes
clean: 
	docker compose -f $(COMPOSE_FILE) down -v
	rm -rf ~/data/mariadb/*
	rm -rf ~/data/wordpress/*

#removes all Docker resources defined in the specified Docker Compose file and additionally removes local Docker images that were used by the services
fclean:
	docker compose -f $(COMPOSE_FILE) down --rmi local -v
	rm -rf ~/data/mariadb/*
	rm -rf ~/data/wordpress/*

# Remove all unused containers, networks, images and volumes
prune:
	docker system prune --all --force --volumes

re: fclean start


# theme install necessary ???
# TLS with docker secrets
# change nginx server name to address
# ifs for entrypoints
# point login.42.fr to ip address
# Makefile:
# 	- mkdir /home/user/data/wordpress 
# 	- mkdir /home/user/data/mariadb
# .gitignore .env and make ExampleEnvFile
# eval sheet check
# readme