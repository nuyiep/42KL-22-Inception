
FROM    debian:buster
RUN     apt-get update && apt-get install -y nginx openssl

COPY	./conf/nginx.conf /etc/nginx/nginx.conf

RUN     mkdir -p /etc/nginx/ssl && openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
		-keyout /etc/nginx/ssl/plau.key -out /etc/nginx/ssl/plau.crt \
	    -subj "/C=MY/ST=Selangor/L=Kuala Lumpur/O=42KL/OU=plau/CN=plau.42.fr"

EXPOSE	443
CMD     ["nginx", "-g", "daemon off;"]
 