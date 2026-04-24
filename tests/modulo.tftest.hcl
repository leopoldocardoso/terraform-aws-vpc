# Este arquivo de teste verifica se o código criará corretamente a vpc e a subnet

variables {
  cidr = "10.0.0.0/16"
  azs  = ["us-east-1a", "us-east-1b"]
}

run "valid_create_vpc_and_valid_create_subnet" {

  command = apply

  # Test VPC
  assert {
    condition     = aws_vpc.vpc_main.cidr_block == var.cidr
    error_message = "Invalid CIDR block"
  }


  # Test Subnet
  assert {
    condition     = length(aws_subnet.subnet_main) > 0
    error_message = "No subnets were created"
  }

}
