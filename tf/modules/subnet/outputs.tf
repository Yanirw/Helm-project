output "subnet_id" {
  description = "ID of the subnet"
  value       = google_compute_subnetwork.private_subnet.self_link
}

output "subnet_name" {
  value = var.subnet_name
}