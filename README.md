
# 42KL-22-Inception

### Docker
    -   Port 443
        Standard port for HTTPS
    -   Port 80
        HTTP
---
### Docker 
    1.  Docker volume
        -   Used to persist data generated by Docker containers, they exist independently of the containers

    2.  Docker network
        -   Allow Docker containers to communicate with each other and with the outside world
        -   Docker networking provides a range of networking options
            - Default Bridge Network: When you install Docker, it creates a default bridge network. By default, containers are attached to this network, allowing them to communicate using IP addresses within the same network
____

### Docker commands
    1. docker ps
        -   List all running containers

    2.  docker images
        -   List Docker images that are available locally
        -   Docker images are used as templates to create Docker containers
  
    3. docker ps -qa
        -   -q stands for "quiet" mode, which outputs only container IDs, rather than their full details
        -   -a "all"- show all containers, both running and stopped ones
        -   By default, docker ps only shows running containers, but with -a, it includes all containers
  
    4. docker stop $(docker ps -qa)
        -   Stops all running Docker containers by first listing all container IDs using docker ps -qa,
        -   Then passing these IDs to the docker stop command
    
    5. docker rm $(docker ps -qa)
        -   Remove a container
    
    6.  docker rmi -f $(docker images -qa)
        -   Remove Docker images
        -   -f force forcibly remove
        -   if no -f, Docker will not delete an image if it is being used by one or more containers, and it will display an error message indicating that the image is in use
  
    7.  $(docker network ls -q) 2>/dev/null
        -   2>/dev/null
            -   Redirects standard error (stderr) to /dev/null
            -   /dev/null is a special device file that discards data written to it

___

### Docker v docker-compose
    - Docker
      - Containerization Engine
        - A containerization platform that provides tools for building, running and managing containers. 
        - Includes the Docker Engine, which is responsible for building, running, and managing containers
      - Single Container Management
    - Docker compose
      - Application orchestration
        - A tool for defining and running multi-container Docker applications
        - Allows you to define the services, networks, volumes, and other configurations for a multi-container application in a single YAML file (docker-compose.yml)
___

### Useful commands

    -   Add user to docker group
        sudo usermod -aG docker $USER
___

### Nginx Dockerfile

    -   Use to build a Docker image for an nginx web server with SSL support
    -   FROM debian:buster
        -   spe
