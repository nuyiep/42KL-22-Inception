FROM        debian:buster
RUN         apt-get update && apt-get install -y \
            wget \
            curl \
            bash \
            php7.3 \
            php-cgi \
            php-mysql \
            php7.3-fpm \
            php-pdo \
            php-gd \
            php-cli \
            php-mbstring \
            && rm -rf /var/lib/apt/lists/*

COPY        ./conf/www.conf /etc/php/7.3/fpm/pool.d
COPY        ./tools/entrypoint.sh /entrypoint.sh

# download WP-CLI PHAR file from its official repo
ADD         https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar /usr/local/bin/wp

# make it executable within the Docker image
# allows users to run WP-CLI commands within containers based on this image
RUN         chmod +x /usr/local/bin/wp \
            && chmod +x /entrypoint.sh \
            && mkdir /run/php

WORKDIR     /var/www/html

EXPOSE      9000

ENTRYPOINT  ["/entrypoint.sh"]
CMD         ["/usr/sbin/php-fpm7.3", "-F"]
