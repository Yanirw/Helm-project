data "google_client_config" "default" {}

provider "kubernetes" {
  host                   = "https://${module.gke.endpoint}"
  token                  = data.google_client_config.default.access_token
  cluster_ca_certificate = base64decode(module.gke.ca_certificate)
}

module "vpc" {
  source   = "../vpc"
  vpc_name = var.vpc_name
}

module "subnet" {
  source        = "../subnet"
  subnet_name   = var.subnet_name
  region        = var.region
  vpc_network   = module.vpc.vpc_id
  subnet_cidr   = var.subnet_cidr
}

module "node_pools" {
  source            = "../node_pools"  
  project_id        = var.project_id
  region            = var.region
  gke_cluster_name  = var.gke_cluster_name
  node_pools        = var.node_pools
}  

module "gke" {
  source                     = "terraform-google-modules/kubernetes-engine/google"
  project_id                 = var.project_id
  name                       = var.gke_cluster_name
  region                     = var.region
  zones                      = var.zones
  network                    = module.vpc.vpc_id
  subnetwork                 = module.subnet.subnet_id
  ip_range_pods              = var.ip_range_pods
  ip_range_services          = var.ip_range_services
  http_load_balancing        = false
  network_policy             = false
  horizontal_pod_autoscaling = true
  filestore_csi_driver       = false

  node_pools = module.node_pools.node_pools

  node_pools_oauth_scopes = module.node_pools.node_pools_oauth_scopes
  node_pools_labels      = module.node_pools.node_pools_labels
  node_pools_metadata    = module.node_pools.node_pools_metadata
  node_pools_taints      = module.node_pools.node_pools_taints
  node_pools_tags        = module.node_pools.node_pools_tags
}
