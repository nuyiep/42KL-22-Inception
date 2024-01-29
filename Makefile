DC		=	sudo docker compose -f
YAML	=	./srcs/docker-compose.yml

all:
		$(DC) $(YAML) up -d --build

clean:
		$(DC) $(YAML) down

fclean:
		sudo docker stop $$(sudo docker ps -qa); sudo docker rm $$(sudo docker ps -qa); sudo docker rmi -f $$(sudo docker images -qa);

re:
		sudo make fclean; sudo make all

.PHONY:	all clean fclean re


# sudo docker volume rm $$(sudo docker volume ls -q); sudo docker network rm $$(sudo docker network ls -q)
# sudo docker stop $(sudo docker ps -aq); sudo docker rm $(sudo docker ps -aq); sudo docker rmi $(sudo docker images -q);
# sudo docker compose up