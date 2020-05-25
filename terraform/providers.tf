terraform {
  required_version = "~> 0.12.0"
  backend "gcs" {
    bucket = "spinnaker-xshskg"
    prefix = "test"
  }
}

data "google_client_config" "default" {}

data "google_client_openid_userinfo" "identity" {}

provider "google" {
  version = "~> 3.0.0"
  project = var.gcp_project_id
  region  = var.gcp_project_location
}

provider "google-beta" {
  project = var.gcp_project_id
  region  = var.gcp_project_location
}

provider "helm" {
  version = "1.0.0"
  kubernetes {
    host                   = google_container_cluster.primary.endpoint
    load_config_file       = false
    token                  = data.google_client_config.default.access_token
    client_certificate     = base64decode(google_container_cluster.primary.master_auth.0.client_certificate)
    client_key             = base64decode(google_container_cluster.primary.master_auth.0.client_key)
    cluster_ca_certificate = base64decode(google_container_cluster.primary.master_auth.0.cluster_ca_certificate)
  }
}

provider "kubernetes" {

  host                   = google_container_cluster.primary.endpoint
  load_config_file       = false
  token                  = data.google_client_config.default.access_token
  client_certificate     = base64decode(google_container_cluster.primary.master_auth.0.client_certificate)
  client_key             = base64decode(google_container_cluster.primary.master_auth.0.client_key)
  cluster_ca_certificate = base64decode(google_container_cluster.primary.master_auth.0.cluster_ca_certificate)

}
