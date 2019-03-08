ppa=ondrej/php

# Install everything
install: update apache php56 php71 composer
	echo '=[ Installing... ]='
	sudo apt install -y git curl terminator
	sudo apt install -y \
	    apt-transport-https \
	    ca-certificates \
	    software-properties-common

	# Backup .bachrc
	cp ~/.bashrc ~/.bashrc_back
	cp configs/.bashrc ~/.bashrc
	cp configs/.bashrc_coloration.sh ~/.bashrc_coloration.sh
	cp configs/.gitconfig ~/.gitconfig
	
	echo '=[ Installed... ]='
update:
	echo '=[ Updating... ]='
	
	sudo apt update
	sudo apt upgrade -y
	sudo apt autoremove -y
	sudo apt autoclean
	
	echo '=[ Updated ]='

apache:
	echo '=[ Installing Apache... ]='
	
	sudo apt update
	sudo apt install -y apache2 mysql-server curl git unzip libxml2
	sudo a2enmod headers
	sudo a2enmod rewrite
	sudo a2enmod expires
	sudo a2enmod macro
	
	echo '=[ Installed Apache... ]='

php56:
	echo '=[ Installing PHP 5.6... ]='
	
	if ! grep -q "^deb .*$(ppa)" /etc/apt/sources.list /etc/apt/sources.list.d/*; then \
		sudo add-apt-repository -y ppa:$(ppa); \
		sudo apt update; \
	fi
	sudo apt install -y --no-install-recommends php5.6 libapache2-mod-php5.6 \
		php5.6-mysql php5.6-curl php5.6-json php5.6-gd php5.6-mcrypt php5.6-msgpack \
		php5.6-memcached php5.6-intl php5.6-sqlite3 php5.6-gmp php5.6-geoip php5.6-mbstring \
		php5.6-redis php5.6-xml php5.6-zip php5.6-bcmath
	
	echo '=[ Installed PHP 5.6... ]='

php71:
	echo '=[ Installing PHP 7.1... ]='
	
	if ! grep -q "^deb .*$(ppa)" /etc/apt/sources.list /etc/apt/sources.list.d/*; then \
		sudo add-apt-repository -y ppa:$(ppa); \
		sudo apt update; \
	fi
	sudo apt install -y --no-install-recommends php7.1 libapache2-mod-php7.1 \
		php7.1-mysql php7.1-curl php7.1-json php7.1-gd php7.1-mcrypt php7.1-msgpack \
		php7.1-memcached php7.1-intl php7.1-sqlite3 php7.1-gmp php7.1-geoip php7.1-mbstring \
		php7.1-redis php7.1-xml php7.1-zip php7.1-bcmath
	
	echo '=[ Installed PHP 7.1... ]='

php72:
	echo '=[ Installing PHP 7.2... ]='
	
	if ! grep -q "^deb .*$(ppa)" /etc/apt/sources.list /etc/apt/sources.list.d/*; then \
		sudo add-apt-repository -y ppa:$(ppa); \
		sudo apt update; \
	fi
	sudo apt install -y --no-install-recommends php7.2 libapache2-mod-php7.2 \
		php7.2-mysql php7.2-curl php7.2-json php7.2-gd php7.2-msgpack \
		php7.2-memcached php7.2-intl php7.2-sqlite3 php7.2-gmp php7.2-geoip php7.2-mbstring \
		php7.2-redis php7.2-xml php7.2-zip php7.2-bcmath
	
	echo '=[ Installed PHP 7.2... ]='

composer:
	echo '=[ Installing Composer... ]='
	
	php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
	php composer-setup.php
	php -r "unlink('composer-setup.php');"
	sudo mv composer.phar /usr/local/bin/composer
	
	echo '=[ Installed Composer... ]='

