# Repositório dedicado ao projeto de conclusão de curso Descomplicando Terraform - VPC

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
| [aws_subnet.subnet_main](https://registry.terraform.io/providers/hashicorp/aws/6.39.0/docs/resources/subnet) | resource |
| [aws_vpc.vpc_main](https://registry.terraform.io/providers/hashicorp/aws/6.39.0/docs/resources/vpc) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_azs"></a> [azs](#input\_azs) | Availability Zones | `list(string)` | `[]` | no |
| <a name="input_cidr"></a> [cidr](#input\_cidr) | VPC cidr | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags to apply to resources | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_azs"></a> [azs](#output\_azs) | Availability Zones of created subnets |
| <a name="output_cidr_block"></a> [cidr\_block](#output\_cidr\_block) | VPC CIDR block |
<!-- END_TF_DOCS -->