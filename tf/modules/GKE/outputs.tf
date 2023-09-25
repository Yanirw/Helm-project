output "gke_cluster_name" {
  description = "Name of the provisioned GKE cluster"
  value       = module.gke.name
}

output "gke_endpoint" {
  description = "Endpoint for the GKE cluster"
  value       = module.gke.endpoint
}

output "gke_ca_certificate" {
  description = "CA certificate for the GKE cluster"
  value       = module.gke.ca_certificate
}

output "debug_node_pools" {
  value = var.node_pools
}
