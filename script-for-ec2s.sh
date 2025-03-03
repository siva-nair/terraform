#!/bin/bash
sudo apt update -y
sudo apt install apache2 -y
sudo systemctl start apache2
sudo systemctl enable apache2
cd /var/www/html/
sudo rm -f index.html
sudo touch index.html               
sudo echo "<html><head><title>Apache Test page</title></head><body><h1>public_ec2 - It's working</h1></body></html>" | sudo tee /var/www/html/index.html
sudo mkdir -p /var/www/html/foo
cd /var/www/html/foo
sudo touch index.html
sudo echo "<html><head><title>Apache Test Page Foo</title></head><body><h1>public_ec2/Foo - It's working</h1></body></html>" | sudo tee /var/www/html/foo/index.html
sudo mkdir -p /var/www/html/bar
cd /var/www/html/bar				
sudo touch index.html
sudo echo "<html><head><title>Apache Test Page Bar</title></head><body><h1>public_ec2/Bar - It's working</h1></body></html>" | sudo tee /var/www/html/bar/index.html
sudo systemctl restart apache2                     
