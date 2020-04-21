module network_gke {
  source          = "git::https://github.com/intetunder-temp/terraform-modules.git//network"
  network_name    = "network-gke"
  network_project = module.gke_project.project_id
  description     = "GKE VPC"
  routing_mode    = "GLOBAL"
}
module subnetwork_gke {
  source                   = "git::https://github.com/intetunder-temp/terraform-modules.git//subnetwork"
  name                     = "sn-gke"
  project                  = module.network_gke.network_project
  description              = "GKE Subnet"
  subnet_cidr              = "10.1.64.0/18"
  region                   = "europe-west4"
  network                  = module.network_gke.network_self_link
  private_ip_google_access = true
  flow_logs                = "false"
  secondary_ip_range = {
    sn-gke = [
      {
        ip_cidr_range = "10.1.128.0/17"
        range_name    = "pods"
      },
      {
        ip_cidr_range = "10.1.0.0/19"
        range_name    = "services"
      },
      {
        ip_cidr_range = "10.1.32.0/19"
        range_name    = "misc"
      }
    ]
  }
}
module "cloudnat-gke-netherlands" {
  source  = "git::https://github.com/intetunder-temp/terraform-modules.git//cloudnat"
  region  = "europe-west4"
  project = module.network_gke.network_project
  network = module.network_gke.network_name
}

