#!/bin/sh -l

composer install --prefer-dist --ignore-platform-req=ext-gd

cp .env.testing .env

php artisan key:generate

php artisan config:clear

php artisan config:cache

php artisan test
