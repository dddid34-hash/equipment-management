FROM php:8.1-apache

COPY . /var/www/html/

WORKDIR /var/www/html

RUN chown -R www-data:www-data /var/www/html \
    && a2enmod rewrite \
    && mkdir -p database \
    && chmod 777 database

EXPOSE 80

CMD ["apache2-foreground"]