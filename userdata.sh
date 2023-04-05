#!/bin/bash
sudo apt update
sudo apt install nginx -y
sudo systemctl enable nginx
sudo sh -c "echo '<h1> Hello World from Hussain  $(hostname) </h1>'  > /var/www/html/index.nginx-debian.html"