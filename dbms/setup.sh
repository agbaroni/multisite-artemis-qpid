#!/bin/bash

set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
     CREATE USER broker11 NOSUPERUSER NOCREATEDB NOCREATEROLE PASSWORD 'broker11';
     CREATE DATABASE broker11;
     GRANT ALL PRIVILEGES ON DATABASE broker11 TO broker11;
EOSQL

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
     CREATE USER broker12 NOSUPERUSER NOCREATEDB NOCREATEROLE PASSWORD 'broker12';
     CREATE DATABASE broker12;
     GRANT ALL PRIVILEGES ON DATABASE broker12 TO broker12;
EOSQL

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
     CREATE USER broker21 NOSUPERUSER NOCREATEDB NOCREATEROLE PASSWORD 'broker21';
     CREATE DATABASE broker21;
     GRANT ALL PRIVILEGES ON DATABASE broker21 TO broker21;
EOSQL

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
     CREATE USER broker22 NOSUPERUSER NOCREATEDB NOCREATEROLE PASSWORD 'broker22';
     CREATE DATABASE broker22;
     GRANT ALL PRIVILEGES ON DATABASE broker22 TO broker22;
EOSQL
