# output "subnet_name" {
#  value = google_compute_subnetwork.subnet.name 
# }

output "network-name" {
    value = google_compute_network.vpc-network.name  
}

output "network-id" {
  value = google_compute_network.vpc-network.id
}

output "network-self-link" {
  value       = google_compute_network.vpc-network.self_link
  description = "The URI of the VPC being created"
}
