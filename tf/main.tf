provider "google" {
  project = var.gcp_project_name
  region  = var.region
}

module "GKE" {
  source            = "./modules/GKE" 
  region            = var.region
  vpc_name          = var.vpc_name
  subnet_name       = var.subnet_name
  gke_cluster_name  = var.gke_cluster_name
  zones             = var.zones
  ip_range_pods     = var.ip_range_pods
  ip_range_services = var.ip_range_services
  node_pools        = var.node_pools
}