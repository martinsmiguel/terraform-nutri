#!/bin/bash

# Carregar variáveis de ambiente do arquivo .env
set -o allexport
source .env
set -o allexport

export AWS_REGION="sa-east-1"
export AWS_PROFILE="terraform-miguel"

# Criar arquivo terraform.tfvars.json
cat > terraform.tfvars.json <<EOL
{
  "region": "${AWS_REGION}",
  "profile": "${AWS_PROFILE}",
  "rds_db_name": "${DB_NAME}",
  "rds_username": "${DB_USER_NAME}",
  "rds_password": "${DB_PASSWORD}"
}
EOL

# Inicializar Terraform
terraform init
