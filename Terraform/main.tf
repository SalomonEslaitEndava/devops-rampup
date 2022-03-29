module "networking" {
  source = "./src/modules/network"

  networkname             = "rampup_vpc"
  auto_create_subnetworks = false
}

module "management_subnet" {
  source = "./src/modules/network"

  subnet_name              = "management_subnet"
  subnet_cidr_range        = "10.0.0.0/24"
  region                   = "us-west1"
  private_ip_google_access = false
}

module "kubernetes_subnet" {
  source = "./src/modules/network"

  subnet_name              = "kubernetes_subnet"
  subnet_cidr_range        = "10.0.1.0/24"
  region                   = "us-west1"
  private_ip_google_access = false
}

module "ssh_firewall_rule" {
  source = "./src/modules/network"

  firewall_rule_name = "ssh_rule"
  source_ranges      = ["0.0.0.0/0"]
  protocol           = "tcp"
  ports              = ["22"]
}

module "jenkins_rule" {
  source = "./src/modules/network"

  firewall_rule_name = "jenkins_rule"
  source_ranges      = ["10.0.0.0/24"]
  protocol           = "tcp"
  ports              = ["50000"]
}
