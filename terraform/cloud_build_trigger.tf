resource "google_cloudbuild_trigger" "github_repo" {
  provider = google-beta
  github {
    owner = "RastogiAbhijeet"
    name  = "terraform-spinnaker-helm"

    push {
      tag = "v.*"
    }
  }

  filename = "cloudbuild.yaml"
}
