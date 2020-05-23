terraform {

  backend "gcs" {
    bucket = "spinnaker"
    prefix = "spinnaker_test"
  }
  
}