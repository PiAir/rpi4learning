docker run -d --name=mariadb -p 3306:3306 --restart=always --network=rpi4learning -e MYSQL_ROOT_PASSWORD=tbsp4RC9Pk5sRb5nQNXQDffL7nCTAJjr -v $PWD/data:/var/lib/mysql -v $PWD/init:/docker-entrypoint-initdb.d mariadb:10.6.0 --character-set-server=utf8mb4 --collation-server=utf8mb4_unicode_ci