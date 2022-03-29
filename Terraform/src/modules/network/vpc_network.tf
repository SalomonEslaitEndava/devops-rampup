resource "google_compute_network" "vpc-network" {
  name                    = var.networkname
  auto_create_subnetworks = var.auto_create_subnetworks
}
