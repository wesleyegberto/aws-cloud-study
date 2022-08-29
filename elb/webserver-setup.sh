#!/bin/bash
ping -c 5 www.google.com

sudo apt-get update
sudo apt-get install apache2 -y

sudo systemctl restart apache2

sudo chmod 777 -R /var/www/html/
cd /var/www/html/

VM_ID=$(curl http://169.254.169.254/latest/meta-data/instance-id)
sudo echo "<h1>Webserver $VM_ID no EC2 criado a partir de Terraform.</h1>" > index.html
echo "Webserver configured"
