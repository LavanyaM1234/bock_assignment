#!/bin/bash
sudo apt update
sudo apt install -y git python3-pip python3-venv

# Clone the repo
sudo git clone https://github.com/LavanyaM1234/bock_assignment.git /opt/gpt2-chat-deployment

# Make the script executable
sudo chmod +x /opt/gpt2-chat-deployment/frontend/start-frontend.sh

# Inject backend IP and run the script
sudo BACKEND_IP=${backend_ip} /opt/gpt2-chat-deployment/frontend/start-frontend.sh
