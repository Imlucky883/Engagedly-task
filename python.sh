#!/bin/bash

# Install Python 3 and pip
sudo apt-get update
sudo apt-get install -y python3 python3-pip

# Install Flask
sudo pip3 install flask

# Example Flask application
cat <<EOF > app.py
from flask import Flask

app = Flask(__name__)

@app.route('/')
def hello():
    return 'Hello, World!'

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
EOF

# Run Flask app
nohup python3 app.py > app.log &

