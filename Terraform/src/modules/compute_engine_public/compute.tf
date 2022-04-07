resource "google_compute_instance" "default" {
  # count = var.instance_count
  name                      = var.instance_name
  zone                      = var.instance_zone
  tags                      = var.tags
  machine_type              = var.machine_type
  allow_stopping_for_update = var.allow_stopping_for_update

  boot_disk {

    initialize_params {
      image = var.instance_image
    }
  }

  network_interface {
    subnetwork = var.subnetwork #"iac-subnet" #google_compute_subnetwork.iac-subnet.name
    access_config {}
  }

  metadata_startup_script = var.starup_script #file("install-saltstack.sh")

  
}
output "ipp" {
    value = google_compute_instance.default.network_interface.0.network_ip
  }
