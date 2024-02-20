
FROM        debian:buster
RUN         apt-get update \
            && apt-get install -y \
            vim \
            wget \
            curl \
            bash \
            php7.3-fpm \
            php7.3-mysql

COPY        ./conf/www.conf /etc/php/7.3/fpm/pool.d

# download WP-CLI PHAR file from its official repo
ADD         https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar /usr/local/bin/wp-cli.phar

# make it executable within the Docker image
# allows users to run WP-CLI commands within containers based on this image
RUN         chmod +x /usr/local/bin/wp-cli.phar \
            && php /usr/local/bin/wp-cli.phar --info \
            && mv /usr/local/bin/wp-cli.phar /usr/local/bin/wp

EXPOSE      9000
