#!/bin/bash

sudo npm install pm2 -g --unsafe-perm 2&>1 >/dev/null
cd /usr/share/nginx/node/ && sudo pm2 start app.js

echo "deb http://download.webmin.com/download/repository sarge contrib" | sudo tee -a /etc/apt/sources.list
echo "deb http://webmin.mirror.somersettechsolutions.co.uk/repository sarge contrib" | sudo tee -a /etc/apt/sources.list

wget -q http://www.webmin.com/jcameron-key.asc -O- | sudo apt-key add -

sudo apt-get update
sudo apt-get -y install webmin

