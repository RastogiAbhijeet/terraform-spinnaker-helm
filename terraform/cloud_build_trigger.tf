resource "google_cloudbuild_trigger" "github_repo" {
  provider = google-beta
  github {
    owner = "RastogiAbhijeet"
    name  = "spinnaker_tf_config"

    push {
      tag = "v.*"
    }
  }

  filename = "cloudbuild.yaml"
}
