#!/bin/bash

sudo apt update
sudo apt install -y apache2 mysql-server curl git unzip libxml2
sudo add-apt-repository ppa:ondrej/php
sudo apt update

sudo apt install -y --no-install-recommends php7.1 libapache2-mod-php7.1 php7.1-mysql php7.1-curl php7.1-json php7.1-gd php7.1-mcrypt php7.1-msgpack php7.1-memcached php7.1-intl php7.1-sqlite3 php7.1-gmp php7.1-geoip php7.1-mbstring php7.1-redis php7.1-xml php7.1-zip

a2enmod headers
a2enmod rewrite
a2enmod expires