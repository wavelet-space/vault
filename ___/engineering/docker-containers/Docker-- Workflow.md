## Docker workflow

Předpoklady, každý vývojář pracuje s operačním systémem, který mu vyhovuje.
Nelze předpokládat, že by vývojář mohl mít na svém stroji požadované verze
nástrojl a knihoven ve verzích pro různé projekty.

Řešením je používat `Docker`, ať už pracuji sám nebo v týmu.

+ Pro vývoj potřebujeme pouze Docker, vše ostatní si isntalujeme jen 
do vlastního Docker kontejneru. Potřebujeme Python verze 3.5; naistalujemem si 
ho do kontejneru.

+ Vývojové prostředí a verze knihoven je stejné pro všechny členy týmu a 
dokonce shodné s prostředím ve kterém aplikace poběží.

Birbucket: Team
Github: Organization

Každý projekt má svůj svůj tým/organizaci.
Každá aplikace (knihovna) má svůj repozitář.
Vytvoříme jeden speciální repozitář `development`.

V tomto repozitáři je soubor `README.md`, `docker.yml`
    
    .git
    .gitmodules
    docker.yml
    README.md


### Webové aplikace

### Desktopové aplikace
