#!/bin/bash
# Objetivo: instalar o docker no debian
# Criado em: 30 de junho
# Atualizado em: ------------
# Criado por: Jacqueline Rodrigues
# Contato: jrodrigues@interfaceuptech.com


# Verificar se o Docker está instalado
if command -v docker >/dev/null 2>&1; then
    echo "Docker está instalado."
else
    echo "Docker não está instalado."
    echo "Realizando instalações principais para executar o docker..."
    sleep 3s
    apt install curl apt-transport-https ca-certificates curl gnupg2 software-properties-common -y
    echo "Adicionando chave GPG do repositório oficial do docker..."
    sleep 3s
    curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -
    echo "Adicionando repositório oficial do docker no sources.list..."
    sleep 3s
    add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian/ $(lsb_release -cs) stable"
    echo "Atualizando lista de repositório e atualizando pacotes..."
    sleep 3s
    apt update && apt upgrade -y
    echo "Instalando e configurando o docker..."
    sleep 3s
    apt install docker-ce docker-ce-cli containerd.io -y
    echo "Iniciando o docker..."
    sleep 3s
    systemctl start docker
    systemctl enable docker
    systemctl status docker
    echo "Iniciando container hello-world..."
    sleep 3s
    docker run hello-world
fi
