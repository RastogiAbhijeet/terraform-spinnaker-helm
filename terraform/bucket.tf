resource "google_storage_bucket" "spinnaker_cache" {
  name          = "${var.gcp_project_id}-spinnaker-config"
  location      = var.gcp_project_location
  force_destroy = true
}
