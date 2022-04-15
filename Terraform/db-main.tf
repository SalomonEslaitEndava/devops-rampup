module "database" {  
    source = "./src/modules/database"
    
    private_ip_name = "db-private-connenction"
    purpose = "VPC_PEERING"
    address_type = "INTERNAL"
    private_ip_address_version = "IPV4"
    prefix_length = 20
    private_network_name_ip_address = module.networking.network-self-link #network-name
    
    network_name = module.networking.network-self-link # .network-name
    service = "servicenetworking.googleapis.com"
    reserved_peering_ranges = module.database.reserved-peering-ranges
    
    database_name = "movie_db"
    database_instance =  module.database.database-name #module.database.database-name
    
    database_instance_name = "rampup-sp-db"
    database_region = "us-west1"
    database_version = "MYSQL_8_0"
    deletion_protection = false
    database_tier = "db-g1-small"
    availability_type = "REGIONAL"
    disk_size = 10 
    ipv4_enabled = false
    private_network_instance = module.networking.network-self-link
    
    database_user_name = "root"
    database_instance_credentials = module.database.database-name #revisar
    database_password = "admin" #revisar sensitive variables

    dependence_on =[module.networking]
}