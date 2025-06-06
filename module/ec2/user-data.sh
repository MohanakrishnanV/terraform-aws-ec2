#!/bin/bash
sudo apt update -y
sudo apt install -y nginx

# Create index.html with dynamic DNS name
echo "<h1>The webserver is up and running from the hostname: $(hostname -f)</h1>" > /var/www/html/index.html

# Start nginx
sudo systemctl start nginx
sudo systemctl enable nginx