module gke_web_stg_container_cluster {
  source       = "git::https://github.com/intetunder-temp/terraform-modules.git//container_cluster"
  gke_project  = module.gke_project.project_id
  kube_version = "1.14"

  network                    = module.network_gke.network_self_link
  gke_subnetwork             = module.subnetwork_gke.subnetwork_self_link[0]
  distribution_policy_zones  = ["europe-west4-a", "europe-west4-b", "europe-west4-c"]
  cluster_name               = "gke"
  region                     = "europe-west4"
  cluster_label              = "gke"
  workload_label             = "gke"
  team_label                 = "gke"
  enable_private_nodes       = true
  enable_private_endpoint    = false
  http_load_balancing        = true
  horizontal_pod_autoscaling = true
  kubernetes_dashboard       = false
  istio_config               = false
  cloudrun_config            = true
  network_policy_provider    = "CALICO"
  master_ipv4_cidr_block     = "172.16.0.16/28"
}

