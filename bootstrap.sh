#!/usr/bin/env bash

apt-get update

# don't prompt for mysql root password.  use 'password'
echo "mysql-server mysql-server/root_password password password" | sudo debconf-set-selections
echo "mysql-server mysql-server/root_password_again password password" | sudo debconf-set-selections

# nodejs npm dependencies & mysql server
apt-get install -y mysql-server build-essential libssl-dev nodejs npm

# open firewall
ufw allow 80
ufw allow 3000