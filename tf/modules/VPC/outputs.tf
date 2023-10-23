output "vpc_id" {
  description = "ID of the VPC"
  value       = google_compute_network.my_vpc.self_link
}

output "vpc_name" {
  value       = google_compute_network.my_vpc.name
}