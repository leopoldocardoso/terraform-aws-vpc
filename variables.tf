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

variable "sg" {
  description = "Security Group"
  type        = bool
}

variable "ingress_rules" {
  description = "Lista de regras de ingress"
  type = list(object({
    description = optional(string, null)
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
  default = []
}

variable "egress_rules" {
  description = "Lista de regras de egress"
  type = list(object({
    description = optional(string, null)
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
  default = []
}
