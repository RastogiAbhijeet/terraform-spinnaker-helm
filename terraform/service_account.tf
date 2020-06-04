resource "google_service_account" "spinnaker" {
  account_id   = "spinnaker-account"
  display_name = "spinnaker-account"
}

resource "google_project_iam_binding" "project" {
  project = var.gcp_project_id
  role    = "roles/storage.admin"

  members = ["serviceAccount:${google_service_account.spinnaker.email}"]
}


resource "google_service_account_key" "mykey" {
  service_account_id = google_service_account.spinnaker.name
}
