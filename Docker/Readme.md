# northwind_psql/Docker

Simple scripts in order to help running the northwind database in a docker container.

The usage of these scripts is optional: they are provided in order to be able to test this database
without having to install postgres on your machine. They work under osx or linux.

## Pre-requirement : install docker
 
 https://www.docker.com/get-started


## Step 1 : run a docker container with the server

Simply run `./1_docker_server.sh`. This will build a docker image named 'northwind_image' and start a *detached* docker container named 'northwind_container' which will be the server.

````bash
> cd Docker
> ./1_docker_run_server.sh
````


## Step 2: run a docker container with a psql client that will connect to the server

Simply run `./2_docker_psql_client.sh`. This will run a postgres docker container that will connect to the server, and run psql against it.


````bash
> ./2_docker_psql_client.sh
psql (10.5 (Debian 10.5-1.pgdg90+1))
Type "help" for help.

postgres=# select * from us_states;
 state_id |      state_name      | state_abbr | state_region
----------+----------------------+------------+--------------
        1 | Alabama              | AL         | south
        2 | Alaska               | AK         | north
        ...
````

## Step 3 : clean up

Run `./3_docker_delete_server.sh`. This will **destroy** the server (as well as any data that you might have changed)!


