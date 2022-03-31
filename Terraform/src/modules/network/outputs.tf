# output "subnet_name" {
#  value = google_compute_subnetwork.subnet.name 
# }

output "network-name" {
    value = google_compute_network.vpc-network.name  
}

output "network-id" {
  value = google_compute_network.vpc-network.id
}
