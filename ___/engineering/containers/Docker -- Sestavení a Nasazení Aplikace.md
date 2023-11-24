# Rychly přehled nástroje Docker

Pročti si oficiální dokumentaci: https://docs.docker.com/

- image (obraz)
  - Co je to obraz
  - Jak sestavit obraz
  - Jak smazat obraz
  - Jak publikovat obraz do repozitáře.
- container (kontejner)
  - Co je to kontejner
  - Jak vytvořit, spustit, zastavit a smazat kontejer.
- volume vs bind and mount
- network
- Jak pracovat s více kontejnery

# Nasazení aplikace v Docker kontejneru

## Sestavení Docker obrazu ze zdrojového kódu balíku.

docker build . -t <company>/<image-name>:<tag> --file ./path/to/Dockerfile

Jako <tag> používáme aktiální verzi balíku např.

```powershell
docker build . -t rozhlas/transcripts-service:0.1.0 --file .\Dockerfile
```

Můžeme vytvořit i více tagů pro jeden Docker obraz.

```powershell
docker build -t image1_name:tag1 -t image1_name:tag2 -t name2 .
```

```powershell
docker build . -t cro-transcripts-service:0.1.0 --file .\Dockerfile
docker build . -t cro-transcripts-service:latest --file .\Dockerfile
```

## Přidání Docker obrazu do DockerHub repozitáře.

docker push <dockerhub-user>/<repository-name>:<tag>

## Docker Tips

Očista!

    docker system prune
    docker system prune --volumes

Smaž všechny kontejnery

    docker ps -a -q | % { docker rm $_ }

Smaž všechny obrazy

docker images -q | % { docker rmi $\_ }

Remove all the version of the image if the image name contains given text:

    docker images --format='{{json .}}'
    | Select-String -Pattern "${imageName}"
    | ConvertFrom-Json
    | ForEach-Object -process { docker rmi -f $_.ID}

# Termnal tips

CTRL + SHEFT + <- pohyb rozdelová čáry doleva/prava/nahoru/dolu

WARNING: Image for service postgres was built because it did not already exist. To rebuild this image you must use `docker-compose build` or `docker-compose up --build`.

```shell
docker compose convert
```
