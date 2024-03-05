
DC		=	docker compose -f
YAML	=	./srcs/docker-compose.yml
RMRF	=	sudo rm -rf

# -f specifies the location of the 
# Docker Compose YAML file that defines the services, networks, volumes
# and other configurations for a Docker Compose project

up:
		$(DC) $(YAML) up -d
# up - start and run Docker containers defined in YAML file
# -d detached mode (in the background)
# if image already exists locally, will not rebuild, just start the container
# if no image, will build images for services 

down:
		$(DC) $(YAML) down
# down - stop and removes containers

all:
		$(DC) $(YAML) up -d --build
# Build docker image

cclean:
		docker system prune --all --volumes --force
# Remove unused containers, networks, images and volumes
# Doesnt affect the data stored within the containers

fclean:
		docker stop $$(docker ps -qa);
		docker rm $$(docker ps -qa); \
		docker rmi -f $$(docker images -qa); \
		docker volume rm $$(docker volume ls -q); \
		docker network rm $$(docker network ls -q); \
		${RMRF} ~/data/wp_data/*; \
		${RMRF} ~/data/wp_website/*

re:
		make fclean; make all

.PHONY:	all down fclean re
