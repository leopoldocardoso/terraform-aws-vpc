#tfsec:ignore:aws-ec2-require-vpc-flow-logs-for-all-vpcs
resource "aws_vpc" "main-vpc" {
  cidr_block = var.cidr
  tags       = merge(var.tags, local.common_tags)

}

resource "aws_subnet" "main-subnet" {
  count             = var.subnet ? 1 : 0
  vpc_id            = aws_vpc.main-vpc.id
  cidr_block        = var.cidr_block
  availability_zone = var.availability_zone
  tags              = merge(var.tags, local.common_tags)
}

