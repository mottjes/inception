## pull debian bullseye as base image
FROM debian:bullseye

# update system and install mariadb
RUN apt update -y && \
    apt upgrade -y && \
    apt install mariadb-server -y

# allow port
EXPOSE 3306

# copy config and iniit.sql to container
COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/.
COPY ./conf/init.sql /etc/mysql/init.sql

# Create the necessary directory for the socket file
RUN mkdir -p /run/mysqld && \
    chown -R mysql:mysql /run/mysqld

# run mairadb in foreground
CMD ["mysqld"]