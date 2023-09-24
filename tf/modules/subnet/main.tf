resource "google_compute_subnetwork" "my_subnet" {
  name          = var.subnet_name
  region        = var.region
  network       = var.vpc_network
  ip_cidr_range = var.subnet_cidr
}