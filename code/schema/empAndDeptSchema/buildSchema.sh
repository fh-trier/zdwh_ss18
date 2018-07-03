#!/usr/bin/env bash

# Define your credentials as source file or environment variable
source ~/.config/oracle/passwd/galway.sh
# USER="peschm"
# PASSWD="MySecretPassword"
# HOST="localhost"

echo "Execute SQL-Files"
sqlplus "${USER}/${PASSWD}@${HOST}" <<HERE
start tblDept.sql
start tblEmp.sql
start insDept.sql
start insEmp.sql
HERE
