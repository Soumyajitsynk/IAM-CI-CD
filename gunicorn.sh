#!/bin/bash
cd /var/lib/jenkins/workspace/IAM

source env/bin/activate

cd /var/lib/jenkins/workspace/IAM


sudo apt-get install supervisor

sudo cp -rf gunicorn1.conf /etc/supervisor/conf.d/
sudo mkdir /var/log/gunicorn
sudo supervisorctl reread
sudo supervisorctl update
sudo supervisorctl status

echo "Migrations done"
