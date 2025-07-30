# #!/bin/bash
# sudo apt update
# sudo apt install -y python3

# # Go to frontend directory before starting the HTTP server
# cd /opt/gpt2-chat-deployment/frontend
# sed -i "s|{{BACKEND_IP}}|${backend_ip}|g" index.html
# # Serve static frontend via Python HTTP server
# nohup python3 -m http.server 8080 > frontend.log 2>&1 &

#!/bin/bash
sudo apt update
sudo apt install -y python3

cd /opt/gpt2-chat-deployment/frontend

# Replace {{BACKEND_IP}} with the actual backend IP
sed -i "s|{{BACKEND_IP}}|${BACKEND_IP}|g" index.html

# Start frontend on port 8080
nohup python3 -m http.server 8080 > frontend.log 2>&1 &
