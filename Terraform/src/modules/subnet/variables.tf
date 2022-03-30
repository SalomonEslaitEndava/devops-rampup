variable "subnet_name" {
  description = "subnet name"
  type        = string
  default     = "default-name"
}

variable "subnet_cidr_range" {
  description = "subnet cidr range"
  type        = string
  default     = "10.0.1.0/24"
}

variable "network" {
  description = "network name"
  type = string
  default = ""
}

variable "region" {
  description = "region"
  type        = string
  default     = ""
}

variable "private_ip_google_access" {
  description = "private ip access"
  type        = bool
  default     = false
}