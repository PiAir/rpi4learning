FROM php:7.4-apache

ADD ./start.sh /etc/apache2/start.sh

RUN apt-get update -y && apt-get install -y 
RUN apt-get install -y git-all
RUN apt-get install -y wget libzip-dev zip libpng-dev libicu-dev libxml2-dev 
RUN docker-php-ext-install mysqli pdo pdo_mysql zip gd intl xmlrpc soap 

RUN wget -O /var/www/moodle-${MOODLE_VERSION}.tar.gz https://github.com/moodle/moodle/archive/v${MOODLE_VERSION}.tar.gz && \
	rm -rf /var/www/html/ && \
	cd /var/www && tar xf moodle-${MOODLE_VERSION}.tar.gz && \
	rm moodle-${MOODLE_VERSION}.tar.gz && \
	mv /var/www/moodle-${MOODLE_VERSION} /var/www/html && \
	chown -R www-data:www-data /var/www/html && \
	chmod +x /etc/apache2/start.sh &&\
	mkdir -p /var/www/moodledata && chmod 777 /var/www/moodledata && \
	chown -R www-data:www-data /var/www/moodledata

COPY ./config.php /var/www/html/

EXPOSE 80
