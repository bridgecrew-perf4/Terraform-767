#!bin/bash
until [[ -f /var/lib/cloud/instance/boot-finished ]]; do
  sleep 1
done

sudo apt -y update
sudo apt -y upgrade
sudo apt -y install nginx
sudo systemctl enable nginx --now