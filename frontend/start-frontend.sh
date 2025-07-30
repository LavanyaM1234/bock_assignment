#!/bin/bash
sudo apt update
sudo apt install -y python3

# Go to frontend directory before starting the HTTP server
cd /opt/gpt2-chat-deployment/frontend
sed -i "s|{{BACKEND_IP}}|${backend_ip}|g" index.html
# Serve static frontend via Python HTTP server
nohup python3 -m http.server 8080 > frontend.log 2>&1 &
