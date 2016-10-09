CREATE USER 'dev'@'%' IDENTIFIED WITH mysql_native_password AS '***';

GRANT USAGE ON *.* TO 'dev'@'%' REQUIRE NONE WITH MAX_QUERIES_PER_HOUR 0 MAX_CONNECTIONS_PER_HOUR 0 MAX_UPDATES_PER_HOUR 0 MAX_USER_CONNECTIONS 0;

CREATE DATABASE IF NOT EXISTS `dev`;

GRANT ALL PRIVILEGES ON `dev`.* TO 'dev'@'%';