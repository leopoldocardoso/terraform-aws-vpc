variable "create_vpc" {
  default     = true
  description = "Controls if VPC should be created (it affects almost all resources)"
}
variable "cidr" {
  description = "The IPv4 CIDR block for the VPC"
  type        = string
}

variable "tags" {
  description = "Nome da VPC"
  type        = map(string)
  default     = {}
}

variable "subnet" {
  type    = bool
  default = true
}

variable "cidr_block" {
  type = string
}

variable "availability_zone" {
  description = "A list of availability zones names or ids in the region"
  type        = string
  default     = null
}
