output "backend_url" {
  value = "http://${google_compute_instance.backend.network_interface[0].access_config[0].nat_ip}:5000"
}

output "frontend_url" {
  value = "http://${google_compute_instance.frontend.network_interface[0].access_config[0].nat_ip}"
}
