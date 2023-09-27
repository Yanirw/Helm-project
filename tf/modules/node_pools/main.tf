# resource "google_service_account" "kubernetes" {
#   account_id = "kubernetes"
# }

# module "gke_cluster" {
#   source = "../GKE"
# }

resource "google_container_node_pool" "node_pools" {
  count             = length(var.node_pools)
  name              = var.node_pools[count.index].name
  location          = var.region
  cluster           = var.gke_cluster_name
  initial_node_count = var.node_pools[count.index].initial_node_count

  node_config {
    machine_type = var.node_pools[count.index].machine_type
    disk_size_gb = var.node_pools[count.index].disk_size_gb
    disk_type    = var.node_pools[count.index].disk_type
    image_type   = var.node_pools[count.index].image_type

  }

}


