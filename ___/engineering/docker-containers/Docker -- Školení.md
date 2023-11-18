# DOCKER školení

Rkt
Kubernetes Google
Open Stack


# SYSTEM

docker info
docker system info

Zobrazí informace o systému 

docker system df

docker pull debian:8

docker save 

docker load


## IMAGES

SHOW IMAGES
`docker`


## CONTAINERS

### SHOW CONTAINERS

`docker ps` Vypiš běžící kontejnery
`docker ps -a` Vypiš všechny kontejnery

### RUN CONTAINERS


### REMOVE CONTAINERS

`docker rmi $(docker ps -aq)` Smaž všechny kontejnery

# VOLUMES

docker volume --help

Příklady

	docker run -ti -v /data debian
	docker run -ti -v my-volume:/data debian

	docker run -ti -v my-volume:/data --name debian1 debian
	docker run -ti -v my-volume:/data --name debian2 debian

	docker run -ti -v $(pwd)/my-volume-data:/data --name debian3 debian

POZOR

docker run -t -v /:data --name danger debian

# PORT FORWARDING

přepínač `-p`
 

# OWN IMAGES

COMMIT
	docker commit <container> <image>
	docker commit my-test-postgres

DOCKERFILE

	
	1-krát FROM <image>
	1-krát MAINTAINER <name & email>
	n-krát RUN <command>
	n-krát COPY <local-path> <container-path>
	n-krát ADD <source> <container-path> -- archivy rozbalí, umí stahovat z webu
	n-krát ENV <variable> <value>
	1-krát USER
	1-krát WORKDIR <path>
	1-krát VOLUME <path>
	1-krát ENTRYPOINT <command>
	n-krát CMD <command>

DOCKERIGNORE 

	...

BUILD

	docker build <path> -t <image>
	docker build <path> -f <dockerfile> -t <image>
	docker tag <source-image> <target-image> 


## NETWORKS


docker network ls

## DOCKER COMPOSE

Práce s více kontejnery najednou -- spouštění, synchronizace atd.


# OTÁZKY

Jak na vývoj?
Je správný postup běžet v interaktivním módu?
Např. Python ... stáhnu image a běžím v interaktivním módu -- doinstaluji závislosti.
Testy spouštím v konzoli -- po uzavření 

docker run --rm -ti --name <NAME>
vs 
docker run -ti --name <NAME>
docker exec <CONTAINER> <COMMAND>