# Git tahák

ODKAZY

    https://www.kernel.org/pub/software/scm/git/docs/giteveryday.html

## Základní nastavení

### Nastavení jména e-mailové adresy

    git config --global user.name "David Landa"
    git config --global user.email "david.landa@email.cz"

Pokud jsem na Windows, předefinujeme výchozí symboly konce řádků.

    git config --global core.autocrlf true
    git config --global core.safecrlf true

Inicializace repositáře
    
    git init

Přidáme všechen obsah do sledovaných

    git add .

Provedeme první commit

    git commit -m "First commit"

Předchozí dva kroky jsou udělat najednou jako

    git -am "First commit"

Pokud se chceme v každém z kroku ujisti v jakém stavu jsem stačí napsat

    git status

---

### Prohlížení historie změn
    
    git log 
    git log --pretty=oneline
    git log --pretty=oneline --max-count=2
    git log --pretty=oneline --since='5 minut ago'
    git log --pretty=oneline --until='5 minut ago'
    git log --pretty=oneline --author=<name>
    git log --pretty=oneline --all

### Getting fancy 
    
    viz https://githowto.com/history

### Aliasy
Aliasy nemusíme mít v bash konfiguračním souboru, ale lze přímo udělat aliasy pro git
konfigurační 

    git commit vs git commit -m 

Zruší merge a navráti větev do původního stavu.

    git merge --abort

Poznámka: Neměli bychom dělat merge s uncommited changes

Vytvoř remote v lokálním repozitáři

git remote add <name> <url>
git remote add origin https://...  webový přístup přes jméno a heslo
git remote add origin git://...      SSH přístup

Nastav pro remote novou adresu

git remote set-url <remote_name> <new_url>

git 

git fetch 
git merge
git rebase

git pull := git fetch + git merge
git pull --rebase := git pull + git rebase

== Začátečník

push & pull

Příkaz push slouží k nahrání změn na server.
Příkaz pull slouží ke stažení změn ze serveru.

merge

rebase


**Potřebuji přepsap poslední commit**

    git commit --ammend -m "message"

**Nahradí historii obsahem lokální větve**

    git push --force -u origin master

**Nahraj lokální větev na server**
    
    git push <remote_name> <branch_name>

**Neukazuj vzdálenou větev**

    git push <remote_name> :<branch_name>

**Smaž lokální větev**

    git branch --delete <branch_name>

**Smaž vzdálenou větev**

    git push <remote_name> --delete <branch_name>
    
 ???K čemu je 
 git add -p 
 ???    
    
== Mírně potročilý
 
== Pokročilý

Piš zprávu a popisek rozkazovacím způsobem (imperativ)
FIX
ADD
CHANGE
REMOVE

Neukončuj summary line tečkou (jde o nadpis)
Začínej summary line velkým písmenem

///
Doporučení pro práci s verzovacím nástrojem Git

Git Flow

V centrálním repozitáři máme dvě větve `master` a `develop`, které vznikají 
současně při založení projektu.

Větev `origin/master` obsahuje vždy stabilní verzi softwaru. Každý `commit` do
 této větve mění číslo verze programu, která je poznamenáná jako `tag`. Do 
 větve `master` se přidává jen stabilní verze větve `develop` a vždy se označí
  tagem verze -- majoritním číslem.


Větev `develop`, která je založena na větvi `master` slouží po většinu času k 
přispívání nové funkcionality. Tato větev, ketrá nemusí být vždy stabilní, 
obsahuje změny, které budou začleněny v příští verzi softwaru. 
Pro přidávání nové funkcionality či opravy používáme další větve odvoznené od 
větví master nebo develop. Parvidla pro tyto větve jsou následující.

Feature

Každá nová funkcionalita je vytvářena v samostané větvy s názvem `feature-x`, 
kde x je ideálně číslo funkcionality, tak, jak je přidávána do issue trackeru.

Každá `feature` větev je odvozena z větve develop a po ukončení vývoje a 
otestování se do ní opět vrací.

    git checkout -b feature/name-of-feature develop
    git checkout develop
    git merge --no-ff myfeature
    git branch -d myfeature
    git push origin develop

