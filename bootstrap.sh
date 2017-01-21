#!/usr/bin/env bash

APP_PASS="password"
ROOT_PASS="password"
APP_DB_PASS="password"

# don't prompt for mysql root password.  use 'password'
echo "mysql-server mysql-server/root_password password password" | sudo debconf-set-selections
echo "mysql-server mysql-server/root_password_again password password" | sudo debconf-set-selections
echo "phpmyadmin phpmyadmin/dbconfig-install boolean true" | debconf-set-selections
echo "phpmyadmin phpmyadmin/app-password-confirm password $APP_PASS" | debconf-set-selections
echo "phpmyadmin phpmyadmin/mysql/admin-pass password $ROOT_PASS" | debconf-set-selections
echo "phpmyadmin phpmyadmin/mysql/app-pass password $APP_DB_PASS" | debconf-set-selections
echo "phpmyadmin phpmyadmin/reconfigure-webserver multiselect apache2" | debconf-set-selections

# add apt source for nodejs
cp /vagrant_setup/nodesource.list /etc/apt/sources.list.d/nodesource.list
cat /vagrant_setup/nodesource.gpg.key | apt-key add -

apt-get update



# install packages
apt-get install -y mysql-server apache2 php phpmyadmin libapache2-mod-php build-essential libssl-dev nodejs

# open firewall
ufw allow 80
ufw allow 3000