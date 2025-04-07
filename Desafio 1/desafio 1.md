# **Módulo 2 - Introdução a Linux e Scripts/Infraestrutura como Código: Script de Criação de Estrutura de Usuários, Diretórios e Permissões**

## > **Concluído em //2025**

## **Texto do Desafio:**

Neste projeto iremos criar um script onde toda a infraestrutura de usuários, grupos de usuários, diretórios e permissões serão criadas automaticamente. Será realizado o upload do arquivo de script no GitHub para futuras reutilizações do script. Sendo assim, toda nova máquina virtual que for iniciada já estará pronta para uso quando o script for executado.

Agora é a sua vez de ser o protagonista! Implemente o desafio sugerido pela expert criando um repositório próprio e, com isso, aumentando ainda mais seu portfólio de projetos no GitHub!

**Pré-requisitos**

>Linux Server e GitHub

**Informações Úteis**

[Git do projeto do professor](https://github.com/denilsonbonatti/linux-projeto1-iac)

Separamos aqui alguns materiais complementares como artigos, apostilas, apresentações, entre outros. Esses materiais serão úteis para você se aprofundar ainda mais nos principais temas deste Módulo e estão listados a seguir.

**Principais comandos do Linux**

[Apostila](https://www.linux.ime.usp.br/~albasalo/Apostila/apostila.pdf)

**Mais informações sobre usuários no Linux:**

[Usuários Linux](https://www.infowester.com/usuarioslinux.php)

Slide na Pasta(material do desafio)

## **Resolução do Desafio (Explicações e Prints):**

Foi gerado dois arquivos, sendo o **iac1.sh** e o **criar_user.sh**.

Caso queira ver o código dos dois

**iac1.sh**

```
#!/bin/bash

echo "Criando diretórios..."

mkdir /publico
mkdir /adm
mkdir /ven
mkdir /sec

echo "Criando grupos de usuários..."

groupadd GRP_ADM
groupadd GRP_VEN
groupadd GRP_SEC

echo "Criando usuários..."

useradd carlos -m -s /bin/bash -p $(openssl passwd -crypt Senha123) -G GRP_ADM
useradd maria -m -s /bin/bash -p $(openssl passwd -crypt Senha123) -G GRP_ADM
useradd joao -m -s /bin/bash -p $(openssl passwd -crypt Senha123) -G GRP_ADM

useradd debora -m -s /bin/bash -p $(openssl passwd -crypt Senha123) -G GRP_VEN
useradd sebastiana -m -s /bin/bash -p $(openssl passwd -crypt Senha123) -G GRP_VEN
useradd roberto -m -s /bin/bash -p $(openssl passwd -crypt Senha123) -G GRP_VEN

useradd josefina -m -s /bin/bash -p $(openssl passwd -crypt Senha123) -G GRP_SEC
useradd amanda -m -s /bin/bash -p $(openssl passwd -crypt Senha123) -G GRP_SEC
useradd rogerio -m -s /bin/bash -p $(openssl passwd -crypt Senha123) -G GRP_SEC

echo "Especificando permissões dos diretórios...."

chown root:GRP_ADM /adm
chown root:GRP_VEN /ven
chown root:GRP_SEC /sec

chmod 770 /adm
chmod 770 /ven
chmod 770 /sec
chmod 777 /publico

echo "Fim....."
```

**criar_user.sh**

```
#!/bin/bash


echo "Criando usuários do sistema...."

useradd guest10 -c "Usuário convidado" -s /bin/bash -m -p $(openssl passwd -crypt Senha123)
passwd guest10 -e

useradd guest11 -c "Usuário convidado" -s /bin/bash -m -p $(openssl passwd -crypt Senha123)
passwd guest11 -e

useradd guest12 -c "Usuário convidado" -s /bin/bash -m -p $(openssl passwd -crypt Senha123)
passwd guest12 -e

useradd guest13 -c "Usuário convidado" -s /bin/bash -m -p $(openssl passwd -crypt Senha123)
passwd guest13 -e

echo "Finalizado!!"
```

## **Ferramentas Usadas:**

[GitHub](https://github.com/)

[Virtual Box](https://www.virtualbox.org/wiki/Downloads)

[Ubuntu Server - 24.10](https://ubuntu.com/download/server)

[PuTTY](https://www.chiark.greenend.org.uk/~sgtatham/putty/latest.html)