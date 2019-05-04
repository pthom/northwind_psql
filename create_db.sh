#!/bin/bash

dropdb --if-exists northwind
dropuser --if-exists northwind_user

createdb northwind
psql northwind < northwind.sql

psql --no-psqlrc template1 -c "create user northwind_user;"
psql --no-psqlrc template1 -c "alter user northwind_user password 'thewindisblowing';"
psql --no-psqlrc template1 -c "grant all on DATABASE northwind to northwind_user;"
psql --no-psqlrc northwind -c "GRANT ALL on ALL tables IN SCHEMA public to northwind_user"
