module gke_dev_container_cluster {
  source       = "git::https://github.com/intetunder-temp/terraform-modules.git//container_cluster"
  gke_project  = module.gke_project.project_id
  kube_version = "1.15"

  network        = module.network_gke.network_self_link
  gke_subnetwork = module.subnetwork_gke.subnetwork_self_link[0]
  #distribution_policy_zones  = ["europe-west4-a", "europe-west4-b", "europe-west4-c"]
  cluster_name               = "gke"
  region                     = "europe-west4-a"
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

module gke_dev_default {
  source          = "git::https://github.com/intetunder-temp/terraform-modules.git//node_pool"
  cluster_name    = "gke"
  name            = "default"
  autoscaling     = true
  node_count      = "1"
  min_node_count  = "1"
  max_node_count  = "2"
  max_pods        = "110"
  local_ssd_count = "0"
  region          = "europe-west4-a"
  auto_repair     = "true"
  auto_upgrade    = "true"
  image_type      = "COS"
  disk_size_gb    = "30"
  disk_type       = "pd-ssd"
  machine_type    = "custom-2-13312"
  n2_instance     = false
  preemptible     = "false"
  node_metadata   = "SECURE"
  gke_project     = module.gke_project.project_id

  node_pools_labels = {
    all = {}
    default = {
      workload = "default"
    }
  }
  node_pools_taints = {
    all = []
    default = [
      {
        key    = "workload"
        value  = "default"
        effect = "NO_SCHEDULE"
      }
    ]
  }
}

module gke_dev_system {
  source          = "git::https://github.com/intetunder-temp/terraform-modules.git//node_pool"
  cluster_name    = "gke"
  name            = "system"
  autoscaling     = true
  node_count      = "1"
  min_node_count  = "1"
  max_node_count  = "2"
  max_pods        = "110"
  local_ssd_count = "0"
  region          = "europe-west4-a"
  auto_repair     = "true"
  auto_upgrade    = "true"
  image_type      = "COS"
  disk_size_gb    = "30"
  disk_type       = "pd-ssd"
  machine_type    = "custom-2-13312"
  n2_instance     = false
  preemptible     = "false"
  node_metadata   = "SECURE"
  gke_project     = module.gke_project.project_id

  node_pools_labels = {
    all    = {}
    system = {}
  }
  node_pools_taints = {
    all    = []
    system = []
  }
}

