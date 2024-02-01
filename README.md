
# 42KL-22-Inception

## Docker
    -   Port 443
        Standard port for HTTPS
    -   Port 80
        HTTP
---

## Docker commands
    1. docker ps -qa
        -   -q stands for "quiet" mode, which outputs only container IDs, rather than their full details
        -   -a "all"- show all containers, both running and stopped ones
        -   By default, docker ps only shows running containers, but with -a, it includes all containers

    2. docker stop $(docker ps -qa)
        -   stops all running Docker containers by first listing all container IDs using docker ps -qa,
        -   then passing these IDs to the docker stop command
    
    3. docker rm $(docker ps -qa)
        -   remove a container
    
    4.  docker images -qa

    5.  docker rmi -f $(docker images -qa)

