# Este arquivo de teste verifica se o código criará corretamente a vpc e a subnet

variables {
  subnet            = true
  cidr              = "10.0.0.0/16"
  cidr_block        = "10.0.1.0/24"
  availability_zone = "us-east-1a"
  sg                = true
  tags              = {}
}

run "valid_create_vpc_and_valid_create_subnet" {

  command = apply

  # Test VPC
  assert {
    condition     = aws_vpc["main-vpc"].cidr_block == var.cidr
    error_message = "Invalid CIDR block"
    
  }

  # Test Subnet
  assert {
    condition     = length(aws_subnet["main-subnet"]) == 1
    error_message = "Subnet was not created"
  }

  # Test Subnet CIDR Block
  assert {
    condition     = aws_subnet["main-subnet"][0].cidr_block == var.cidr_block
    error_message = "Invalid subnet CIDR block"
  }

  # Test availability zone
  assert {
    condition     = aws_subnet["main-subnet"][0].availability_zone == var.availability_zone
    error_message = "Subnet is not in the correct availability zone"
  }

}
