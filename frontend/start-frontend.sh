#!/bin/bash
sudo apt update
sudo apt install -y python3
cd /home/lavanyam_cs22/gpt2-chat-deployment/frontend
nohup python3 -m http.server 80 &
