COMPOSE_FILE = ./srcs/docker-compose.yml
DATA_DIR = $(HOME)/data

.PHONY: create_dirs build up down logs clean

all: create_dirs up

create_dirs:
	mkdir -p $(DATA_DIR)/wordpress
	mkdir -p $(DATA_DIR)/mariadb

build: create_dirs
	docker compose -f $(COMPOSE_FILE) build

up: create_dirs
	docker compose -f $(COMPOSE_FILE) up -d

down:
	docker compose -f $(COMPOSE_FILE) down

logs:
	docker compose -f $(COMPOSE_FILE) logs -f

clean: 
	docker compose -f $(COMPOSE_FILE) down --rmi all --volumes
	sudo rm -rf $(DATA_DIR)

prune:
	docker system prune --all --force --volumes

re: clean up