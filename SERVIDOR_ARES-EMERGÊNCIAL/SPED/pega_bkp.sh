!/bin/bash

#############################################
#                                           #
#   Criando por Kleidimar Martins d(-_-)b   #
#                                           #
#############################################

rm -rf /usr/backup/arquivos/*

echo "###################### HTML ########################"
sshpass -p "***" scp -r ***@***:/home/secinfor-chefe/backup-sped/backup-sped-* /media/BACKUPS/arquivos

echo "################# BANCO DE DADOS ###################"
sshpass -p "***" scp -r ***@***:/var/lib/postgresql/backup_SPED-*.sql /media/BACKUPS/arquivos
