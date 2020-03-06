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

**NOTE:** On Windows you need to do this first:
```
docker volume create --name northwind-pg-data -d local
```
If you're using Windows, you also need to make sure the volume being referenced is the one you just created.  The `docker-compose-windows.yml` file does this AND also exposes port 5432 so that external processes can access the database as well.


Then just do this:

```bash 
> docker-compose up
```

**NOTE:** Simply doing `docker-compose up` will enable you to interact as shown below (with another Docker process), but if you want to interact from a non-Docker process on the host (like VS Code, or some application that you would like to write outside of Docker), you should expose port 5432
or another one of your choosing as shown in `docker-compose-windows.yml`.  

To use the `docker-windows.yml` version which *exposes port 5432 and uses the volume created above*, just do this:

```
docker-compose -f .\docker-compose-windows.yml up
```

After running either of the above `docker-compose` commands, you should see some output in the terminal:

```
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

#### 2. Connect to the database and interact!

##### Option 1: Run psql client in the docker-compose container

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

##### Option 2: Connect via application or other means
* Server: localhost
* Port: 5432
* Database: northwind
* User: northwind_user


#### 3. stop docker-compose

Stop the server that was launched by `docker compuse up` via `Ctrl-C`, then remove the containers via:

```bash
docker-compose down
```

Your modifications will be persisted in the `dabata/` local folder, and can be retrieved
once you restart `docker compose up`.
