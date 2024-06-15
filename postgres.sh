#!/bin/bash

# Install PostgreSQL
sudo apt-get update
sudo apt-get install -y postgresql

# Configure PostgreSQL to allow remote connections (example)
sudo sed -i "s/#listen_addresses = 'localhost'/listen_addresses = '*'/g" /etc/postgresql/12/main/postgresql.conf
echo "host    all             all             0.0.0.0/0               md5" | sudo tee -a /etc/postgresql/12/main/pg_hba.conf

# Restart PostgreSQL service
sudo systemctl restart postgresql
