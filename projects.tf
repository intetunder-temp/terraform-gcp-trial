module gke_project {
  source              = "git::https://github.com/intetunder-temp/terraform-modules.git//project"
  project_name        = "GKE Project"
  project_id          = "sander-gke-project"
  owner_access        = "user:sander-fearnley-hvas@darknet.fyi"
  auto_create_network = true
  activate_apis       = ["compute.googleapis.com", "iam.googleapis.com", "iamcredentials.googleapis.com", "storage-api.googleapis.com", "storage-component.googleapis.com"]
  labels = {
    team        = "sander"
    environment = "production"
    purpose     = "GKE"
  }
}
