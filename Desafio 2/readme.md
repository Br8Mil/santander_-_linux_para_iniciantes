# **Módulo 3 - Servidores Linux e Docker/Docker: Utilização Prática no Cenário de Micros serviços**

## > **Concluído em 08/04/2025**

## **Texto do Desafio:**

    Neste projeto iremos criar um script onde será provisionado um servidor web automaticamente. Um servidor web é um software e hardware que usa HTTP (Hypertext Transfer Protocol) e outros protocolos para responder a solicitações de clientes feitas pela World Wide Web. O principal trabalho de um servidor da web é exibir o conteúdo do site por meio do armazenamento, processamento e entrega de páginas da web aos usuários.

    Agora é a sua vez de ser o protagonista! Implemente o desafio sugerido pela expert criando um repositório próprio e, com isso, aumentando ainda mais seu portfólio de projetos no GitHub!

**Pré-requisitos**

    Linux Server e GitHub

**Informações Úteis**

    Slide na Pasta(material do desafio)

## **Resolução do Desafio (Explicações e Prints):**

arquivo script.sh, passei o arquivos por revisão de ia e ela sugeriu algumas melhorias (veja o código abaixo)

```
#!/bin/bash

set -e  # Para parar o script em caso de erro

echo "Atualizando programas atuais e instalando o apache e unzip"

# Atualizar e instalar pacotes necessários
sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get install apache2 -y
sudo apt-get install unzip -y

cd /tmp

echo "Baixando e movendo os arquivos para o diretório do apache"

# Baixar o arquivo zip
wget https://github.com/denilsonbonatti/linux-site-dio/archive/refs/heads/main.zip

# Verificar se o arquivo foi baixado corretamente
if [ ! -f "main.zip" ]; then
    echo "Erro: Arquivo main.zip não encontrado."
    exit 1
fi

# Extrair o conteúdo
unzip main.zip

# Verificar se o diretório foi criado corretamente
if [ ! -d "linux-site-dio-main" ]; then
    echo "Erro: Diretório linux-site-dio-main não encontrado."
    exit 1
fi

cd linux-site-dio-main

# Copiar os arquivos para o diretório do Apache
sudo cp -R * /var/www/html/

# Limpar o arquivo .zip
rm /tmp/main.zip

echo "Arquivos copiados com sucesso para o Apache"

# Verificar se o Apache está rodando
sudo systemctl status apache2 || { echo "Erro ao iniciar o Apache"; exit 1; }

echo "Script concluído com sucesso."
```
## **Ferramentas Usadas:**

[GitHub](https://github.com/)
