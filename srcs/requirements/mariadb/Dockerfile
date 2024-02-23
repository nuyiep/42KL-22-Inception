FROM    debian:bullseye

EXPOSE  3306

# Install Mariadb
RUN	apt update && \
	apt install -y --no-install-recommends --no-install-suggests \
        # Avoid unnecessary packages
	mariadb-server && \
	rm -rf /var/lib/apt/lists/*
        #removes the package lists cache to reduce the image size

# Copy our config file
COPY    conf/mysqld.conf /etc/mysql/mariadb.conf.d/
        # source destination

COPY    tools/entrypoint.sh /bin/
RUN     chmod +x /bin/entrypoint.sh

ENTRYPOINT [ "/bin/entrypoint.sh" ]

# Starts the mysqld process and explicitly binds it to the 0.0.0.0 address
# It listens on all available network interfaces for incoming connections
CMD ["mysqld", "--bind-address=0.0.0.0"]
