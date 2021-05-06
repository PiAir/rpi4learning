docker run -td --name=xerte -p 8041:80 --network=rpi4learning -v $PWD/php.ini:/usr/local/etc/php/php.ini -v $PWD/USER-FILES:/var/www/html/xerteonlinetoolkits/USER-FILES rpi4learningbox/xerte:latest
