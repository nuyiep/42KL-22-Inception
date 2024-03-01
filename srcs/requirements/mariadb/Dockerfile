
FROM		debian:bullseye

RUN		apt-get update \
                && apt-get install -y mariadb-server vim procps \
                && rm -rf /var/lib/apt/lists/* \
                && mkdir -p /var/run/mysqld \
                && mkdir -p /run/mysqld \
                && chown -R mysql:root /var/run/mysqld \
                && chown 777 /var/run/mysqld \
                && chown -R mysql:root /var/lib/mysql \
                && chown -R mysql:root /run/mysqld

EXPOSE		3306

COPY		tools/entrypoint.sh /entrypoint.sh
RUN		chmod +x /entrypoint.sh \
                && sed -i 's/127.0.0.1/0.0.0.0/g' /etc/mysql/mariadb.conf.d/50-server.cnf

ENTRYPOINT	["/entrypoint.sh"]
CMD		["mysqld", "--bind-address=0.0.0.0"]

# procps 
#   - process management tools
#   - e.g. ps, top, kill

# apt-get
#   - package management tools used on Debian-based Lnux distributions

# &&
#   - next command is executed only if the previous command succeeds (exits with a status code 0)

# chown -R mysql:root /var/run/mysqld
# Changes the ownership of the directory and all its contents recursively to the user 'mysql'
# and the group 'root'
# It ensures that the MySQL or MariaDB process running inside the container has the 
# necessary permissions to write to and access files within this directory

# chown 777 /var/run/mysql
# Changes the permissions of the directory to 777
# which grants full read, write and execute permissions to the owner, group and others

# sed -i 's/127.0.0.1/0.0.0.0/g' /etc/mysql/mariadb.conf.d/50-server.cnf
# -i - edit
# search for occurrences of 127.0.0.1 and replace them with 0.0.0.0
# g - substitute globally, for all occurences

# Starts the mysqld process and explicitly binds it to the 0.0.0.0 address
# It listens on all available network interfaces for incoming connections
