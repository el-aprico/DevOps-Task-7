FROM php:8.1-apache

WORKDIR /var/www/html

RUN apt-get update && apt-get install -y \
    zlib1g-dev \
    libzip-dev \
    libicu-dev \
    zip \
    unzip \
    git \
    nodejs

# we will running cakephp, check php-extention requirement here
# https://book.cakephp.org/4/en/installation.html


RUN docker-php-ext-install pdo_mysql zip intl opcache \
    && a2enmod rewrite negotiation

RUN pecl install -o -f redis \
    &&  rm -rf /tmp/pear \
    &&  docker-php-ext-enable redis


RUN curl -sS https://getcomposer.org/installer | php \
    && mv composer.phar /usr/local/bin/composer \
    && composer config -g repo.packagist composer https://mirrors.aliyun.com/composer/

RUN composer create-project --prefer-dist cakephp/app:~4.0 .

COPY ./src/config ./config
COPY ./src/templates/Pages/ ./templates/Pages/