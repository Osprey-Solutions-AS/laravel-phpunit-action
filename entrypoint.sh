#!/bin/sh -l

composer install --prefer-dist --ignore-platform-req=ext-gd

ls
#cp .env.ci .env
#
#php artisan key:generate
#
#php artisan test
