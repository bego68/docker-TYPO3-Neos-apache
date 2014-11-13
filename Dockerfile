# Version 1.0
FROM php:5.5-apache
MAINTAINER Berti Golf <info@berti-golf.de>
RUN apt-get update

ADD 000-default.conf /etc/apache2/sites-available/000-default.conf
ADD php.ini  /usr/local/lib/php.ini
COPY docker-php-ext-* /usr/local/bin/
RUN chmod a+x  /usr/local/bin/docker-php-ext-*
RUN ls -la /usr/local/bin/*
RUN docker-php-ext-install mbstring


EXPOSE 80
CMD ["apache2", "-DFOREGROUND"]