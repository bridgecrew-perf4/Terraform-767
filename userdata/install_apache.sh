#!/bin/bash
apt-get update
apt-get -y install apache2
systemctl enable apache2 --now
echo "<h1>Deployed via Terraform</h1>" | sudo tee /var/www/html/index.html
