resource "google_compute_firewall" "firewall-rule" {
  name          = var.firewall_rule_name
  network       = var.network
  source_ranges = var.source_ranges
  allow {
    protocol = var.protocol
    ports    = var.ports
  }
}
