#!/usr/bin/env bash

# don't prompt for mysql root password.  use 'password'
echo "mysql-server mysql-server/root_password password password" | sudo debconf-set-selections
echo "mysql-server mysql-server/root_password_again password password" | sudo debconf-set-selections

# add apt source for nodejs
cp /vagrant_setup/nodesource.list /etc/apt/sources.list.d/nodesource.list
cat /vagrant_setup/nodesource.gpg.key | apt-key add -

apt-get update

# install packages
apt-get install -y mysql-server build-essential libssl-dev nodejs

# open firewall
ufw allow 80
ufw allow 3000