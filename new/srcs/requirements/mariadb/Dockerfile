# pull debian bullseye as base image
FROM debian:bullseye

# update system and install mariadb-server
RUN apt update && \
    apt upgrade -y && \
    apt install mariadb-server -y

# copy config to container
COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/

# allow port
EXPOSE 3306

# create necessary directory for mariadb to run
RUN mkdir -p /run/mysqld

# run mairadb in foreground
CMD ["mysqld"]