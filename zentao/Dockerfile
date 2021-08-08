FROM kubeless/unzip:latest as builder
ADD https://www.zentao.net/dl/zentao/15.2/ZenTaoPMS.15.2.zip /
RUN unzip ZenTaoPMS.15.2.zip

FROM php:7.4.7-apache
MAINTAINER axboy
EXPOSE 80

COPY --from=builder /zentaopms /var/www/html
RUN docker-php-ext-install pdo pdo_mysql && \
    echo 'session.save_path = "/tmp"' >> /usr/local/etc/php/conf.d/my.ini && \
    echo 'upload_max_filesize = 20M' >> /usr/local/etc/php/conf.d/my.ini && \
    echo 'post_max_size = 20M' >> /usr/local/etc/php/conf.d/my.ini