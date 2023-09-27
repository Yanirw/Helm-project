
variable "node_pools" {
  description = "List of node pool configurations"
  type        = list(map(string))
}

variable "gke_cluster_name" {}

variable "region" {
  description = "Google Cloud region"
  type        = string
}
