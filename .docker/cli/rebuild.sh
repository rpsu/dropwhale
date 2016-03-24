#!/usr/bin/env bash

/root/scripts/init.sh

mkdir --parents --mode=777 /var/www/sites/default/files
drupal site:install \
    --uri=http://web \
    --root=/var/www \
    --langcode=en \
    --db-type=mysql \
    --db-user=${DB_1_ENV_MYSQL_USER} \
    --db-pass=${DB_ENV_MYSQL_PASS} \
    --db-host=db \
    --db-port=3306 \
    --db-name=${DB_1_ENV_MYSQL_DB} \
    --site-name='Drupal 8 Quick Start' \
    --site-mail=admin@example.com \
    --account-name=admin \
    --account-mail=admin@example.com \
    --account-pass=admin \
    --no-interaction \
    standard

mkdir --parents --mode=777 /var/www/sites/simpletest
drupal module:install simpletest --uri=http://web --root=/var/www
