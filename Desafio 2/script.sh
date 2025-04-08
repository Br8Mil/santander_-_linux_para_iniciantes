#!/bin/bash

set -e  # Para parar o script em caso de erro

echo "Atualizar e instalar pacotes necessários"
sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get install apache2 -y
sudo apt-get install unzip -y

cd /tmp

echo "Baixar o arquivo zip"
wget https://github.com/denilsonbonatti/linux-site-dio/archive/refs/heads/main.zip

echo "Verificar se o arquivo foi baixado corretamente"
if [ ! -f "main.zip" ]; then
    echo "Erro: Arquivo main.zip não encontrado."
    exit 1
fi

echo "Extrair o conteúdo"
unzip main.zip

echo "Verificar se o diretório foi criado corretamente"
if [ ! -d "linux-site-dio-main" ]; then
    echo "Erro: Diretório linux-site-dio-main não encontrado."
    exit 1
fi

cd linux-site-dio-main

echo "Copiar os arquivos para o diretório do Apache"
sudo cp -R * /var/www/html/

echo "Arquivos copiados com sucesso para o Apache"

echo "Limpar o arquivo baixado"
rm /tmp/main.zip

echo "Script concluído com sucesso."