module "vpc" {
  source = "../"

  cidr = "10.0.0.0/16"
  azs  = ["us-east-1a", "us-east-1b", "us-east-1c"]

  tags = {
    Name        = "my-vpc"
    Environment = "development"
    Team        = "devops"
    ManagedBy   = "terraform"
  }
}

output "vpc_id" {
  description = "The ID of the VPC"
  value       = module.vpc.vpc_id
}

output "vpc_cidr" {
  description = "The CIDR block of the VPC"
  value       = module.vpc.cidr_block
}

output "subnet_ids" {
  description = "List of subnet IDs"
  value       = module.vpc.subnet_ids
}

output "availability_zones" {
  description = "List of availability zones"
  value       = module.vpc.azs
}
