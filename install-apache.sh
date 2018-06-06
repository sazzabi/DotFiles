#!/bin/bash

sudo apt update
sudo apt install -y apache2 mysql-server curl git unzip libxml2
sudo add-apt-repository ppa:ondrej/php
sudo apt update

a2enmod headers
a2enmod rewrite
a2enmod expires
