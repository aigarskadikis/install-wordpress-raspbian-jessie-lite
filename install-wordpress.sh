#!/bin/bash

#tutorial from https://www.raspberrypi.org/learning/lamp-web-server-with-wordpress/worksheet/
#run this script with root privilegies

#install apache web server
apt-get install apache2 -y

#install php
apt-get install php5 libapache2-mod-php5 -y

#install mysql
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
