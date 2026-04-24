variable "cidr" {
  type        = string
  description = "VPC cidr"
}

variable "azs" {
  type        = list(string)
  description = "Availability Zones"
  default     = []
}

variable "tags" {
  type        = map(string)
  description = "Tags to apply to resources"
  default     = {}
}
