#!/bin/sh -l

composer install --prefer-dist --ignore-platform-req=ext-gd

cp .env.example .env

php artisan key:generate

php vendor/bin/phpunit
