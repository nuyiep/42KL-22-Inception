#!/bin/bash

# This file run in the container
# It starts the mariadb service
# Create the database and users
# Exec $@ run the next command in the Dockerfile

if [ -d /var/lib/mysql/$MYSQL_DATABASE ]; 
then
	echo "Database exists"
else
	mysql_install_db > /dev/null

	touch init.sql
	echo "USE mysql;
		FLUSH PRIVILEGES;
		CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;
		GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'localhost' IDENTIFIED BY '$MYSQL_PASSWORD';
		GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';
		ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_PASSWORD';
		FLUSH PRIVILEGES;" > init.sql
	mysqld --user=mysql --bootstrap < init.sql
fi

exec "$@"

# %  wildcard - any host
# ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_PASSWORD'
#   - change the password for the 'root' user account in MySQL to the 
# 	  value stored in the '$MYSQL_PASSWORD' when user connects from the localhost

# mysql_install_db > /dev/null
# mysql_install_db - initialize the mysql data directory 
#				   - create the necessary system tables
# /dev/null - special device file in Unix-like operating systems that discards all data
#			  written to it. Often used as a "black hole" to discard unwanted output
# Redirects any output produced by the comamnd to /dev/null, effectively discarding it
# Commonly done to suppress unnecessary output and keep the terminal clean
# Especially when running automated scripts or commands in the background where you don't need to see the output

# mysql_install_db --basedir=/usr --datadir=/var/lib/mysql --user=mysql > /dev/null
# if we didn't specify --basedir, --datadir, --user, default values will be used
# the above is the default values

# Flush privileges
# 	-	Reloads the privileges from the grant tables in the MySQL database
#	-	Ensures that any changes made to user privileges take effect immediately

# mysqld --user=mysql --bootstrap < init.sql
# --bootstrap is mainly used by mysql_install_db to create MySQL privilege tables
# doesn't start the MariaDB server
# accepts sql commands
# allow us to run the pre-requisite commands w/o starting the server
