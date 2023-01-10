#!/bin/bash

# Atualizar repositórios
apt update && apt upgrade

# Os 2 pacos abaixo são para adicionar um futuro repositorio
apt-get install -y gnupg2 lsb-release

# Feito isso, vamos adicionar o repositório do influxDB
wget -qO- https://repos.influxdata.com/influxdb.key | apt-key add -
source /etc/os-release
echo "deb https://repos.influxdata.com/debian $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/influxdb.list

# Agora podemos atualizar e instalar o InfluxDB
apt update
apt install influxdb

# Agora vamos iniciar o serviço do InfluxDB
systemctl enable influxdb

# A seguir vamos modificar algumas linhas de configuração no caminho abaixo
echo "[http]
	auth-enabled = true
[udp]
	enabled = true
    bind-address = ":8089"
    database = "influxdb"
    batch-size = 5000
    batch-timeout = "ls""> /etc/influxdb/influxdb.conf
	
# Após isso, vamos reiniciar os serviços
systemctl restart influxdb

# InfluxDB Database
# Para iniciarmos a configuração, digite o comando abaixo:
influx

# Após isso vamos criara um usuário administrador
CREATE USER admin WITH PASSWORD 'P@ssword' WITH ALL PRIVILEGES

# Agora vamos nos conectar ao InfluxDB com o novo usuário
influx --userrname admin --pasword P@ssword

# Aqui criaremos o bando de dados utilizado posteriormente
CREATE DATABASE influxdb
CREATE USER influxuser WITH PASSWORD 'P@ssword'
GRANT ALL ON influxdb TO influxuser
exit

