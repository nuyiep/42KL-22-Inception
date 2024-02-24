#!/bin/bash

# This file run in the container
# It starts the mariadb service
# Create the database and users
# Exec $@ run the next command in the Dockerfile
mkdir -p /run/mysqld
chown -R mysql:mysql /run/mysqld

if [ -d /var/lib/mysql/$MYSQL_DATABASE ]; then
	echo "Database exists"
else
	mysql_install_db --basedir=/usr --datadir=/var/lib/mysql --user=mysql > /dev/null

	touch /usr/local/bin/init.sql
	echo "USE mysql;
		FLUSH PRIVILEGES;
		CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;
		GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'localhost' IDENTIFIED BY '$MYSQL_PASSWORD';
		GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';
		ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_PASSWORD';
		FLUSH PRIVILEGES;" > /usr/local/bin/init.sql
	mysqld --user=mysql --bootstrap < /usr/local/bin/init.sql
fi

exec "$@"