output "vpc_id" {
  description = "VPC ID"
  value       = aws_vpc.vpc_main.id
}
output "cidr_block" {
  description = "VPC CIDR block"
  value       = aws_vpc.vpc_main.cidr_block
}


output "azs" {
  description = "Availability Zones of created subnets"
  value       = [for subnet in aws_subnet.subnet_main : subnet.availability_zone]
}


