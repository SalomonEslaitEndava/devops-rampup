# resource "google_compute_firewall" "firewall-rule" {
#   name          = var.firewall_rule_name
#   network       = google_compute_network.vpc-network.self_link
#   source_ranges = var.source_ranges
#   allow {
#     protocol = var.protocol
#     ports    = var.ports
#   }
# }
