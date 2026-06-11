# Services Provided by the Stack

**WordPress** is a free, open-source application used to build and manage websites.
**NGINX** is a web server that accepts user requests and serves the WordPress website over HTTPS.
**MariaDB** is a database management system (DBMS) that stores and manages WordPress data, such as posts, users, and settings.

# Start and stop the project 

for starting the project we need the build the image and run the containers , we can do that with two commads :

- make build : this command build the images .
- make up : run the containers.

for stoping  the containers 

- make stop : stops the running containers
- make down : this command stops and remouves the containers
- make prune : this command clear everything , containers , volumes , and the networks.

# Access the website and the administration panel 

website : https://zalaksya.42.fr
administration panel : https://zalaksya.42.fr/wp-admin

# Locate and manage credentials

Users can view, update, and manage their login credentials securely.

# Check that the services are running correctly

- docker ps : check if the containers are running correctly.
- docker ps -a : list all the containers the running and the stoped containers.
- docker logs <container_name> : if a container not running , the logs are checked like this.

