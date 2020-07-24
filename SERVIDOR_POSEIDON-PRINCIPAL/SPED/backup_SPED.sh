#!/bin/bash

#############################################
#                                           #
#   Criando por Kleidimar Martins d(-_-)b   #
#                                           #
#############################################

cd /media/backup/backup-sped/

rm -rf /media/backup/backup-sped/*

mkdir /media/backup/backup-sped/backup-sped-$(date +%d-%m-%Y)
chmod -R 777 /media/backup/backup-sped/backup-sped-$(date +%d-%m-%Y)

cd /media/backup/backup-sped/backup-sped-$(date +%d-%m-%Y)
echo "Pastas antigas removidas..."
echo "Nova pasta de backup criada..."

service tomcat7 stop
echo "Tomcat parado..."

service slapd stop
echo "LDAP parado..."

service apache2 stop
echo "Apache2 parado..."

slapcat -l /media/backup/backup-sped/backup-sped-$(date +%d-%m-%Y)/backup_ldap_$(date +%d-%m-%Y).ldif
echo "Backup do LDAP feito...\n"

cp /var/lib/tomcat7/webapps/sped.war /media/backup/backup-sped/backup-sped-$(date +%d-%m-%Y)/
echo "Backup da aplicação Tomcat comcluida..." 

echo "Apagando backup de Banco de Dados antigos..." 

sudo -H -u postgres bash -c "pg_dump -E UTF8 -v spedDB > /media/backup/backup-sped/backup-sped-$(date +%d-%m-%Y)/backup_SPED-$(date +%d-%m-%Y).sql"

echo "Backup do Banco de Dados atual completo..." 

service tomcat7 start
service slapd start
service apache2 start
