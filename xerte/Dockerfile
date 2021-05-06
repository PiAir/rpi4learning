FROM php:7.4-apache
ENV XERTE_VERSION 3.9
ENV TSUGI_VERSION 21.04.24

ENV APACHE_DOCUMENT_ROOT /var/www/html/xerteonlinetoolkits
ENV XERTE https://github.com/thexerteproject/xerteonlinetoolkits/archive/refs/tags/v${XERTE_VERSION}.tar.gz
ENV TSUGI https://github.com/tsugiproject/tsugi/archive/refs/tags/${TSUGI_VERSION}.tar.gz
RUN sed -ri -e 's!/var/www/html!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/sites-available/*.conf
RUN sed -ri -e 's!/var/www/!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/apache2.conf /etc/apache2/conf-available/*.conf

RUN apt-get update -y && apt-get install -y 
RUN apt-get install -y git-all
RUN apt-get install -y wget
RUN docker-php-ext-install mysqli pdo pdo_mysql

WORKDIR /var/www/html

RUN wget ${XERTE}
RUN tar -zxvf *.tar.gz
RUN mv xerteonlinetoolkits-${XERTE_VERSION} xerteonlinetoolkits

RUN rm *.tar.gz

RUN wget ${TSUGI}
RUN tar -zxvf *.tar.gz
RUN mv tsugi-${TSUGI_VERSION} xerteonlinetoolkits/tsugi

RUN rm *.tar.gz

WORKDIR xerteonlinetoolkits
RUN chown -R www-data:www-data .

EXPOSE 80
