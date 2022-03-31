output "subnet-region" {
    value = google_compute_subnetwork.subnet.region  
}

output "subnet-id" {
  value = google_compute_subnetwork.subnet.id
}
