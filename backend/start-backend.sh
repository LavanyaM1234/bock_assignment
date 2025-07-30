#!/bin/bash

# Update and install required packages
sudo apt update
sudo apt install -y python3-venv python3-pip

# Set working directory
cd /opt/gpt2-chat-deployment/backend

# Create virtual environment
python3 -m venv gpt2env
source gpt2env/bin/activate

# Install Python dependencies inside venv
pip install --upgrade pip
pip install -r requirements.txt

# Start the backend app
nohup python3 app.py > backend.log 2>&1 &
