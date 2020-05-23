#!/bin/bash

for file in **/*.sql
do
    echo "Executing the file $file"
    mysql -u stanford2008 --password=jaidurgama < $file 
done
