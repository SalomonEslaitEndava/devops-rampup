variable "networkname" {
  description = "VPC name"
  type        = string
  default     = ""
}

variable "auto_create_subnetworks" {
  description = "subnet creation flag"
  type        = bool
  default     = false
}
