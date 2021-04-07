# Northwind database for Postgres

A simple sql script that will populate a database with the famous northwind example, adapted for postgres.

<img src=ER.png />

## Getting started:

### Manually

Use the provided sql file `nortwhind.sql` in order to populate your database.

### With Docker and docker compose

#### Pre-requirement: install docker and docker-compose

 https://www.docker.com/get-started

 https://docs.docker.com/compose/install/


#### 1. Run docker-compose

````bash
> docker-compose up
...
... Lots of messages...
...
Creating network "northwind_psql_db" with driver "bridge"
Creating volume "northwind_psql_db" with default driver
Creating volume "northwind_psql_pgadmin" with default driver
Creating pgadmin ... done
Creating db      ... done
````

#### 2. Run psql client in the docker-compose container

Open another terminal window, and type:

````bash
> docker-compose exec db psql -U postgres -d northwind

psql (13.2 (Debian 13.2-1.pgdg100+1))
Type "help" for help.

northwind=# select * from us_states;
 state_id |      state_name      | state_abbr | state_region
----------+----------------------+------------+--------------
        1 | Alabama              | AL         | south
        2 | Alaska               | AK         | north
        ...
````

#### 3. Connect PgAdmin

Access to PgAdmin at the url: http://localhost:5050

Add a new server in PgAdmin:
- General Tab:
  - Name = db
- Connection Tab:
  - Host name: db
  - Username: postgres
  - Password: postgres

Then, select database "northwind".

#### 4. Stop docker-compose

Stop the server that was launched by `docker compose up` via `Ctrl-C`, then remove the containers via:

```bash
docker-compose down
```

#### 5. files & persistence

Your modifications to the postgres database(s)will be persisted in the `dbdata` local folder, and can be retrieved once you restart `docker compose up`.

If you need to upload any files into your db container, just copy and paste them to the `files` local folder. They will be available at the `/files` path inside the db container.
