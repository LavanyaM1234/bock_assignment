variable "project_id" {
  type        = string
  description = "GCP Project ID"
}

variable "region" {
  type        = string
  default     = "us-central1"
}

variable "zone" {
  type        = string
  default     = "us-central1-a"
}

variable "backend_vm_name" {
  type        = string
  default     = "gpt2-backend"
  description = "Name of the backend VM"
}

variable "frontend_vm_name" {
  type        = string
  default     = "gpt2-frontend"
  description = "Name of the frontend VM"
}

variable "github_username" {
  type        = string
  description = "GitHub username for cloning the repo"
}
variable "vm_user" {
  description = "Username on the VM instance"
  default     = "lavanyam_cs22"
}
