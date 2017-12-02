@echo off
REM Copyright (c) 2012-2017, EnterpriseDB Corporation.  All rights reserved 
REM PostgreSQL server psql runner script for Windows
REM Northwind Windows PostgreSQL database install

SET server=localhost
SET /P server="Server [%server%]: "

SET database=northwind
SET /P database="Database [%database%]: "

SET port=5432
SET /P port="Port [%port%]: "

SET username=northwind_user
SET /P username="Username [%username%]: "

SET password=thewindisblowing
SET /P password="Password [%password%]: "

SET sql_file=northwind.sql
SET /P sql_file="SQL file [%sql_file%]: "

SET sql_encoding=UTF8
SET /P sql_encoding="SQL file encoding [%sql_encoding%]: "

SET PGCLIENTENCODING=%sql_encoding%

REM Run psql
REM Setting PGUSER and PGPASSWORD in home environment variables can save you from reentering credentials data

"C:\Program Files\PostgreSQL\10\bin\psql.exe" -h %server% -p %port% -c "drop database if exists %database%;"
"C:\Program Files\PostgreSQL\10\bin\psql.exe" -h %server% -p %port% -c "drop user if exists %username%;"
"C:\Program Files\PostgreSQL\10\bin\psql.exe" -h %server% -p %port% -c "create database %database%;"
"C:\Program Files\PostgreSQL\10\bin\psql.exe" -h %server% -p %port% -c "create user %username%;"
"C:\Program Files\PostgreSQL\10\bin\psql.exe" -h %server% -p %port% -c "alter user %username% password '%password%';"
"C:\Program Files\PostgreSQL\10\bin\psql.exe" -h %server% -d %database% -p %port% -f %sql_file% -q
"C:\Program Files\PostgreSQL\10\bin\psql.exe" -h %server% -p %port% -c "grant all on DATABASE %database% to %username%;"
"C:\Program Files\PostgreSQL\10\bin\psql.exe" -h %server% -d %database% -p %port% -c "GRANT ALL on ALL tables IN SCHEMA public to %username%;"

pause

