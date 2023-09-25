resource "google_compute_subnetwork" "private_subnet" {
  name          = var.subnet_name
  region        = var.region
  network       = var.vpc_network
  ip_cidr_range = var.subnet_cidr
  private_ip_google_access = true

}