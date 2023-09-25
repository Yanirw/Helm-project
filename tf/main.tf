provider "google" {
  project = var.gcp_project_name
  region  = var.region
}

terraform {
  backend "gcs" {
    bucket = "gke-project-bucket"
    prefix = "terraform/state"
  }
#   required_providers {
#     google = {
#       source  = "hashicorp/google"
#       version = "~> 4.0"
#     }
#   }
}

module "GKE" {
  source            = "./modules/GKE"
  gke_cluster_name  = var.gke_cluster_name
  project_id        = var.project_id 
  region            = var.region
  vpc_name          = var.vpc_name
  subnet_name       = var.subnet_name
  subnet_cidr       = var.subnet_cidr
  zones             = var.zones
  ip_range_pods     = var.ip_range_pods
  ip_range_services = var.ip_range_services
  node_pools        = var.node_pools
}