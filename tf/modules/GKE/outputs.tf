output "gke_cluster_name" {
  description = "Name of the provisioned GKE cluster"
  value       = google_container_cluster.primary.name
}

output "gke_endpoint" {
  description = "Endpoint for the GKE cluster"
  value       = google_container_cluster.primary.endpoint
}

output "gke_kubeconfig" {
  value = google_container_cluster.primary.master_auth.0.client_certificate
}


