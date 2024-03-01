
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

# Starts the mysqld process and explicitly binds it to the 0.0.0.0 address
# It listens on all available network interfaces for incoming connections
