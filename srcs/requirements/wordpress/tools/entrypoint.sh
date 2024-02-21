#!/bin/sh

#check if a file named wp-config.php exists in the current directory
if [ -f ./wp-config.php ]
then
        echo "Wordpress has already been installed"
else
        wget http://wordpress.org/latest.tar.gz
	tar xfz latest.tar.gz
	mv wordpress/* .
        rm -rf latest.tar.gz
        rm -rf wordpress
        cp wp-config-sample.php wp-config.php
        sed -i "s/username_here/$MYSQL_USER/g" wp-config.php
	sed -i "s/password_here/$MYSQL_PASSWORD/g" wp-config.php
	sed -i "s/database_name_here/$MYSQL_DATABASE/g" wp-config.php
fi

exec "$@"
#replaces the shell process with the command-line arguments provided to the script
