#!/bin/bash

#############################################
#                                           #
#   Criando por Kleidimar Martins d(-_-)b   #
#                                           #
#############################################

pastalocal="/mnt/servidor"
pastasistema="/var"
pastatemp="/var/bkp"

if [ -d $pastatemp ]; then
cd $pastatemp
else
mkdir $pastatemp
cd $pastatemp
fi

# EXTRAI DADOS DO MYSQL
mysqldump -u root -p*** -x -e --databases cta > banco_$(date +%Y-%m-%d).sql 


# COMPACTA ARQUIVOS DO SISTEMA
zip -r var_$(date +%Y-%m-%d).zip $pastasistema

# CRIA PASTA DO DIA ATUAL E MOVE ARQUIVOS PARA ELA
if [ -d $pastalocal/bkps_sistema ]; then
#mkdir $pastalocal/bkps_sistema
mkdir $pastalocal/bkps_sistema/sisbol_$(date +%Y-%m-%d)/
mv banco_$(date +%Y-%m-%d).sql $pastalocal/bkps_sistema/sisbol_$(date +%Y-%m-%d)/
mv var_$(date +%Y-%m-%d).zip $pastalocal/bkps_sistema/sisbol_$(date +%Y-%m-%d)/
else
mkdir $pastalocal/bkps_sistema
mkdir $pastalocal/bkps_sistema/sisbol_$(date +%Y-%m-%d)/
mv banco_$(date +%Y-%m-%d).sql $pastalocal/bkps_sistema/sisbol_$(date +%Y-%m-%d)/
mv var_$(date +%Y-%m-%d).zip $pastalocal/bkps_sistema/sisbol_$(date +%Y-%m-%d)/
fi 
chown sisbol:sisbol -R /mnt/servidor/
sshpass -p "***" rsync -av --rsh="ssh -l root" /mnt/servidor/bkps_sistema/sisbol_$(date +%Y-%m-%d) ***@***:/home/bkp_servers/server_sisbol/
