<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | 6.39.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 6.39.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_security_group.main-sg](https://registry.terraform.io/providers/hashicorp/aws/6.39.0/docs/resources/security_group) | resource |
| [aws_subnet.main-subnet](https://registry.terraform.io/providers/hashicorp/aws/6.39.0/docs/resources/subnet) | resource |
| [aws_vpc.main-vpc](https://registry.terraform.io/providers/hashicorp/aws/6.39.0/docs/resources/vpc) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_availability_zone"></a> [availability\_zone](#input\_availability\_zone) | A list of availability zones names or ids in the region | `string` | `null` | no |
| <a name="input_cidr"></a> [cidr](#input\_cidr) | The IPv4 CIDR block for the VPC | `string` | n/a | yes |
| <a name="input_cidr_block"></a> [cidr\_block](#input\_cidr\_block) | n/a | `string` | n/a | yes |
| <a name="input_create_vpc"></a> [create\_vpc](#input\_create\_vpc) | Controls if VPC should be created (it affects almost all resources) | `bool` | `true` | no |
| <a name="input_egress_rules"></a> [egress\_rules](#input\_egress\_rules) | Lista de regras de egress | <pre>list(object({<br/>    description = optional(string, null)<br/>    from_port   = number<br/>    to_port     = number<br/>    protocol    = string<br/>    cidr_blocks = list(string)<br/>  }))</pre> | `[]` | no |
| <a name="input_ingress_rules"></a> [ingress\_rules](#input\_ingress\_rules) | Lista de regras de ingress | <pre>list(object({<br/>    description = optional(string, null)<br/>    from_port   = number<br/>    to_port     = number<br/>    protocol    = string<br/>    cidr_blocks = list(string)<br/>  }))</pre> | `[]` | no |
| <a name="input_sg"></a> [sg](#input\_sg) | Security Group | `bool` | n/a | yes |
| <a name="input_subnet"></a> [subnet](#input\_subnet) | n/a | `bool` | `true` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Nome da VPC | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cidr_block"></a> [cidr\_block](#output\_cidr\_block) | VPC CIDR block |
| <a name="output_sg_id"></a> [sg\_id](#output\_sg\_id) | SG ID |
| <a name="output_subnet_cidr_block"></a> [subnet\_cidr\_block](#output\_subnet\_cidr\_block) | Subnet CIDR Block |
<!-- END_TF_DOCS -->