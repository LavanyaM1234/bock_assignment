#!/bin/bash
sudo apt update
sudo apt install -y python3

# Serve static frontend via Python HTTP server
nohup python3 -m http.server 8080 &
