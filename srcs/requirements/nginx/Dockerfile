# Pull the debian image
FROM debian:bullseye

# Update System, install nginx and generate a self-signed SSL/TLS certificate and its corresponding private key using OpenSSL.
RUN apt -y update && \
    apt -y upgrade && \
    apt -y install nginx openssl && \
    openssl req -new -x509 -days 365 -nodes -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt -subj '/C=DE/ST=NI/L=Wolfsburg/CN=mottjes.42.fr'

# Copy the nginx config into the container
COPY ./conf/nginx.conf /etc/nginx/conf.d

# Allow port
EXPOSE 443

# Starts nginx in foreground
CMD ["nginx", "-g", "daemon off;"]
