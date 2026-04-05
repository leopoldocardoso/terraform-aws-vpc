output "cidr_block" {
  description = "VPC CIDR block"
  value       = aws_vpc.main-vpc.cidr_block
}

output "subnet_id" {
  description = "Subnet ID"
  value       = try(aws_subnet.main-subnet[0].id, null)
}

