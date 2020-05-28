variable "gcp_project_id" {
  type = string
}

variable "gcp_project_location" {
  type = string
}

variable "machine_type" {
  default = "n1-standard-4"
}

variable "github_token" {
  type = string
}
