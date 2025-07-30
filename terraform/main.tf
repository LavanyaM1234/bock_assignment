provider "google" {
  project = var.project_id
  region  = var.region
  zone    = var.zone
}

resource "google_compute_instance" "backend" {
  name         = var.backend_vm_name
  machine_type = "e2-standard-4"
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-12"
    }
  }

  network_interface {
    network       = "default"
    access_config {}
  }


metadata_startup_script = <<-EOT
  #!/bin/bash
  sudo apt update
  sudo apt install -y git python3-pip

  cd /home/${var.vm_user}
  git clone https://github.com/LavanyaM1234/bock_assignment.git
  cd bock_assignment/backend

  chmod +x start-backend.sh
  ./start-backend.sh
EOT


  tags = ["backend"]
}

resource "google_compute_instance" "frontend" {
  name         = var.frontend_vm_name
  machine_type = "e2-standard-2"
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-12"
    }
  }

  network_interface {
    network       = "default"
    access_config {}
  }


metadata_startup_script = <<-EOT
  #!/bin/bash
  sudo apt update
  sudo apt install -y git

  cd /home/${var.vm_user}
  git clone https://github.com/LavanyaM1234/bock_assignment.git
  cd bock_assignment/frontend

  chmod +x start-frontend.sh
  ./start-frontend.sh
EOT

  tags = ["frontend"]
}

resource "google_compute_firewall" "allow_http" {
  name    = "allow-http"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["80", "5000"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["frontend", "backend"]
}
