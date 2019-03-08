#!/bin/bash

sudo a2dismod php5.6
sudo a2dismod php7.2
sudo a2enmod php7.1

sudo update-alternatives --set php /usr/bin/php7.1
sudo update-alternatives --set phar /usr/bin/phar7.1
sudo update-alternatives --set phar.phar /usr/bin/phar.phar7.1

sudo service apache2 restart
