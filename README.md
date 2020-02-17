# Northwind database for Postgres

A simple sql script that will populate a database with the famous northwind example,
adapted for postgres.

<img src=ER.png />

## Getting started:

### Manually

Use the provided sql file `nortwhind.sql` in order to populate your database.

### With Docker and docker compose

#### Pre-requirement: install docker and docker-compose

 https://www.docker.com/get-started

 https://docs.docker.com/compose/install/


#### 1. run docker-compose

```bash
> docker-compose up

...
... Lots of messages...
...
Creating network "northwind_psql_default" with the default driver
Creating northwind_psql_db_1 ... done
db_1  | 2019-11-28 21:07:14.357 UTC [1] LOG:  listening on IPv4 address "0.0.0.0", port 5432
db_1  | 2019-11-28 21:07:14.357 UTC [1] LOG:  listening on IPv6 address "::", port 5432
db_1  | 2019-11-28 21:07:14.364 UTC [1] LOG:  listening on Unix socket "/var/run/postgresql/.s.PGSQL.5432"
db_1  | 2019-11-28 21:07:14.474 UTC [1] LOG:  database system is ready to accept connections
```

#### 2. run psql client in the docker-compose container

Open another terminal window, and type:

````bash
> docker-compose exec db psql -U northwind_user -d northwind

psql (10.5 (Debian 10.5-1.pgdg90+1))
Type "help" for help.

postgres=# select * from us_states;
 state_id |      state_name      | state_abbr | state_region
----------+----------------------+------------+--------------
        1 | Alabama              | AL         | south
        2 | Alaska               | AK         | north
        ...
````

#### 3. stop docker-compose

Stop the server that was launched by `docker compose up` via `Ctrl-C`, then remove the containers via:

```bash
docker-compose down
```

Your modifications will be persisted in the `dabata/` local folder, and can be retrieved
once you restart `docker compose up`.
