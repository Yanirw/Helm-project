variable "gcp_project_name" {}
variable "region" {}
variable "vpc_name" {
  description = "Name of the VPC where the GKE cluster will be deployed"
  type        = string
}

variable "subnet_name" {
  description = "Name of the subnet within the VPC for the GKE cluster"
  type        = string
}

variable "gke_cluster_name" {
  description = "Name of the GKE cluster"
  type        = string
}

variable "zones" {
  description = "List of availability zones for the GKE cluster"
  type        = list(string)
}

variable "ip_range_pods" {
  description = "IP range for GKE pods"
  type        = string
}

variable "ip_range_services" {
  description = "IP range for GKE services"
  type        = string
}

variable "node_pools" {
  description = "List of node pool configurations"
  type        = list(object({
    name                      = string
    machine_type              = string
    node_locations            = list(string)
    min_count                 = number
    max_count                 = number
    local_ssd_count           = number
    spot                      = bool
    disk_size_gb              = number
    disk_type                 = string
    image_type                = string
    enable_gcfs               = bool
    enable_gvnic              = bool
    logging_variant           = string
    auto_repair               = bool
    auto_upgrade              = bool
    service_account           = string
    preemptible               = bool
    initial_node_count        = number
  }))
}
