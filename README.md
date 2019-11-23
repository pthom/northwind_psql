# Northwind database for Postgres

A simple sql script that will populate a database with the famous northwind example,
adapted for postgres.

<img src=ER.png />

## Getting started:

#### Pre-requirement: install docker and docker-compose
 
 https://www.docker.com/get-started
 
 https://docs.docker.com/compose/install/


####1. run docker-compose

```bash
docker-compose up
```

####2. run psql client in the docker-compose container

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

####3. stop docker-compose
```bash
docker-compose down
```

