#!/bin/bash
sudo apt-get update
sudo apt-get install apache2 -y
sudo systemctl enable apache2
sudo systemctl status apache2
sudo apt-get install awscli -y
aws s3 ls

my_name="punit:"
s3_bucket="upgradpunit"
timestamp=$(date '+%d%m%Y-%H%M%S')
file_type="tar"
Date_Created="$timestamp"

tar -cvf /tmp/"$my_name"-httpd-"$timestamp".tar /var/log/apache2/*.log

aws s3 cp /tmp/"$my_name"-httpd-"$timestamp".tar s3://"$s3_bucket"/

