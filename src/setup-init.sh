#!/bin/bash

# Função para exibir mensagens
log() {
    echo "[INFO] $1"
}

# Instalação do mise
log "Instalando o mise..."
if command -v mise &> /dev/null
then
    log "Mise já está instalado"
else
    curl -sSL https://mise.sh | sh
    if [ $? -ne 0 ]; then
        echo "[ERROR] Falha na instalação do mise"
        exit 1
    fi
fi

# Adicionando mise ao PATH (se necessário)
export PATH="$HOME/.mise/bin:$PATH"

# Instalação do Terraform
log "Instalando o Terraform..."
if command -v terraform &> /dev/null
then
    log "Terraform já está instalado"
else
    mise -i terraform
    if [ $? -ne 0 ]; then
        echo "[ERROR] Falha na instalação do Terraform"
        exit 1
    fi
fi

# Instalação do AWS CLI
log "Instalando o AWS CLI..."
if command -v aws &> /dev/null
then
    log "AWS CLI já está instalado"
else
    if [[ "$OSTYPE" == "linux-gnu"* ]]; then
        curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
        unzip awscliv2.zip
        sudo ./aws/install
    elif [[ "$OSTYPE" == "darwin"* ]]; then
        curl "https://awscli.amazonaws.com/AWSCLIV2.pkg" -o "AWSCLIV2.pkg"
        sudo installer -pkg AWSCLIV2.pkg -target /
    else
        echo "[ERROR] Sistema operacional não suportado para instalação automática do AWS CLI"
        exit 1
    fi

    if [ $? -ne 0 ]; then
        echo "[ERROR] Falha na instalação do AWS CLI"
        exit 1
    fi
fi

# Definir a versão do Terraform baseada no arquivo terraform.version
if [ -f "terraform.version" ]; then
    version=$(cat terraform.version)
    log "Configurando a versão do Terraform para $version"
    mise -v $version
    if [ $? -ne 0 ]; then
        echo "[ERROR] Falha ao configurar a versão do Terraform para $version"
        exit 1
    fi
else
    echo "[ERROR] Arquivo terraform.version não encontrado"
    exit 1
fi

log "Instalação e configuração concluídas"
