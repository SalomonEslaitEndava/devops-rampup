variable "firewall_rule_name" {
  description = "firewall name"
  type        = string
  default     = ""
}

variable "source_ranges" {
  description = "ingress source ip"
  type        = list(string)
  default     = []
}

variable "protocol" {
  description = "protocol type"
  type        = string
  default     = ""
}

variable "ports" {
  description = "allow ports"
  type        = list(string)
  default     = []
}

variable "network" {
  description = "network name"
  type = string
  default = ""
}
