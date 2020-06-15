FROM php:7.4.7-apache
MAINTAINER axboy

EXPOSE 80
ADD http://dl.cnezsoft.com/zentao/12.3.2/ZenTaoPMS.12.3.2.zip /var/www/html
RUN docker-php-ext-install pdo pdo_mysql
RUN sed -i "s/;extension=pdo_mysql/extension=pdo_mysql/g" /usr/local/etc/php/php.ini
RUN sed -i "s/;session.save_path/session.save_path/g" /usr/local/etc/php/php.ini