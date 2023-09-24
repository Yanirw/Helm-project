output "subnet_id" {
  description = "ID of the subnet"
  value       = google_compute_subnetwork.my_subnet.self_link
}