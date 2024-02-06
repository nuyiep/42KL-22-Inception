# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: plau <plau@student.42.fr>                  +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/01/29 18:12:36 by plau              #+#    #+#              #
#    Updated: 2024/02/06 18:59:15 by plau             ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

DC		=	docker compose -f
YAML	=	./srcs/docker-compose.yml

all:
		$(DC) $(YAML) up -d --build

clean:
		$(DC) $(YAML) down

fclean:
		docker stop $$(docker ps -qa); docker rm $$(docker ps -qa); docker rmi -f $$(docker images -qa);

re:
		make fclean; make all

.PHONY:	all clean fclean re


# docker volume rm $$(docker volume ls -q); docker network rm $$(docker network ls -q)
# docker stop $(docker ps -aq); docker rm $(docker ps -aq); docker rmi $(docker images -q);
# docker compose up