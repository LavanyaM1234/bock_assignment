metadata_startup_script = <<-EOT
    sudo apt update
    sudo apt install -y python3 git
    git clone https://github.com/${var.github_username}/gpt2-chat-deployment.git /opt/gpt2-chat-deployment
    cd /opt/gpt2-chat-deployment/frontend
    nohup python3 -m http.server 8080 &
  EOT
