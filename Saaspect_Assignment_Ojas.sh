#! /bin/bash/
#! /user/bin/aws
<< Documentation
Name        : Ojas Khamkar
Date        : 08/06/2021
Description : Devops-AWS Assignment for SAASPECT 
Input       : Executable
Output      : As per requirements
Documentation

echo "EC2 Instance launch script "

aws ec2 create-key-pair --key-name MyKeyPair --query 'KeyMaterial' --output text > MyKeyPair.pem

touch script_http.txt
echo "#!/bin/bash
sudo su
apt-get upgrade -y
apt-get install apache2 -y
service apache2 start
echo "  Welcome to Saaspect " > /var/www/html/index.html" >> script_http.txt

aws ec2 run-instances --image-id ami-0c1a7f89451184c8b --count 1 --instance-type t2.micro --key-name MyKeyPair --security-groups Saaspect --tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value=Company:Saaspect}]' --user-data file://script_http.txt


echo "Script Finished"
echo "* * * * * * * * * * * * * * * * *"
