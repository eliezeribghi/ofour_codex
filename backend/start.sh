#!/bin/bash

# Vérifier que MySQL est en ligne
until mysqladmin ping -h"$DB_HOST" --silent; do
    echo "Waiting for MySQL..."
    sleep 2
done


echo "MySQL is ready!"
php-fpm

