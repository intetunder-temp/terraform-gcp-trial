module gke_project {
  source              = "git::https://github.com/intetunder-temp/terraform-modules.git//project"
  project_name        = "GKE Project"
  project_id          = "sander-gke-project"
  owner_access        = "user:sander-fearnley-hvas@darknet.fyi"
  auto_create_network = true
  billing_account     = "0191B0-82ED5F-1ABE8F"
  org_id              = ""
  activate_apis       = ["compute.googleapis.com", "iam.googleapis.com", "iamcredentials.googleapis.com", "storage-api.googleapis.com", "storage-component.googleapis.com", "container.googleapis.com"]
  labels = {
    team        = "sander"
    environment = "production"
    purpose     = "GKE"
  }
}
