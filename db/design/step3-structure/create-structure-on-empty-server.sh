#!/bin/bash

# To make the above recurse into subdirectories (in bash), you can use the globstar option; also set dotglob to match files whose name begins with . Ref: https://unix.stackexchange.com/questions/139363/recursively-iterate-through-files-in-a-directory
shopt -s globstar dotglob

for file in **/*.sql
do
    echo "Executing the file $file"
    mysql -u stanford2008 --password=jaidurgama < $file 
done