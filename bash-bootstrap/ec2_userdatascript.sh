#!/bin/bash

# Update repository and install nginx
sudo apt update -y
sudo apt upgrade -y
sudo apt install nginx -y

# set time and hostname
timedatectl set-timezone Africa/Lagos
hostname=$(hostname)
date=$(date) 

# set permission
sudo chown -R $USER:$USER /var/www

#redirect to nginx conf
echo "<h1>I'm popularly called $hostname a.k.a the host</h1>" > /var/www/html/index.nginx-debian.html
echo "<h2>Your'e viewing this today: $date</h2>" >> /var/www/html/index.nginx-debian.html
echo "<h2>     Built by Raji Risikat Yewande</h2>" >> /var/www/html/index.nginx-debian.html

#start nginx
sudo systemctl restart nginx
sudo systemctl reload nginx
