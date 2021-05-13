FROM php:7.4-apache

ENV MOODLE_VERSION 3.10.4
ADD ./start.sh /etc/apache2/start.sh

RUN apt-get update -y && apt-get install -y 
RUN apt-get install -y git-all
RUN apt-get install -y wget libzip-dev zip libpng-dev libicu-dev libxml2-dev 
RUN docker-php-ext-install mysqli pdo pdo_mysql zip gd intl xmlrpc soap opcache

RUN wget -O /var/www/moodle-${MOODLE_VERSION}.tar.gz https://github.com/moodle/moodle/archive/v${MOODLE_VERSION}.tar.gz && \
	rm -rf /var/www/html/ && \
	cd /var/www && tar xf moodle-${MOODLE_VERSION}.tar.gz && \
	rm moodle-${MOODLE_VERSION}.tar.gz && \
	mv /var/www/moodle-${MOODLE_VERSION} /var/www/html && \
	chown -R www-data:www-data /var/www/html && \
	chmod +x /etc/apache2/start.sh &&\
	mkdir -p /var/www/moodledata && chmod 777 /var/www/moodledata && \
	chown -R www-data:www-data /var/www/moodledata

EXPOSE 80
