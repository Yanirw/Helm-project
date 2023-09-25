variable "gcp_project_name" {}
variable "project_id" {}
variable "region" {}
variable "vpc_name" {}
variable "subnet_name" {}
variable "subnet_cidr" {}
variable "gke_cluster_name" {}
variable "zones" {}
variable "ip_range_pods" {}
variable "ip_range_services" {}

variable "node_pools" {
  description = "List of node pool configurations"
  type        = list(map(string))
}

# variable "node_pools" {
#   description = "List of node pool configurations"
#   type        = list(object({
#     name                      = string
#     machine_type              = string
#     node_locations            = list(string)
#     min_count                 = number
#     max_count                 = number
#     local_ssd_count           = number
#     spot                      = bool
#     disk_size_gb              = number
#     disk_type                 = string
#     image_type                = string
#     enable_gcfs               = bool
#     enable_gvnic              = bool
#     logging_variant           = string
#     auto_repair               = bool
#     auto_upgrade              = bool
#     service_account           = string
#     preemptible               = bool
#     initial_node_count        = number
#   }))
# }