Hotfix

Každá chyba, která se objeví v produkční verzi softwaru, tedy na větvy 
`master`, musí být opravena a to tak, že je vytvořena větev `hotfix-x` založená
 na větvy `master`. Tato větev se pak opět vrací do hlavní větve a mění 
 minoritní verzi softwaru.

Realase
Pojmenování release/v2.0


Příklad
V centrálním repozitáři vytvoříme větev master a develop.

Všichni si stáhnou obsah repozitáře a vytvoří si vlastní lokální větev


Oprava produkčního kódu


# GIT WORKFLOW

DIFF EVERYTHING
Předtím než jdou soubory do atging area nebo jsou commitovány použij diff

    git diff --staged

COMMIT má být častý a obsahovat samostatný logický krok, který představeuje COMMIT MESSAGE, např. implementace jedné metody a jednotkového testu.
Každý commit může být zdrojem chyby, a proto musíme být chopni vrácením se o jeden krok zpět zrušit právě jen jednu logickou změnu v projektu.
Každá zpráva má popisovat proč k ní dochází nebo co postihuje. Nepopisujte, které části kódu se změnily, to je při *code review* vidět.

Zřemě něco děláme špatně pokud:
    Máme problém popsat změnu, napamatujeme si, co všechno jsme změnily.
    Popis změny je příliš obecný, příliš krýtký nebo naopak dlouhý.

Pokud chceme opravot poslední commit message použijte:

    git commit --ammend -m "new message"

## Používejte ISSUE/(FEATURE|BUGFIX|HOTFIX) BRANCHING

Každá *feature branch* se začleňuje pomocí *pull request*.
Nikdy nezačleňujeme *feature branch* na které jsme sami pracovali.
Není začleněna dříve, než ji kolega, který je určený pro *code review* zkontroluje.
Pokud pracujeme ve dvojici, pak provádíme *code review vzájemně*. 

Pokud pracujeme na *feature branch* pak alespoň jednou denně provedeme začlennění z upstreamu.
    
    git pull origin master

### Kdy nepotřebujeme ISSUE BRANCH?

Pokud opravujeme jen typografické a stylistické chyby v kódu nebo dokumentaci.

Máme pouze jednu hlavní větev s názvem `master` avšak pro každou novou funcionalitu vytoříme větev s názvem `feature-{number}`, kde `{number}` je číslo *issue*. Každá nová funcionalituluta je tedy nejdříve vytvořena a popsána jako *issue* v systému jako např. JIRA

Každá funkcionalita je vytvářena pomocí ISSUE
Pokud potřebuji implementovat nějakou FEATURE, založím ISSUE, které automaticky dostane číslo. Pak vytvořím feature branch (? lokálně nebo na servru?) a commituju do ní. Pokud dělám merge do hlavní větve, pak merge commit MUSÍ mít v názvu číslo issue, aby se automaticky zavřel.

Jaký precommit-hook na to máme?

## Použvejte GIT HOOKS

Pozor hook lze přeskočit např. pomocí `git commit --no-verify`.

### PRE-COMMIT

    Spustíme všechny testy a pokud některý neprojde, pak nepovolíme `commit`.


## Sdílení GIT HOOKS

Skripty v adresáři projektu pojmenovaném např. `.githooks`.
Git 2.9 umožňuje zadat cestu ke skriptům pomocí `hookPath` do konfigurace.
Linux/MacOS Vytvoříme symbolický odkaz na naše hook soubory.

---WINDOWS Můžeme vytvořit shell skript, který volá soubor .py explicitně
nebo můžeme py skript umístit do jiného adresáře např.

    #!bin/sh
    python .git/hooks/pre-commit.py
nebo
    python githooks/precommit.py


## Github

Jak smazat repozitář pomocí API

`curl -X DELETE -H 'Authorization: token dc98e37b3febbd8b396eaa3298edff3e7962eae1 `[`https://api.github.com/repos/uetoyo/pynanomsg`](https://api.github.com/repos/uetoyo/pynanomsg)
