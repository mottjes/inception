CREATE DATABASE wordpress;
CREATE USER 'wpuser'@'%' IDENTIFIED BY 'password';
GRANT ALL PRIVILEGES ON my_database.* TO 'wpuser'@'%';
FLUSH PRIVILEGES;