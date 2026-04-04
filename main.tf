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

resource "aws_security_group" "main-sg" {
  count       = var.sg == true ? 1 : 0
  description = "Security group for VPC ${aws_vpc.main-vpc.id}"
  vpc_id      = aws_vpc.main-vpc.id
  dynamic "ingress" {
    for_each = var.ingress_rules
    content {
      description = ingress.value.description
      from_port   = ingress.value.from_port
      to_port     = ingress.value.to_port
      protocol    = ingress.value.protocol
      cidr_blocks = ingress.value.cidr_blocks
    }
  }
  dynamic "egress" {
    for_each = var.egress_rules
    content {
      description = egress.value.description
      from_port   = egress.value.from_port
      to_port     = egress.value.to_port
      protocol    = egress.value.protocol
      cidr_blocks = egress.value.cidr_blocks
    }
  }
  tags = merge(var.tags, local.common_tags)
}

