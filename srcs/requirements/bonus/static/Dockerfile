FROM debian:buster

RUN apt-get update && apt-get install nginx -y \
    && rm -rf /var/lib/apt/lists/*

COPY conf/nginx.conf /etc/nginx/nginx.conf
COPY www/* /var/www/html/

EXPOSE 1234

CMD ["nginx", "-g", "daemon off;"]