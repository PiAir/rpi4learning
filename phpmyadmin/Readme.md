# phpMyAdmin

Technically you don't need this container, but it enables you to view the MariaDB database. And setup is super simple.

## Running the container
Starting the container is really simple, just run the shell-script

```
$ ./run-docker.sh
```
The script tells the container to listen to port 8080. 

Open http://[your-rpi4-ip]:**8080** in the browser. You should see the logon page. Because we haven't setup MariaDB yet, you can't login yet.

## More info

phpMyADmin on Dockerhub: https://hub.docker.com/r/phpmyadmin/phpmyadmin/

Note: if you use -e PMA_ARBITRARY=1 in the docker run command, you can connect to any database server. In our case, just being able to connect to the mariaDB container is enough.
