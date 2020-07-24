#!/bin/bash
#Script de Backup - Aplicação e Banco de dados

#############################################
#                                           #
#   Criando por Kleidimar Martins d(-_-)b   #
#                                           #
#############################################

rm -rf /home/secinfor-chefe/bkp_*
rm -rf /root/bkp_*
mkdir /root/bkp_$(date +%Y-%m-%d)

cp -r /var/www/html/58bimtz/ /root/bkp_$(date +%Y-%m-%d)

mysqldump -u root -psigned -x -e --databases 58bimtz > /root/bkp_$(date +%Y-%m-%d)/banco_58bimtz_$(date +%Y-%m-%d).sql

zip -r bkp_58BIMtz_$(date +%d-%m-%Y).zip /root/bkp_$(date +%Y-%m-%d)

cp -r /root/bkp_58BIMtz_*.zip /home/secinfor-chefe/

#sshpass -p "1234" scp -r /root/bkp_site_58bimtz/bkp_$(date +%Y-%m-%d) secinfor-aux@10.57.28.28:/home/bkp_servers/server_58bimtz/
