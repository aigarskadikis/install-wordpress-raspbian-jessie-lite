#!/bin/bash

#tutorial from https://www.raspberrypi.org/learning/lamp-web-server-with-wordpress/worksheet/

#this code is tested un fresh 2016-09-23-raspbian-jessie-lite.img Raspberry Pi image
#sudo su
#apt-get update -y && apt-get upgrade -y && apt-get install git -y
#git clone https://github.com/catonrug/install-wordpress-raspbian-jessie-lite.git && cd install-wordpress-raspbian-jessie-lite && chmod +x install-wordpress.sh
#./install-wordpress.sh

#install apache web server
apt-get install apache2 -y

#install php
apt-get install php5 libapache2-mod-php5 -y

#install mysql. enter password 'password' for further automation
apt-get install mysql-server php5-mysql -y

#restart apache web server
service apache2 restart

cd /var/www/html/
rm *
wget http://wordpress.org/latest.tar.gz
tar xzf latest.tar.gz
mv wordpress/* .
rm -rf wordpress latest.tar.gz
chown -R www-data: .

mysql -uroot -ppassword <<< 'create database wordpress'
