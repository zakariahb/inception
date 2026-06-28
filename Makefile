build:
	mkdir -p ${HOME}/data/mariadb
	mkdir -p ${HOME}/data/wordpress
	docker-compose -f srcs/docker-compose.yml build
up:
	docker-compose -f srcs/docker-compose.yml up -d
start :	
	docker-compose -f srcs/docker-compose.yml start
stop :	
	docker-compose -f srcs/docker-compose.yml stop
down :	
	docker-compose -f srcs/docker-compose.yml down
prune : down
		docker system prune -a --volumes -f
		rm -rf ${HOME}/data