
FROM    debian:bullseye

EXPOSE  3306

RUN     apt-get update \
        && apt-get install -y mariadb-server mariadb-client vim \
        && rm -rf /var/lib/apt/lists/* 
        #removes the package lists cache to reduce the image size
