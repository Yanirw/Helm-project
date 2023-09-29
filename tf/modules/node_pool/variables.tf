
variable "gke_cluster_name" {}

variable "region" {}
variable "project_id" {}

variable "gke_num_nodes" {
  default     = 1
  description = "number of gke nodes"
}
