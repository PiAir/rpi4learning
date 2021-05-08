chmod 0777 $PWD/USER-FILES
docker run -td --name=xerte -p 8041:80 --network=rpi4learning --restart=unless-stopped -v $PWD/php.ini:/usr/local/etc/php/php.ini -v $PWD/USER-FILES:/var/www/html/xerteonlinetoolkits/USER-FILES rpi4learningbox/xerte:3.9
