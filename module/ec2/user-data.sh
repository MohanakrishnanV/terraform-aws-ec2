#!/bin/bash
sudo apt update -y
sudo apt install -y nginx

# Get EC2 public DNS name
EC2_DNS=$(curl -s http://169.254.169.254/latest/meta-data/public-hostname)

# Create index.html with dynamic DNS name
echo "The webserver is up and running from the hostname: $EC2_DNS" > /var/www/html/index.html

# Start nginx
sudo systemctl start nginx
sudo systemctl enable nginx