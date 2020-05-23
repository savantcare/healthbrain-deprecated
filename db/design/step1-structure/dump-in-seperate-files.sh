#!/bin/bash

TIMESTAMP=$(date +"%F")
BACKUP_DIR="/dev/shm/mysql/"
MYSQL_USER="root"
MYSQL=/usr/bin/mysql
MYSQL_PASSWORD="jaikalima"
MYSQLDUMP=/usr/bin/mysqldump
 
mkdir -p "$BACKUP_DIR"
 
databases=`$MYSQL --user=$MYSQL_USER -p$MYSQL_PASSWORD -e "SHOW DATABASES;" | grep -Ev "(Database|information_schema|performance_schema)" | grep "DB_SC"`

# Not writing the time stamp in the file name so it is easy to know if there is a diff using git diff or gitlab web interface.

# --skip-dump-date  has been given since otherwise git diff will show that the file has changed since the file have the statement
# --- Dump completed on 2020-01-29  9:10:06
# +-- Dump completed on 2020-01-29  9:11:14


for db in $databases; do
  $MYSQLDUMP --force --opt --user=$MYSQL_USER -p$MYSQL_PASSWORD --databases $db --no-data --skip-dump-date > "$BACKUP_DIR/$db/structure-on-$(date +%F).sql"
done
