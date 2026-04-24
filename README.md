# Repositório dedicado ao projeto de conclusão de curso Descomplicando Terraform - VPC

## Sobre

Módulo Terraform para criação de VPC na AWS com suporte a múltiplas availability zones.

## Segurança

Este módulo utiliza **tfsec** para validação de segurança na pipeline de CI/CD. O tfsec realiza análise estática do código Terraform em busca de:

- Potenciais problemas de segurança
- Más práticas de configuração
- Compliance com best practices da AWS

A validação é executada automaticamente em cada push/pull request através do GitHub Actions.

## Testes

O módulo possui testes automatizados usando **Terraform Test** para garantir a qualidade e funcionamento correto dos recursos.

### Executar Testes Localmente

```bash
terraform test
```

### O Que é Testado

Os testes validam:
- ✅ Criação correta da VPC com o CIDR especificado
- ✅ Criação das subnets nas availability zones corretas
- ✅ Aplicação adequada de tags nos recursos

Os testes são executados automaticamente na pipeline de CI/CD antes de qualquer merge.

### Estrutura de Testes

```
tests/
└── modulo.tftest.hcl  # Testes de validação do módulo
```

## Exemplo de Uso

Veja a pasta [example/](./example/) para um exemplo completo de como usar este módulo.

```hcl
module "vpc" {
  source = "github.com/seu-usuario/seu-repo"

  cidr = "10.0.0.0/16"
  azs  = ["us-east-1a", "us-east-1b", "us-east-1c"]

  tags = {
    Name        = "my-vpc"
    Environment = "production"
  }
}
```

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