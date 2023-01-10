#!/bin/bash

# Update repository and install nginx
sudo apt update -y
sudo apt upgrade -y
sudo apt install nginx -y

# set permission
sudo chown -R $USER:$USER /var/www

# Detail html Output
echo '<DOCTYPE html>' > /var/www/html/index.nginx-debian.html
echo '<html lang="en">' >> /var/www/html/index.nginx-debian.html
echo '<body style="background-color:black;">' >> /var/www/html/index.nginx-debian.html
echo '<h1 style="color:red;">My servers hostname is below<br>Built by Raji Risikat Yewande<br>wandexdev © 2023</h1>' >> /var/www/html/index.nginx-debian.html
echo '</body>' >> /var/www/html/index.nginx-debian.html
echo '</html>' >> /var/www/html/index.nginx-debian.html

# start nginx
sudo systemctl start nginx
sudo systemctl enable nginx

