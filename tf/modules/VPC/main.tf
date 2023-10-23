resource "google_compute_network" "my_vpc" {
  name                    = var.vpc_name
  auto_create_subnetworks = false

}

#cloud router
resource "google_compute_router" "router" {
  name    = "router"
  region  = var.region
  network = google_compute_network.my_vpc.id
}

#nat
resource "google_compute_router_nat" "nat" {
  name   = "cluster-nat"
  router = google_compute_router.router.name
  region = var.region

  source_subnetwork_ip_ranges_to_nat = "LIST_OF_SUBNETWORKS"
  nat_ip_allocate_option             = "MANUAL_ONLY"

  subnetwork {
    name                    = var.subnet_name
    source_ip_ranges_to_nat = ["ALL_IP_RANGES"]
  }

  nat_ips = [google_compute_address.nat.self_link]
}

resource "google_compute_address" "nat" {
  name         = "cluster-nat"
  address_type = "EXTERNAL"
  network_tier = "PREMIUM"

}


