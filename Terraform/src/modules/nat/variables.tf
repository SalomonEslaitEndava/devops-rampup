variable "router-name" {
  description = "cloud router name"
  type = string 
  default = ""
}

variable "subnet-region" {
  description = "subnet region"
  type = string 
  default = ""
}

variable "network-id" {
  description = "vpc network id"
  type = string
  default = ""
}

variable "nat-name" {
  description = "nat gateway name"
  type = string
  default = ""
}