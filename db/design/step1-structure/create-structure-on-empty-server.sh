#!/bin/bash

for file in ./*.sql
do
    echo "Executing the file $file"
    mysql -u root --password=WUy3OsU5BYMM < $file 
done
