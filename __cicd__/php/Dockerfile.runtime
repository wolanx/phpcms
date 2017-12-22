FROM php:7.1.10-fpm-alpine

RUN apk add --no-cache freetype libpng libjpeg-turbo freetype-dev libpng-dev libjpeg-turbo-dev \
    && apk add --no-cache --virtual .build-deps autoconf g++ libssh2 openssl openssl-dev make pcre-dev \
    && docker-php-ext-configure gd \
        --with-gd \
        --with-freetype-dir=/usr/include/ \
        --with-png-dir=/usr/include/ \
        --with-jpeg-dir=/usr/include/ \
    && pecl install redis \
    && nproc=$(getconf _NPROCESSORS_ONLN) \
    && docker-php-ext-install -j${nproc} gd pdo_mysql mysqli opcache \
    && docker-php-ext-enable redis \
    && apk del .build-deps \
    && pecl clear-cache \
    && docker-php-source delete

RUN curl https://getcomposer.org/composer.phar -o /usr/local/bin/composer \
    && chmod +x /usr/local/bin/composer \
    && mkdir -p /var/runtime && chmod -R 777 /var/runtime

COPY __cicd__/php/php.ini /usr/local/etc/php/
