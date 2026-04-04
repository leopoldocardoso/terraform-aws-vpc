output "cidr_block" {
  description = "VPC CIDR block"
  value = aws_vpc.main-vpc.cidr_block
}

output "subnet_cidr_block" {
  description = "Subnet CIDR Block"
  value = try(aws_subnet.main-subnet[0].id, null)
}

output "sg_id" {
  description = "SG ID"
  value       = try(aws_security_group.main-sg[0].id, null)
}

