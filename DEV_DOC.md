# Set up the environment from scratch

Before starting, Docker must be installed.
The project also requires a .env file to store environment variables such as database credentials and configuration values.
These values are used to securely configure the services.

# Build and launch the project using Makefile and Docker Compose

- Using Makefile:
make build → build the Docker images
make up → start the containers
- Using Docker Compose:
docker compose build → build the images
docker compose up → start the containers

# Use relevant commands to manage the containers and volumes

View running containers: **docker ps**
View all containers: **docker ps -a**
View logs: **docker logs <container_name>**
Stop a container: **docker stop <container_name>**
Remove containers and volumes: **docker compose down -v**

# Identify where the project data is stored and how it persists

The project uses Docker volumes to persist data.
This ensures that data is not lost when containers are restarted or recreated.