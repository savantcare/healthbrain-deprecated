#!/bin/bash

for file in ./*.sql
do
    echo "Executing the file $file"
    mysql -u root < $file 
done
