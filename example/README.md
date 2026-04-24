# Exemplo de Uso do Módulo VPC

Este exemplo demonstra como usar o módulo VPC para criar uma VPC com múltiplas subnets em diferentes availability zones.

## Pré-requisitos

- Terraform >= 1.0
- Credenciais AWS configuradas
- Permissões para criar VPC e Subnets

## Como Usar

### 1. Inicializar o Terraform

```bash
cd example
terraform init
```

### 2. Revisar o Plano

```bash
terraform plan
```

### 3. Aplicar as Mudanças

```bash
terraform apply
```

### 4. Destruir os Recursos (quando não precisar mais)

```bash
terraform destroy
```

## O Que Será Criado

Este exemplo cria:

- **1 VPC** com CIDR `10.0.0.0/16` e tag Name `my-vpc`
- **3 Subnets** distribuídas em 3 availability zones:
  - Subnet 1: `10.0.0.0/24` em `us-east-1a`
  - Subnet 2: `10.0.1.0/24` em `us-east-1b`
  - Subnet 3: `10.0.2.0/24` em `us-east-1c`
- **Tags** aplicadas a todos os recursos (incluindo a tag Name)

## Personalizando

### Alterar o CIDR da VPC

```hcl
module "vpc" {
  source = "../"
  
  cidr = "192.168.0.0/16"  # Seu CIDR customizado
  azs  = ["us-east-1a", "us-east-1b"]
}
```

### Usar Apenas Uma Availability Zone (Single-AZ)

```hcl
module "vpc" {
  source = "../"
  
  cidr = "10.0.0.0/16"
  azs  = ["us-east-1a"]  # Apenas uma AZ
}
```

### Adicionar Tags Customizadas

```hcl
module "vpc" {
  source = "../"
  
  cidr = "10.0.0.0/16"
  azs  = ["us-east-1a", "us-east-1b"]
  
  tags = {
    Name        = "production-vpc"
    Environment = "production"
    Project     = "my-project"
    CostCenter  = "engineering"
  }
}
```

> **Nota:** A tag `Name` será aplicada tanto à VPC quanto às subnets. As subnets herdarão o mesmo nome da VPC através das tags.

## Outputs

Após aplicar, você terá acesso aos seguintes outputs:

- `vpc_id` - ID da VPC criada
- `vpc_cidr` - CIDR block da VPC
- `subnet_ids` - Lista com IDs de todas as subnets criadas
- `availability_zones` - Lista das availability zones utilizadas

### Visualizar Outputs

```bash
terraform output
```

## Estrutura de Custos

Os recursos criados por este exemplo têm os seguintes custos aproximados na AWS:

- VPC: **Gratuito**
- Subnets: **Gratuito**
- Data Transfer: Cobrado conforme uso

> **Nota:** Sempre destrua os recursos de teste para evitar custos desnecessários.

## Troubleshooting

### Erro: "InvalidParameterValue"

Verifique se as availability zones especificadas estão disponíveis na sua região AWS.

### Erro: "The CIDR 'x.x.x.x/x' conflicts with another subnet"

O CIDR especificado já está em uso. Escolha um CIDR diferente.

## Próximos Passos

Após criar a VPC e subnets, você pode:

1. Adicionar Internet Gateway
2. Configurar Route Tables
3. Criar Security Groups
4. Lançar instâncias EC2 nas subnets
