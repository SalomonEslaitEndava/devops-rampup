module "networking" {
  source = "./src/modules/network"

  networkname             = "rampup-vpc"
  auto_create_subnetworks = false
}

module "management-subnet" {
  source = "./src/modules/subnet"

  subnet_name              = "management-subnet"
  subnet_cidr_range        = "10.0.0.0/24"
  network                  = module.networking.network-name
  region                   = "us-west1"
  private_ip_google_access = false

  depends_on = [module.networking]
}

module "kubernetes-subnet" {
  source = "./src/modules/subnet"

  subnet_name              = "kubernetes-subnet"
  subnet_cidr_range        = "10.0.1.0/24"
  network                  = module.networking.network-name
  region                   = "us-west1"
  private_ip_google_access = false
}

module "ssh-firewall-rule" {
  source = "./src/modules/firewall-rules"

  firewall_rule_name = "ssh-rule"
  network            = module.networking.network-name
  source_ranges      = ["0.0.0.0/0"]
  protocol           = "tcp"
  ports              = ["22"]
  target_tags        = ["ssh"]

  depends_on = [module.networking]
}

module "jenkins-rule" {
  source = "./src/modules/firewall-rules"

  firewall_rule_name = "jenkins-rule"
  network            = module.networking.network-name
  source_ranges      = ["0.0.0.0/0"]
  protocol           = "tcp"
  ports              = ["50000", "8080"]
  target_tags        = ["jumpbox"]

  depends_on = [module.networking]
}

module "salt-rule" {
  source = "./src/modules/firewall-rules"

  firewall_rule_name = "salt-rule"
  network            = module.networking.network-name
  source_ranges      = ["0.0.0.0/0"]
  protocol           = "tcp"
  ports              = ["4505", "4506"]
  target_tags        = ["salt"]

  depends_on = [module.networking]
}

module "cloud-nat" {
  source = "./src/modules/nat"

  router-name   = "rampup-router"
  subnet-region = module.kubernetes-subnet.subnet-region
  network-id    = module.networking.network-id

  nat-name         = "rampup-nat"
  source-subnet-id = module.kubernetes-subnet.subnet-id # output de subnet id 

  depends_on = [module.kubernetes-subnet]
}