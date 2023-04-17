#!/bin/bash
yum install httpd -y
cd var/www/html
echo "Hello from $(hostname -f) - Lab4" > index.html
systemctl restart httpd
systemctl enable httpd