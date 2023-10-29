module "vpc" {
  source   = "../VPC"
  vpc_name = var.vpc_name
  subnet_name   = module.subnet.subnet_name
  region   = var.region
}

module "subnet" {
  source        = "../subnet"
  subnet_name   = var.subnet_name
  region        = var.region
  vpc_network   = module.vpc.vpc_id
  subnet_cidr   = var.subnet_cidr
}


resource "google_container_cluster" "primary" {
  name     = var.gke_cluster_name
  location = var.region

  remove_default_node_pool = true
  initial_node_count       = 1

  network    = module.vpc.vpc_name
  subnetwork = module.subnet.subnet_name
  deletion_protection = false
}

module "node_pool" {
  source             = "../node_pool" 
  gke_cluster_name   = var.gke_cluster_name
  region             = var.region
  gke_num_nodes      = var.gke_num_nodes
  project_id         = var.project_id
  depends_on         = [ google_container_cluster.primary ]
}
