data "google_container_registry_repository" "spinnaker" {}

resource "google_container_registry" "registry" {
  provider = google-beta
  project  = var.gcp_project_id
  location = "US"
}

