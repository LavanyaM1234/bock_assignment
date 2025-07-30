#!/bin/bash
sudo apt update
sudo apt install -y python3-pip

# Setup virtual environment
pip3 install virtualenv
virtualenv gpt2env
source gpt2env/bin/activate

# Install dependencies
pip install -r requirements.txt

# Start the backend server
nohup python3 app.py &
