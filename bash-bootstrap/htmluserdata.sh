#!/bin/bash

# Update repository and install nginx
sudo apt update -y
sudo apt upgrade -y
sudo apt install nginx -y

# set permission
sudo chown -R $USER:$USER /var/www

# Detail html Output
printf '<!DOCTYPE html>' > /var/www/html/index.nginx-debian.html
printf '<html lang="en">' >> /var/www/html/index.nginx-debian.html
printf '<body style="background-color:black;">' >> /var/www/html/index.nginx-debian.html
printf '<h1 style="color:red;">My servers hostname is $(hostname -f)<br>Built by Raji Risikat Yewande<br>wandexdev © 2023</h1>' >> /var/www/html/index.nginx-debian.html
printf '</body>' >> /var/www/html/index.nginx-debian.html
printf '</html>' >> /var/www/html/index.nginx-debian.html

# start nginx
sudo systemctl start nginx
sudo systemctl enable nginx

