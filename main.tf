#tfsec:ignore:aws-ec2-require-vpc-flow-logs-for-all-vpcs
resource "aws_vpc" "vpc_main" {
  cidr_block = var.cidr
  tags       = merge(var.tags, local.common_tags)
}

resource "aws_subnet" "subnet_main" {
  for_each          = toset(var.azs)
  vpc_id            = aws_vpc.vpc_main.id
  cidr_block        = cidrsubnet(var.cidr, 8, index(var.azs, each.value))
  availability_zone = each.value
  tags              = merge(var.tags, local.common_tags)
}