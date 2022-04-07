resource "google_compute_firewall" "firewall-rule" {
  name          = var.firewall_rule_name
  network       = var.network
  source_ranges = var.source_ranges
  allow {
    protocol = var.protocol
    ports    = var.ports
  }
  target_tags = var.target_tags
}

# resource "google_compute_firewall" "firewall-rule" {


#   dynamic "name"{
#     for_each = var.firewall_rules 
#     content {
#       name = name.value["name"]
#       network       = var.network
#       source_ranges = name.value["source_range"]
#       allow {
#         protocol = name.value["protocol"]
#         ports = name.value["ports"]
#       }
#     }
#   }
# }