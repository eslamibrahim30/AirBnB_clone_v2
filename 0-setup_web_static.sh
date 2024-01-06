#!/usr/bin/env bash
# sets up your web servers for the deployment of web_static
if command -v nginx &> /dev/null; then
	sudo apt-get update
	sudo apt-get install -y nginx
fi
sudo mkdir -p /data/web_static/shared/ /data/web_static/releases/test/
sudo touch /data/web_static/releases/test/index.html
sudo tee -a "/data/web_static/releases/test/index.html" << END
<html>
  <head>
  </head>
  <body>
    Holberton School
  </body>
</html>
END
sudo ln -s /data/web_static/current /data/web_static/releases/test/
sudo chown -R ubuntu:ubuntu /data/
sudo sed -i '/server_name _;/a \\n    location \/hbnb_static {\n        root /data/web_static/current/;\n    }\n' /etc/nginx/sites-available/default
sudo service nginx restart
exit 0
