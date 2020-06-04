
resource "helm_release" "spinnaker" {
  name    = "spinnaker-chart"
  chart   = "stable/spinnaker"
  version = "2.0.0-rc3"

  wait = true

  recreate_pods   = true
  cleanup_on_fail = true
  timeout         = 600

  values = [
    "${templatefile("${path.module}/spinnaker_values.yaml", {
      minio_enabled   = false
      gcs_enabled     = true
      gcp_project     = var.gcp_project_id
      gcs_bucket_name = google_storage_bucket.spinnaker_cache.name
      gcs_jsonKey     = trimspace(base64decode(google_service_account_key.mykey.private_key))
      gcr_link        = data.google_container_registry_repository.spinnaker.repository_url
      sa_email        = google_service_account.spinnaker.email
      git_token       = var.github_token
    })}"
  ]

  depends_on = [google_container_cluster.primary]
}

