---
author: David Landa
category: guide
status: draft
---

# PostgreSQL

## How to run Postgres on Docker

## Problem

As a developer you want to run a PosggreSQL serve on your local machine and be able to connect to database.

## Solution

__Prerequisites__: Docker is installed on the system.

### Download image

Download an apropriate image e.g PosgreSQL version 13 from DockerHub [repository](https://hub.docker.com/_/postgres).

```shell
docker pull <image-name>
docker pull postgres:13
```

### Run the container

Run the container.

Note: You can also directly run the command bellow, because when no image is found locally then docker will try pull it fro offcial registry.

```shell
docker run --name <container-name> -e POSTGRES_PASSWORD=<database-password> -d <image-name>
docker run --name postgres-13 -e POSTGRES_PASSWORD=postgres -d posgres-13
```

Now you should see the running container with name `postgres-13`

```shell
docker ps

CONTAINER ID   IMAGE         COMMAND                  CREATED          STATUS          PORTS      NAMES
0e9005f665c1   postgres:13   "docker-entrypoint.s…"   28 seconds ago   Up 25 seconds   5432/tcp   postgres-13
```

What we see is that PosgerSQL server is running on port 5432. Now we will try several ways how to test and work with database.

TODO: Security check of the hash of downloaded container.

### Test the container

1. Coonect to running container

```shell
docker exec -it <container-name> bash
```
e.g

```shell
docker exec -it postgres-13 bash

root@0e9005f665c1:/#
```

We can see that the container has id `e9005f665c1`. the same id we have seen here
```
    |
    v
CONTAINER ID   IMAGE         COMMAND                  CREATED          STATUS          PORTS      NAMES
0e9005f665c1   postgres:13   "docker-entrypoint.s…"   28 seconds ago   Up 25 seconds   5432/tcp   postgres-13
```

We are now inside the container and we can use the Linux commands.

```shell
root@0e9005f665c1:/# ls
bin  boot  dev  docker-entrypoint-initdb.d  etc  home  lib  lib64  media  mnt  opt  proc  root  run  sbin  srv  sys  tmp  usr  var
```

Switch the user to `postgres` (there is no password)


```shell
root@0e9005f665c1:/# su postgres
```

Run the `psql` command.


```shell
postgres@0e9005f665c1:/$ psql
psql (13.3 (Debian 13.3-1.pgdg100+1))
Type "help" for help.

postgres=#
```

Exit the psql console.

```shell
postgres=# exit
postgres@0e9005f665c1:/$
```

Exit the user and container.

```shell
postgres@0e9005f665c1:/$ exit
exit
root@0e9005f665c1:/# exit
exit
```

## Local development

Assuming you already have a production database. Now you want to have create a local database with the same data as in the production database.

- Copy the production database and create a dump file for populating in the new database image
- Create an empty local database
- Import the production dump file to the local database
- Cleanup the data in the local database e.g. remove the user accounts and add test users for running automation tests
- Create a dump file from the local database

...to be continued

## Resources

- https://hub.docker.com/_/postgres
- https://www.liquidweb.com/kb/what-is-the-default-password-for-postgresql/
- https://sherryhsu.medium.com/set-up-postgresql-database-using-with-production-data-using-docker-f164694341f1
- https://linuxize.com/post/how-to-list-users-in-linux/

- https://remarkablemark.org/blog/2021/03/14/setup-postgresql-in-github-actions/
- https://www.freecodecamp.org/news/docker-development-workflow-a-guide-with-flask-and-postgres-db1a1843044a/

- https://dev.to/isabelatravaglia/using-github-actions-to-build-test-workflows-on-a-rails-on-docker-app-postgres-and-selenium-leveraging-docker-layer-caching-2hb8