module "jumpbox" {
  source = "./src/modules/compute_engine_public"

  # instance_count            = 1
  instance_name             = "jumpbox-host"
  instance_zone             = "us-west1-a"
  machine_type              = "e2-medium"
  allow_stopping_for_update = true
  instance_image            = "ubuntu-os-cloud/ubuntu-1804-lts"
  subnetwork                = module.management-subnet.subnet-id

  depends_on = [module.management-subnet]
}

module "nodes" {
  source = "./src/modules/compute_engine_private"
  # for_each = local.nodes
  # instance_name = each.value

  count                     = 3
  instance_name             = count.index == 0 ? "master-node" : "worker-node-${count.index}"
  instance_zone             = "us-west1-a"
  machine_type              = "e2-medium"
  allow_stopping_for_update = true
  instance_image            = "ubuntu-os-cloud/ubuntu-1804-lts"
  subnetwork                = module.kubernetes-subnet.subnet-id

  depends_on = [module.management-subnet]
}
