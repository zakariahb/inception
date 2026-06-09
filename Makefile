build:
	docker-compose -f srcs/docker-compose.yml build
up:
	docker-compose -f srcs/docker-compose.yml up -d
down :	
	docker-compose -f srcs/docker-compose.yml down
prune:
	docker system prune -a --volumes -f
#remouve the volumes from the host