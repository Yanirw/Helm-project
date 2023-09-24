output "node_pools" {
  description = "List of node pool configurations"
  value       = var.node_pools
}

output "node_pools_oauth_scopes" {
  description = "Node pool OAuth scopes"
  value       = var.node_pools_oauth_scopes
}

output "node_pools_labels" {
  description = "Node pool labels"
  value       = var.node_pools_labels
}

output "node_pools_metadata" {
  description = "Node pool metadata"
  value       = var.node_pools_metadata
}

output "node_pools_taints" {
  description = "Node pool taints"
  value       = var.node_pools_taints
}

output "node_pools_tags" {
  description = "Node pool tags"
  value       = var.node_pools_tags
}