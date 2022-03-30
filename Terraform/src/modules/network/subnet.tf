resource "google_compute_subnetwork" "subnet" {
  name                     = var.subnet_name
  ip_cidr_range            = var.subnet_cidr_range
  network                  = var.network # google_compute_network.vpc-network.self_link
  region                   = var.region
  private_ip_google_access = var.private_ip_google_access
}