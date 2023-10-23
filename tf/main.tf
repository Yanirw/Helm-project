provider "google" {
  project = var.gcp_project_name
  region  = var.region
}

terraform {
  backend "gcs" {
    bucket = "guitarnetes-tf-backend"
    prefix = "terraform/state"
  }
}

module "GKE" {
  source = "./modules/GKE" 
  gke_cluster_name  = var.gke_cluster_name
  project_id        = var.project_id   
  region            = var.region     
  vpc_name          = var.vpc_name    
  subnet_name       = var.subnet_name 
  subnet_cidr       = var.subnet_cidr
  gke_num_nodes     = var.gke_num_nodes
}

