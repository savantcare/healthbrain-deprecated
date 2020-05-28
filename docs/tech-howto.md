### Q1) How to start the documentation system?

vue-client> npm run styleguide

### Q2) How to create a fresh DB with structure and master data?

```static
healthbrain/db> docker stop healthbrain_mysqld_1
healthbrain/db> rm -rf var-lib-mysql
healthbrain/db> unzip may-22-2020.zip -d var-lib-mysql
healthbrain/db> chmod -R 777 var-lib-mysql
/healthbrain> docker-compose -f docker-compose-dev.yml up -d mysqld 
```

### Q3) How to create a new structure and master data?

```static
var-lib-mysql> zip may-22-2020.zip * -r
```