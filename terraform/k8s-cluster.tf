resource "random_id" "tlrs" {
  byte_length = 4
}

resource "google_container_cluster" "primary" {
  name     = format("spinnaker-%s", random_id.tlrs.hex)
  location = "australia-southeast1-a"

  remove_default_node_pool = true
  initial_node_count       = 1

  master_auth {
    username = ""
    password = ""
  }
}

resource "google_container_node_pool" "primary" {
  name     = format("spinnary-node-%s", random_id.tlrs.hex)
  location = "australia-southeast1-a"
  cluster  = google_container_cluster.primary.name

  node_count = 1

  node_config {
    preemptible  = true
    machine_type = var.machine_type
    oauth_scopes = [
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
      "https://www.googleapis.com/auth/devstorage.read_only"
    ]
  }

  autoscaling {
    max_node_count = 1
    min_node_count = 0
  }
}
