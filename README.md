# Inception

> **42 School Project — Docker Infrastructure**
>
> This project was created as part of the **42 curriculum** by **zalaksy**.

## 📖 Description

**Inception** is a system administration and DevOps project focused on building a small infrastructure using **Docker**.

The goal is to create a fully containerized web infrastructure where each service runs in its own isolated container and communicates with other services through a dedicated Docker network.

The infrastructure includes:

* **NGINX** — Web server and HTTPS entry point
* **WordPress** — Content management system
* **MariaDB** — Database server
* **Docker Compose** — Service orchestration
* **Docker Volumes** — Persistent data storage
* **Docker Networks** — Secure communication between containers

The project focuses on understanding **containerization, networking, persistent storage, service isolation, security, and infrastructure management**.

---

## 🏗️ Architecture

The infrastructure is composed of several independent containers:

```text
                    HTTPS :443
                        │
                        ▼
                ┌──────────────┐
                │    NGINX     │
                │ Web Server   │
                └──────┬───────┘
                       │
                       ▼
                ┌──────────────┐
                │  WordPress   │
                │  PHP-FPM     │
                └──────┬───────┘
                       │
                       ▼
                ┌──────────────┐
                │   MariaDB    │
                │   Database   │
                └──────────────┘

          All services communicate
          through a Docker network.
```

Each service is isolated in its own container, making the infrastructure easier to manage, reproduce, and troubleshoot.

---

# 🚀 Getting Started

## 1. Clone the repository

```bash
git clone https://github.com/zakariahb/inception.git
cd inception
```

## 2. Build the infrastructure

```bash
make build
```

This command builds the Docker images required by the project.

## 3. Start the services

```bash
make up
```

This starts the containers defined in the Docker Compose configuration.

## 4. Stop the services

```bash
make stop
```

This stops the running containers without removing them.

## 5. Remove the containers

```bash
make down
```

This stops and removes the project's containers.

## 6. Clean Docker resources

```bash
make prune
```

This removes Docker resources associated with the project, including containers, networks, and volumes.

> ⚠️ **Warning:** Removing volumes can permanently delete persistent application and database data.

---

# 🌐 Accessing the Application

After starting the infrastructure:

**Website**

```text
https://localhost
```

**WordPress Administration**

```text
https://localhost/wp-admin
```

Because the project uses HTTPS with a local certificate, your browser may display a certificate warning when accessing `localhost`.

---

# 🧠 Technical Concepts

## 1. Virtual Machines vs Docker

Both Virtual Machines and Docker provide isolated environments for running applications, but they use different approaches.

### Virtual Machines

A Virtual Machine virtualizes hardware and runs a complete operating system inside each virtual machine.

```text
Host OS
 ├── VM
 │    └── Guest OS
 │         └── Application
 ├── VM
 │    └── Guest OS
 │         └── Application
```

Because each VM includes its own operating system, VMs generally require more CPU, memory, and storage.

### Docker Containers

Docker containers share the host operating system's kernel while keeping applications and their dependencies isolated.

```text
Host OS
 └── Docker
      ├── Container → Application
      ├── Container → Application
      └── Container → Application
```

Containers are therefore generally **lighter, faster to start, and more resource-efficient** than traditional virtual machines.

### Why Docker?

Docker is well suited for this project because it allows multiple services to be isolated while making the infrastructure reproducible and easier to deploy.

---

## 2. Secrets vs Environment Variables

Both secrets and environment variables can provide configuration information to services, but they should not be treated the same way.

### Environment Variables

Environment variables are useful for non-sensitive configuration such as:

* Database names
* Usernames
* Ports
* Service configuration
* Application settings

For example:

```env
DB_NAME=wordpress
DB_USER=wordpress
```

However, environment variables can potentially be exposed through container inspection, logs, or other mechanisms.

### Secrets

Secrets are intended for sensitive information such as:

* Passwords
* API keys
* Private credentials
* Authentication tokens

In this project, environment variables are used for general configuration, while sensitive credentials are handled separately using secret files where appropriate.

This separation helps reduce the risk of accidentally exposing sensitive information.

---

## 3. Docker Network vs Host Network

Docker provides different networking modes for container communication.

### Docker Network

A Docker bridge network creates an isolated virtual network for containers.

Containers can communicate with each other using their service names.

For example:

```text
WordPress ───────► MariaDB
```

The containers remain isolated from the host network, and external access is only available through explicitly published ports.

This provides better isolation and makes service-to-service communication easier to manage.

### Host Network

With host networking, a container shares the host machine's network stack.

```text
Container
    │
    ▼
Host Network
```

Port mapping is not required because the container directly uses the host's network interfaces.

Although this can reduce networking overhead, it also reduces isolation and can create port conflicts.

### Why use a Docker Network?

For this project, an isolated Docker network provides a clean way for **NGINX, WordPress, and MariaDB** to communicate without unnecessarily exposing internal services to the host.

---

## 4. Docker Volumes vs Bind Mounts

Both Docker volumes and bind mounts allow data to persist outside a container, but they are managed differently.

### Docker Volumes

Docker volumes are managed by Docker and are commonly used for persistent application data.

For example:

```text
Container
    │
    ▼
Docker Volume
    │
    ▼
Persistent Data
```

If a container is removed and recreated, the data stored in the volume can remain available.

This makes volumes particularly useful for databases and persistent WordPress data.

### Bind Mounts

A bind mount maps a specific directory on the host directly into a container.

```text
Host Directory
      │
      ▼
Container Directory
```

The host path is explicitly controlled by the user.

Bind mounts are commonly useful during development because changes made on the host can immediately appear inside the container.

### Why use Volumes?

For this infrastructure, Docker volumes are useful for keeping important application and database data persistent independently of the lifecycle of the containers.

---

# 🛠️ Technologies Used

* **Docker**
* **Docker Compose**
* **NGINX**
* **WordPress**
* **MariaDB**
* **PHP-FPM**
* **Linux**
* **Bash**
* **Makefile**
* **Docker Networks**
* **Docker Volumes**
* **TLS / HTTPS**

---

# 📚 Resources

The following resources were used to understand Docker, containerization, and the concepts required for this project:

* [Docker Documentation](https://docs.docker.com/get-started/)
* *Docker Deep Dive — Nigel Poulton*
* Various Docker and system administration tutorials
* AI tools were used as a supplementary resource to clarify concepts and resolve misunderstandings when necessary.

> AI was used as a learning and clarification tool, while the implementation and understanding of the project were developed through hands-on work and documentation.

---

# 🎯 What I Learned

Through this project, I developed a better understanding of:

* Containerization
* Docker image creation
* Docker Compose
* Container networking
* Persistent storage
* Service isolation
* NGINX configuration
* HTTPS/TLS
* WordPress deployment
* MariaDB configuration
* Environment variables and secrets
* Linux system administration
* Debugging and troubleshooting infrastructure

The project gave me practical experience in designing and managing a **multi-container infrastructure**, which helped strengthen my understanding of DevOps and system administration.
