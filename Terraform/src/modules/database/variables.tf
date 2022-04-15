variable "private_ip_name" {
    description = "name for the private IP range"
    type = string
}

variable "purpose" {
    description = "database purpose"
    type = string
    default = "VPC_PEERING"
}

variable "address_type" {
    description = "addres type"
    type = string
    default = "INTERNAL" 
}

variable "private_ip_address_version" {
    description = "ip version"
    default = "IPV4"
}
variable "prefix_length" {
    description = "prefix lenght"
    type = number
    default = 20
}

variable "private_network_name_ip_address" {
    description = "IP address network"
    type = string
}

variable "network_name" {
    description = "network" #google_compute_network.private_network.self_link
}

variable "service" {
    description = "network service API"
    type = string
    default = "servicenetworking.googleapis.com"
  
}

variable "reserved_peering_ranges" {
    description = "reserved peering ranges name" #[google_compute_global_address.private_ip_address.name]
}

variable "database_name" {
    description = "name of database"
    type = string
}

variable "database_instance" {
    description = "database primary instance"
    type = string
}

variable "database_instance_name" {
    description = "database instance name"
    type = string
}

variable "database_region" {
    description = "region of database location"
    type = string
    default = "us-central1"
}

variable "database_version" {
    description = "data base version"
    type = string
    default = "POSTGRES_13"
}

variable "deletion_protection" {
    description = "is the delection protection enabled or disabled"
    type = bool
    default = false
}

variable "depends_on_database" {
    description = "dependence" #google_service_networking_connection.private_vpc_connection
}

variable "binary_loggin" {
  description = "binary loggin"
  type = bool
  default = true
}
variable "database_tier" {
    description = "tier type"
    default = "db-g1-small"
}

variable "availability_type" {
    description = "avalability type" 
    type = string
    default = "REGIONAL"
}

variable "backup_conf" {
  description = "backup flag"
  type = bool
  default = true
}
variable "disk_size" {
    description = "size of database disk"
    type = number
    default = 10
}

variable "ipv4_enabled" {
    description = "the database need a public ip?"
    type = bool
    default = false
}

variable "private_network_instance" {
    description = "the private network of the database" #google_compute_network.private_network.self_link
}

variable "database_user_name" {
    description = "username of the database"
    type = string
    default = "root"
}

variable "database_password" {
    description = "password of database"
    type = string
    default = "applicationuser"
}

variable "database_instance_credentials" {
    description = "database instance credentiasl"
    type = string
}

