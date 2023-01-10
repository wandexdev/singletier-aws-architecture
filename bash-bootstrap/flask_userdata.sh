#!/bin/bash

# install necessary packages
sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt-get install -y python3 python3-pip python3-dev
sudo apt-get install -y python3-setuptools python3-venv
sudo apt-get install -y build-essential libssl-dev libffi-dev 

# create a Flask environment
mkdir /home/ubuntu/flaskapp
cd flaskapp
python3.8 -m venv flaskappenv
source flaskappenv/bin/activate
pip install wheel
pip install flask
pip install uwsgi
pip install requests

# Build flask app and store ip and hostname as variables
sudo cat > /home/ubuntu/flaskapp/flaskapp.py << EOF
from flask import Flask
app = Flask(__name__)

@app.route("/")
def hello():
    import socket
    hostname = socket.gethostname()
    ip_address = socket.gethostbyname(hostname)
    return f"My Hostname is: {hostname}<br>My IP Address is: {ip_address}<br><br>Built by Raji Risikat Yewande<br>python flask app<br>wandexdev ©2023"

if __name__ == "__main__":
    app.run(host='0.0.0.0', port=80)
EOF

# create a WSGI entry point
sudo cat > /home/ubuntu/flaskapp/wsgi.py << EOF
from flaskapp import app

if __name__ == "__main__":
    app.run()
EOF

# Deactivate environment
deactivate

# uWSGI configurations
touch /home/ubuntu/flaskapp/flaskapp.ini
sudo cat > /home/ubuntu/flaskapp/flaskapp.ini << EOF
[uwsgi]
module = wsgi:app

master = true
processes = 5

socket = /tmp/uwsgi.sock
chmod-socket = 660
vacuum = true

die-on-term = true
EOF

# create systemd file
sudo chmod 777 /etc/systemd/system
sudo cat > /etc/systemd/system/flaskapp.service << EOF
[Unit]
Description=uWSGI instance to serve flaskapp
After=network.target

[Service]
User=ubuntu
Group=www-data
WorkingDirectory=/home/ubuntu/flaskapp
Environment="PATH=/home/ubuntu/flaskapp/flaskappenv/bin"
ExecStart=/home/ubuntu/flaskapp/flaskappenv/bin/uwsgi --ini flaskapp.ini

[Install]
WantedBy=multi-user.target
EOF

# aviod permission denied
sudo chmod 777 /etc/systemd/system/flaskapp.service

# test with systwnctl
sudo systemctl daemon-reload
sudo systemctl start flaskapp
sudo systemctl status flaskapp

# install and create an NGINX configuration file
sudo apt-get install nginx -y
sudo chmod 777 /etc/nginx/sites-available
sudo cat > /etc/nginx/sites-available/flaskapp << EOF
server {
    listen 80;
    server_name wandexdev.me www.wandexdev.me;

    location / {
        include uwsgi_params;
        uwsgi_pass unix:/home/ubuntu/flaskapp/flaskapp.sock;
    }
}
EOF

# link NGINX cofg file to sites enables directory
sudo ln -s /etc/nginx/sites-available/flaskapp /etc/nginx/sites-enabled

# restart NGINX
sudo systemctl restart nginx
sudo systemctl status nginx


uwsgi --socket /tmp/uwsgi.sock --wsgi-file /home/ubuntu/flaskapp/flaskapp.py --callable app --pyargv "" &
