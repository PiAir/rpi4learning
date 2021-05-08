# MariaDb

This container runs the MariaDB databaseserver. It is used by Xerte and by Moodle to store data.

## Setting up
In the init subfolder, you'll find a init.sql file with these SQL statements:
```
CREATE DATABASE IF NOT EXISTS `xerte-db`
	CHARACTER SET = 'utf8'
    COLLATE = 'utf8_unicode_ci';
CREATE OR REPLACE USER xerte@'%' IDENTIFIED BY 'AYUaFW5zhQvNzHHcv2q67gzfmMtvmpAD';
GRANT ALL PRIVILEGES ON `xerte-db`.* TO 'xerte'@'%' WITH GRANT OPTION;      
    
CREATE DATABASE IF NOT EXISTS `moodle-db`
	CHARACTER SET = 'utf8'
    COLLATE = 'utf8_unicode_ci';    
CREATE OR REPLACE USER moodle@'%' IDENTIFIED BY 'YVNex3CHq4yc2DzHYVNex3CHq4yc2DzH';
GRANT ALL PRIVILEGES ON `moodle-db`.* TO 'moodle'@'%' WITH GRANT OPTION;
```
The statements create 2 databases (xerte-db and moodle-db) and 2 users (xerte and moodle).
Take a note of the "IDENTIFIED BY" parts. These contain the passwords for those users. You can replace them with your own strong password, but you'll have to note them down for when you're installing Xerte and/or Moodle.

In the run-docker.sh file you'll find:
```
-e MYSQL_ROOT_PASSWORD=tbsp4RC9Pk5sRb5nQNXQDffL7nCTAJjr
```
As you might expect, this is the password for the "root" user. Again, you're free to change it.

## Running the container
Starting the container is done by running the shell-script

```
$ ./run-docker.sh
```
The container does not have a web interface. But if you've installed phpMyAdmin, you can now use it to connect en check if the databases and users have been created

```
Open http://[your-rpi4-ip]:**8081** in the browser.
User: root
Password: the password from run-docker.sh 
```

## More info

Mariadb on Dockerhub: https://hub.docker.com/_/mariadb
