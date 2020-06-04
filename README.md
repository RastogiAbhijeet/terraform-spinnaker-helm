## Terraform module to deploy Spinnaker on GKE

This module will allow a user to deploy a spinnaker helm release to kubernetes cluster on GCP.

This deployment links your Github account to your cloud build so you would need to add
the Google Cloud Build app to your Github. It configures your spinnaker deployment to your
GCS, GCR and pub sub. See the below given diagram to understand more about the architecture

![Alt text](/architecture.png "Title")

#### Prerequistes

- Install terraform ~> v.0.12.18
- Enable Cloud Resource manager API in Google Cloud Platform.
- Enable Cloud Build API
- Create a GCS bucket to store the terraform state to the remote backend and replace the name of the bucket in providers.tf file
  ```HCL
  terraform {
    required_version = "~> 0.12.18"
    backend "gcs" {
      bucket = "<YOUR BUCKET NAME>"
      prefix = "spinnaker-tf-backend"
    }
  }
  ```
- Configure gcloud CLI with a service account that allows your terraform to create resources on terraform.
- Source the following environment variables
  ```bash
    export GOOGLE_APPLICATION_CREDENTIALS=~/.config/gcloud/{GCP_PROJECT_ID}-terraform-admin.json
    export TF_VAR_gcp_project_id={GCP_PROJECT_ID}
    export TF_VAR_gcp_project_location={GCP_PROJECT_LOCATION}
    export TF_VAR_github_token={GIT_TOKEN}
  ```

### Contribute

- Create a new branch with the following convention

  - feature/{what-you-are-trying-to-do}
  - fix/{what-you-are-fixing}

And raise a PR.
