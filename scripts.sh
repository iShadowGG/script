#!/bin/bash
sudo apt-get update -y
sudo apt-get install -y nginx

#move into html dir
cd /var/www

#mirror demo page from s3 bucket
sudo wget --mirror --page-requisites --convert-links --no-clobber http://example-bucket-archie-indexpage-azure1.s3-website-eu-west-1.amazonaws.com

sudo wget https://example-bucket-archie-indexpage-azure1.s3.eu-west-1.amazonaws.com/script.sh

#changes bucket name to right path for html
sudo rm -rf html
sudo mv example-bucket-archie-indexpage-azure1.s3-website-eu-west-1.amazonaws.com/ html

#give permissions to execute the script and move it the html folder
sudo chmod 755 script.sh
sudo mv script.sh html/
cd /var/www/html

#start bootstrap script which calls variable and changes index.html information
sudo ./script.sh      
