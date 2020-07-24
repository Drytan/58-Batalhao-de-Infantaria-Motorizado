#!/bin/bash

#############################################
#                                           #
#   Criando por Kleidimar Martins d(-_-)b   #
#                                           #
#############################################

service tomcat7 stop

#RESTAURA BANCO DE DADOS
su -c "dropdb spedDB" -s /bin/sh postgres
su -c "createdb spedDB -O sped -E UTF8" -s /bin/sh postgres
su -c "psql -d spedDB < /media/BACKUPS/arquivos/backup_SPED-*.sql" -s /bin/sh postgres

#RESTAURA APLICAÇÃO TOMCAT
rm -rf /var/lib/tomcat7/webapps/sped*
cp /media/BACKUPS/arquivos/backup-*/sped.war /var/lib/tomcat7/webapps/

service tomcat7 start
