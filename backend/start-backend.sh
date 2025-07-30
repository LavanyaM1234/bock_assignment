#!/bin/bash

# Update and install required packages
sudo apt update
sudo apt install -y python3-venv python3-pip

# Set working directory
cd /opt/gpt2-chat-deployment/backend

# Create virtual environment
python3 -m venv gpt2env
source gpt2env/bin/activate

# Upgrade pip
pip install --upgrade pip

# Install packages manually (instead of using requirements.txt)
pip install torch==2.2.1+cpu --extra-index-url https://download.pytorch.org/whl/cpu
pip install torchvision==0.17.1+cpu --extra-index-url https://download.pytorch.org/whl/cpu
pip install torchaudio==2.2.1 --extra-index-url https://download.pytorch.org/whl/cpu
pip install flask
pip install flask-cors
pip install numpy==1.26.4
pip install transformers==4.40.1

# Start the backend app
nohup python3 app.py > backend.log 2>&1 &
