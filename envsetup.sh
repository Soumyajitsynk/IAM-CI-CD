#!/bin/bash

# Name of the virtual environment directory
ENV_DIR="venv"

# Function to create and activate the virtual environment
setup_env() {
    python3 -m venv $ENV_DIR
    source $ENV_DIR/bin/activate
    pip install --upgrade pip
    pip install -r requirements.txt
    pip install django
    pip install gunicorn
    echo "Virtual environment setup and Django installed."
}

# Check if the virtual environment directory exists
if [ -d "$ENV_DIR" ]; then
    echo "Environment exists."
    source $ENV_DIR/bin/activate
    pip install --upgrade pip
    pip install -r requirements.txt
    pip install django
    pip install gunicorn
else
    echo "Environment does not exist. Setting up..."
    setup_env
fi
python3 manage.py migrate
python3 manage.py collectstatic
