#!/bin/bash

# INSTALL WEBMIN
echo "deb http://download.webmin.com/download/repository sarge contrib" | sudo tee -a /etc/apt/sources.list
echo "deb http://webmin.mirror.somersettechsolutions.co.uk/repository sarge contrib" | sudo tee -a /etc/apt/sources.list
wget -q http://www.webmin.com/jcameron-key.asc -O- | sudo apt-key add -
sudo apt-get update
sudo apt-get -y install webmin
sudo /usr/share/webmin/changepass.pl /etc/webmin root vagrant


# CONFIGURE WEB & APP SERVER
sudo mkdir /usr/share/nginx/php
sudo mkdir /usr/share/nginx/php/html
cd /usr/share/nginx/php/html
echo "<?php phpinfo(); ?>" | sudo tee index.php

sudo mkdir /usr/share/nginx/node
sudo mkdir /usr/share/nginx/node/html
cd /usr/share/nginx/node/html
sudo tee app.js > /dev/null <<EOF 
var http = require('http');
http.createServer(function (req, res) {
  res.writeHead(200, {'Content-Type': 'text/plain'});
  res.end('Hello Node\n’);
}).listen(3000, '127.0.0.1');
console.log('Server running at http://127.0.0.1:3000/');
EOF

#sudo npm install pm2 -g --unsafe-perm 2&>1 >/dev/null
cd /usr/share/nginx/node/html && sudo pm2 start app.js

sudo rm -r /usr/share/nginx


