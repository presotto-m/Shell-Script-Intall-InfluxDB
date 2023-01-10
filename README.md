# Shell-Script-Intall-InfluxDB
Shell Script para instalação de InfluxDB de forma automatizada para OS Debian 11

**Importante:** este é um trabalho em andamento.

**Ainda mais importante:** Se você realmente planeja usar isso, não se esqueça de editar os arquivos de configuração de acordo com suas necessidades (arquivos de serviço, arquivos de configuração YAML, etc.). Os arquivos de configuração fornecidos aqui são apenas arquivos genéricos. Você pode encontrar o arquivo de configuração em: /etc/influxdb/influxdb.conf

Este script baixa os arquivos no diretório atual. Você poderia mudar isso.

Quaisquer sugestões e contribuições são bem-vindas.

# Como usar isso?

* chmod +x influxdb.sh

* sudo ./influxdb.sh

## Instalação completa

A instalação completa instalará o seguinte:

* InfluxDB

# Altere arquivos como:

* [http]
	 auth-enabled = true
 [udp]
	 enabled = true
     bind-address = ":8089"
     database = "proxmoxdb"
     batch-size = 5000
     batch-timeout = "ls"

