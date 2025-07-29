#!/bin/bash
sudo apt update
sudo apt install -y python3-pip
pip3 install virtualenv
virtualenv gpt2env
source gpt2env/bin/activate
pip install -r /home/lavanyam_cs22/gpt2-chat-deployment/backend/requirements.txt
nohup python3 /home/lavanyam_cs22/gpt2-chat-deployment/backend/app.py &
