module "jumpbox" {
  source = "./src/modules/compute_engine_public"

  # instance_count            = 1
  instance_name             = "jumpbox-host"
  instance_zone             = "us-west1-a"
  machine_type              = "e2-medium"
  allow_stopping_for_update = true
  instance_image            = "ubuntu-os-cloud/ubuntu-1804-lts"
  subnetwork                = module.management-subnet.subnet-id

  public-ip = true

  depends_on = [module.management-subnet]
}

module "master-node" {
  source = "./src/modules/compute_engine_private"

  # instance_count            = 1
  instance_name             = "master-node"
  instance_zone             = "us-west1-a"
  machine_type              = "e2-medium"
  allow_stopping_for_update = true
  instance_image            = "ubuntu-os-cloud/ubuntu-1804-lts"
  subnetwork                = module.management-subnet.subnet-id

  depends_on = [module.management-subnet]
}

module "master-node" {
  source = "./src/modules/compute_engine_private"

  count = 2
  # instance_count            = 1
  instance_name             = "worker-node-${count.index}"
  instance_zone             = "us-west1-a"
  machine_type              = "e2-medium"
  allow_stopping_for_update = true
  instance_image            = "ubuntu-os-cloud/ubuntu-1804-lts"
  subnetwork                = module.management-subnet.subnet-id

  depends_on = [module.management-subnet]
}