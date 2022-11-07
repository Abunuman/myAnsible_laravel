#!/bin/bash
# Create the file repository configuration:
sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > />
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
sudo apt-get update
sudo apt-get -y install postgresql

sudo -i -u postgres psql -c "CREATE DATABASE myExam WITH ENCODING 'UTF8'"
sudo -i -u postgres psql -c "CREATE USER postgres_exam WITH PASSWORD 'password'"
sudo -i -u postgres psql -c "GRANT ALL PRIVILEGES ON DATABASE myExam TO postgres_exam"
sudo -i -u postgres psql -c "FLUSH PRIVILEGES"
sudo systemctl restart postgresql
