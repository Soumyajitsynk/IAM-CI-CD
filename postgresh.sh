#!/bin/bash

# Function to check if PostgreSQL is installed
check_postgresql() {
    dpkg -l | grep -qw postgresql
}

# Function to install PostgreSQL if not installed
install_postgresql() {
    echo "PostgreSQL is not installed. Installing PostgreSQL..."
    sudo apt update
    sudo apt install -y postgresql postgresql-contrib
}

# Check if PostgreSQL is installed, if not, install it
if ! check_postgresql; then
    install_postgresql
else
    echo "PostgreSQL is already installed."
fi

# Start PostgreSQL and create the database and user
sudo -u postgres psql <<EOF
CREATE DATABASE IAM;
CREATE USER postgres1 WITH PASSWORD '7032@Abhi';
ALTER ROLE postgres1 SET client_encoding TO 'utf8';
ALTER ROLE postgres1 SET default_transaction_isolation TO 'read committed';
ALTER ROLE postgres1 SET timezone TO 'UTC';
GRANT ALL PRIVILEGES ON DATABASE IAM TO postgres1;
EOF

echo "Database and user setup complete."
