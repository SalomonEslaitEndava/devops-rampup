resource "tls_private_key" "ssh-key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

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
  

  # metadata_startup_script = var.starup_script #file("install-saltstack.sh")

  provisioner "remote-exec" {
    connection {
      type        = "ssh"
      user        = "root"
      timeout     = "500s"
      private_key = "${file("~/.ssh/google_compute_engine")}"
    }

    inline = [
      "cd ~",
      "touch archivodeprueba.txt",
    ]
  }

  metadata {
    ssh-keys = "root:${file("~/.ssh/google_compute_engine.pub")}"
  }

  
}

resource "google_compute_firewall" "gh-9564-firewall-externalssh" {
  name    = "gh-9564-firewall-externalssh"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["externalssh"]
}

resource "google_compute_instance" "dev1" {
  name         = "gcp-rhel7-dev1-tf"
  machine_type = "f1-micro"
  zone         = "us-central1-a"
  tags         = ["externalssh"]

  boot_disk {
    initialize_params {
      image = "centos-cloud/centos-7"
    }
  }

  network_interface {
    network = "default"

    access_config {
      # Ephemeral
    }
  }

  provisioner "remote-exec" {
    connection {
      type        = "ssh"
      user        = "root"
      timeout     = "500s"
      private_key = "${file("~/.ssh/google_compute_engine")}"
    }

    inline = [
      "touch ~/temp.txt",
    ]
  }

  # Ensure firewall rule is provisioned before server, so that SSH doesn't fail.
  depends_on = ["google_compute_firewall.gh-9564-firewall-externalssh"]

  service_account {
    scopes = ["compute-ro"]
  }

  metadata {
    ssh-keys = "USERNAME:${file("~/.ssh/google_compute_engine.pub")}"
  }
}