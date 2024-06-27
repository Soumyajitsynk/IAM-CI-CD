#!/bin/bash
source env/bin/activate
sudo cp -rf IAM.socket /etc/systemd/system/
sudo cp -rf IAM.service /etc/systemd/system/
sudo systemctl start gunicorn.socket
sudo systemctl enable gunicorn.socket
sudo systemctl status gunicorn.socket


sudo apt-get install nginx -y
sudo cp -rf django1.conf /etc/nginx/sites-available/
sudo ln django1.conf /etc/nginx/sites-enabled
sudo service nginx restart
