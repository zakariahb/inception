𝙏𝙝𝙞𝙨 𝙥𝙧𝙤𝙟𝙚𝙘𝙩 𝙝𝙖𝙨 𝙗𝙚𝙚𝙣 𝙘𝙧𝙚𝙖𝙩𝙚𝙙 𝙖𝙨 𝙥𝙖𝙧𝙩 𝙤𝙛 𝙩𝙝𝙚 42 𝙘𝙪𝙧𝙧𝙞𝙘𝙪𝙡𝙪𝙢 𝙗𝙮 𝙯𝙖𝙡𝙖𝙠𝙨𝙮𝙖
## Description

This project consists of multiple services running in isolated Docker containers. The objective is to build a fully functional infrastructure where each service operates in its own container while communicating through a Docker network.

The project aims to strengthen understanding of system administration concepts by using Docker to manage containerized services, networking, and service isolation.


# Instructions 
- First you have to clone the repository and change you work directory to it.
- make build :
  this first command in the makefile that build each image in the docker compose.
- make up :
  this command run containers separetly.
- make down :
  this command stops and remouves the conatiners.
- make prune :
  this command clean everthing related with the conatiners like volumes and the networks.

- After starting the project:
  Website: https://localhost
  WordPress Admin: https://localhost/wp-admin
# Resources
 - Docker Deep Dive: Zero to Docker in a single book (link : https://ebooks.karbust.me/Technology/Docker%20Deep%20Dive%20-%20Nigel%20Poulton.pdf)
 - Docker docs  (https://docs.docker.com/get-started/)
 - https://youtu.be/DQdB7wFEygo?si=u7A0L1mUuVxgwcQa
 - the use case of ai is to explain just miss understanding is some resources abouve.
#  Project description
This project uses Docker to create a containerized infrastructure where multiple services run independently in isolated containers. Services such as NGINX, WordPress, and MariaDB communicate through Docker networks while remaining separated from the host system. Docker simplifies deployment by ensuring that each service includes its required dependencies and runs consistently across environments.
1. Virtual Machines vs Docker:

Both Virtual Machines and Docker are used to run applications in isolated environments, but they work differently.

Virtual Machines virtualize hardware and run a complete operating system for each instance. Since every VM includes its own operating system, they consume more system resources such as CPU, memory, and storage, making them heavier and slower to start.

Docker containers, on the other hand, share the host operating system kernel instead of running separate operating systems. This makes containers lightweight, faster, and more efficient in terms of resource usage.

In this project, Docker was chosen instead of Virtual Machines because it simplifies the management of multiple services while providing better performance and faster deployment.
2. Secrets vs Environment Variables:
Both Secrets and Environment Variables are used to provide configuration data to applications, but they serve different purposes.

Environment Variables are commonly used to configure applications with non-sensitive information such as ports, usernames, database names, or service settings. They are easy to use but can be exposed in logs or container inspection commands.

Secrets are designed to store sensitive information such as passwords, API keys, or private credentials. They provide better security by keeping confidential data separated from application configuration.

In this project, Environment Variables are used for general service configuration, while Secrets are used to securely manage sensitive data such as database passwords.
3. Docker Network vs Host Network
Docker provides different networking modes to manage how containers communicate with each other and with the outside world.
A **Docker Network (bridge network)** is the default and most commonly used mode. It creates an isolated virtual network where containers can communicate securely using their service names. Each container has its own network interface, and communication between containers is controlled and separated from the host system. External access is only possible if specific ports are explicitly exposed.
A **Host Network** removes this isolation by making the container use the host machine’s network directly. In this mode, the container shares the same network stack as the host, meaning it can use host ports without port mapping. While this can improve performance slightly, it reduces isolation and can lead to port conflicts and security risks.
4. Docker Volumes vs Bind Mounts
Docker Volumes and Bind Mounts are both used to share and persist data outside the container, but they have different use cases.
Docker Volumes are managed by Docker and stored on the host filesystem. They are mainly used for persistent data, such as databases or application files. Since the data is stored outside the container, it remains available even if the container is restarted, removed, or recreated.
Bind Mounts, on the other hand, allow a specific directory from the host machine to be mounted directly inside the container. Unlike volumes, the path is chosen and managed by the user on the host system. Bind mounts are commonly used during development or testing because changes made on the host are immediately reflected inside the container.
