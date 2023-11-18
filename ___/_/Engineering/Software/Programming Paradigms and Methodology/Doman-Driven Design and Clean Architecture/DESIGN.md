# HOW TO DESIGN PROGRAMS


## Domain Driven Design

Jakýkoliv aplikaci (program) si můžeme v nejjednoušším případe představit jako

    Main() {
        try:
            env = Environment(...)
            app = Application(env)
            app.execute()
            return 0  // Status (Success)
        catch Exception as e:
            return 1  // Status (Failure)
    }

Zkráceně funckionálně

    Main () {
        status = App(Env) -> Status
        case status:
            Success: return 0
            Failure: return 1
    }

tzn. že objekt či funkce aplikace App přebírá objekt prostředí Env, provede úkony a vrací
status, buď Sucesss nebo Failure. Funkce Main nakonec vrací podle konvence, v případě konzolového programu,
status 0 pro úspěšný běh nebo nenulovou hodnotu pro něúspěšný běh. Samozřejmě že z hlediska uživatele, by bylo dobré
někam vypsat i důvod selhání, např. do konzole, ale ideálně do logu... kam ostatně zapíšeme i údajě o úspěšném běhu.

Pojďmě si tedy připravit jednoduché objěkty reprezentující App a Env a zdůvodněme si proč je výhodné aby to byli objekty.


## Env

Struktura `Environment` je singleton, obsahuje údaje nutné pro nastavení aplikace. V nějjednodušším případě ji předá data, která zadal uživatel.

## App

Struktura `Application` je singleton, obsahuje metodu, která splní zadání, které si vyžádal uživatel.¨
Applikace je určitě singleton, protože v rámci běhu programu potřebujeme jen a pouze jednu isntanci tohoto objektu.
Aplikaci si lze také představit jako svého druhu stavový automat, který může být v několika stavech. Např. při startu může
trvat, než se aplikace inicializuje a je tedy ve stavu `starting`, její běh také může nějakou dobu trvat a je tedy ve stavu `executing`

    AppState =
        Starting
        Prepared
        Executing
        Finished

Co by měla aplikace umět a vědět.
Měla by umět logovat a zasílat informace o svém běhu, měla by tedy být schopná komunikovat s okolím po dobu jějího běhu.
To platí jak pro webovou, konzolovou tak aplikaci s GUI.

Při staru by měla navázat spojení se všemi externími službami (pokud je to možné) abychom předešli problémům někde v půlce běhu programu.
Tak např. pokud komunikuje s DB, pak lze snadno udělat testovací spojení případně SQL dotaz (selct 1 from ...). nebo pokud komunikujem s REST API
pak lze udělat testovací REST API dotaz, opět ideálně pokud služba obsahuje nějakou `healtcheck` routu.

## Kde použít `async`?

DOménový model zcela určite nepotřebuje jakýkoliv druh asynchronicity.

Services již mohou být asynchroní, např, dotaz do databáze nebo volání REST API.
Problém je že pokud použijeme acync, pak každý funkce která používá async funkci, také musí být async, jinak se z ní stavá blokující.

## DB

Struktura `Database` je zodpovědná za ....

## Akceptační Testování

Aplikaci můžeme testovat akceptačně, tzn. že pokud nám někdo dodal apliaci, řekněmě s CLI rozhraním, pak můžeme jejím spuštěním v konzoli
zjistit, jetli dělá co má. Z pohledu zadavatele nevíme nic o tom, jak vypadá apliakce uvnitř a pro nás je to tedy jedinná ožnost jak rozhodnou
jestli aplikaci přijmeme. Takovéto akceptační testování se dá dělat ručně, kdy aplikaci voláme s nejrůznějšími paramatery a sledujeme, jestli výsledek odpovídá
našim představám. Ideálně lze takové testovaní zautomatizovat tzn. že napíšeme skripty/program, který bude aplikaci spouštět a testovat, jestli výsledek odpovídá
námi zadaným hodnotám. Pokud jde o program, který je tkzv. Fire-and-Forget a jen vrací výsledek do konzole, je to poměrně triviální a můžeme si pomoci např. Python skriptem nebo dokonce shell skriptem [TODO ukázka Python].

Situace se může poněkud komplikovat, pokud aplikace např. zapisuje na disk nebo do databáze. V tomto případě je lepší již testovat s pomocí nějkaého kontejneru (DOcker)
a nastavit tak izolované testovací prostředí.


# REST API aplikace


Aplikace, která komunikuje s okolím pomocí HTTP, kdy vystavuje tazv endpointy, nazveme REST API aplikací. Tu si můžeme v podstatě představit jako strom např.

    /
    |__/status
    |__/persons
    |  |__/likes
    |__/signin
    |__/signup


Router v tomto případě přijme HTTP request a roshodne ke které větvi stromu dotaz přínálěží. Před z po zpracování můžeme spustit funkce -- tzv middleware, např. něco logovat, zjistit jestli má uživatel přístup na routu atd.
