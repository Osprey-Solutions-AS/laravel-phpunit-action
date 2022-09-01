FROM php:8.1-fpm
RUN apt-get update && apt-get install -y \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libpng-dev \
        libzip-dev \
        default-mysql-client \
        git \
        npm \
        libnss3-tools \
    && php -r "readfile('http://getcomposer.org/installer');" | php -- --install-dir=/usr/bin/ --filename=composer \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j$(nproc) gd \
    && docker-php-ext-install pdo pdo_mysql zip
    #&& docker-php-ext-install opcacheLABEL "com.github.actions.name"="Laravel PHPUnit"

LABEL "com.github.actions.description"="A GitHub action to run your Laravel project's PHPUnit test suite."
LABEL "com.github.actions.icon"="check-circle"
LABEL "com.github.actions.color"="orange"

LABEL "repository"="https://github.com/nathanheffley/laravel-phpunit-action"
LABEL "homepage"="https://github.com/nathanheffley/laravel-phpunit-action"
LABEL "maintainer"="Nathan Heffley <nathan@nathanheffley.com>"

ADD entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]