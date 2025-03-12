#!/bin/bash

# Démarrer PHP-FPM
service php8.2-fpm start

# Démarrer Nginx
service nginx start

# Maintenir le conteneur actif
tail -f /dev/null
