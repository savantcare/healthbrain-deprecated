Q) How to create a fresh DB with structure and master data?

db> docker stop healthbrain_mysqld_1
rm -rf mysql
db> unzip may-22-2020.zip -d mysql
chmod -R 777 mysql
/healthbrain> docker-compose -f docker-compose-dev.yml up -d mysqld 

Q) How to create a new structure and master data?
var-lib-mysql> zip may-22-2020.zip * -r