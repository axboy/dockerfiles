FROM kubeless/unzip:latest as builder
ADD https://static.axboy.cn/discuz/Discuz_X3.4_SC_UTF8_20220811.zip /
RUN unzip -d /discuz Discuz_X3.4_SC_UTF8_20220811.zip
# RUN ls -alh /discuz

FROM php:7.4.7-apache
MAINTAINER axboy
EXPOSE 80

COPY --from=builder /discuz/upload /var/www/html

RUN docker-php-ext-install pdo pdo_mysql mysqli && \
    chmod -R 777 /var/www/html && \
    echo 'session.save_path = "/tmp"' >> /usr/local/etc/php/conf.d/my.ini && \
    echo 'upload_max_filesize = 20M' >> /usr/local/etc/php/conf.d/my.ini && \
    echo 'post_max_size = 20M' >> /usr/local/etc/php/conf.d/my.ini