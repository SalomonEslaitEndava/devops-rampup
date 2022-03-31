# resource "google_compute_network" "net" {
#   name = "my-network"
# }

# resource "google_compute_subnetwork" "subnet" {
#   name          = "my-subnetwork"
#   network       = google_compute_network.net.id
#   ip_cidr_range = "10.0.0.0/16"
#   region        = "us-central1"
# }

resource "google_compute_router" "router" {
  name    = var.router-name
  region  = var.subnet-region
  network = var.network-id # google_compute_network.net.id

  bgp {
    asn = 64514
  }
}

resource "google_compute_router_nat" "nat" {
  name                   = var.nat-name
  router                 = google_compute_router.router.name
  region                 = google_compute_router.router.region
  nat_ip_allocate_option = "AUTO_ONLY"
  # source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"
  source_subnetwork_ip_ranges_to_nat = "LIST_OF_SUBNETWORKS"
  subnetwork {
    name                    = var.source-subnet-id #google_compute_subnetwork.subnet.id
    source_ip_ranges_to_nat = ["ALL_IP_RANGES"]
  }
  log_config {
    enable = true
    filter = "ERRORS_ONLY"
  }
}