resource "google_pubsub_topic" "spinnaker" {
  name = "gcr-triggers"

  labels = {
    env = "spinnaker"
  }
}

resource "google_pubsub_subscription" "spinnaker" {
  name  = "gcr-triggers"
  topic = google_pubsub_topic.spinnaker.name
}

resource "google_pubsub_subscription_iam_binding" "spinnaker" {
  subscription = google_pubsub_subscription.spinnaker.name
  role         = "roles/pubsub.subscriber"
  members      = ["serviceAccount:${google_service_account.spinnaker.email}"]  
}
