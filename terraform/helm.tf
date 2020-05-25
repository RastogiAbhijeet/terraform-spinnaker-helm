resource "helm_release" "spinnaker" {
  name  = "spinnaker-chart"
  chart = "stable/spinnaker"
  wait  = true

  values = [
    "${templatefile("${path.module}/spinnaker_values.yaml", {
      minio_enabled   = false
      gcs_enabled     = true
      gcp_project     = var.gcp_project_id
      gcs_bucket_name = google_storage_bucket.spinnaker_cache.name
      gcs_jsonKey     = trimspace(base64decode(google_service_account_key.mykey.private_key))
      gcr_link        = data.google_container_registry_repository.spinnaker.repository_url
    })}"
  ]
}

