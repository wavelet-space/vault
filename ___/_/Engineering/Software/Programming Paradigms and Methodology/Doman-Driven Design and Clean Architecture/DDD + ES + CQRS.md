# Domain Driven Design (DDD)

- Co to je *Domain Driven Design*?
- Co to je *Ubiquitous Language*?


Jaký datový typ mají sevisní třídy/funkce přebírat jako argumenty a vracet jako 
návratovou hodnotu?


## Bounded Context

. Co to je *Boundend Context*?
- Jak poznáme *Bounded Context*?

## Aggregate

Aggregát je skupina objektů, které spolu tvoří logický celek. V aggregátu se mohou nacházet dva druhy objektů a to *entity*  a *value object*. 

Agregát musí obsahovat alespoň jednu entitu. Tuto entitu nazýváme *aggregate root entity* a jedině ta může být referencovnána přímo dalšími agregáty. Tato referece je obvykle reprezentována jen jením ID nikoliv samotným objektem.

Rozpoznat co patří a co nepatřo do různých agregátů je vcelku náročný úkol. 

### Value

Value je objekt v doméně, který je reprezentován jen svými atributy a nemá žádný žovotní cyklus -- konkrétně dva *value* objekty jsou si rovny když a pouze když se rovnají všechny jejich atributy. Příkladem hdnotového objektu může být např. objekt *Money*, kde náz zajímá pouze hodnota a měna. 

### Entity & Aggregate Root Entity

Entita je objekt v doméně, který má životní cyklus. Jeden nebo více atributů je brán jako jeho identifikátor, např. v případě objektu *Person* to může být jeho rodné číslo.

## Common Design Patterns in  

### Repository Pattern

*Repository Pattern* helps you to work with yoyr persisted domain model. Reposotory can be implemented as a class or simply functions which uou use to read or write domain model. Conceptually you can recognize a `ReadRepository` which you use for reading the model from your store and `WriteRepository` which you use to write the model.  

### Specification Pattern

*Specification Pattern*

---

# Message Oriented Architecture

I want to share my ideas about message oriented architecture especially event soursing and CQRS

## Motivace

Chceme mít přehled o požadavcích na systém.

Toho dosáhneme tak, že každý požadavek na systém je reprezentován zprávou.
Kolik y těchto ypráv bzlo obslouženeo a kolik zamítnuto a z jakého důvodu?
např. 
    msg -> Změň jméno osoby.
    accepted -> ...
    rejected -> reason

Chceme uvést systém do stavu pro daný čase.
Toho dosáhneme tak, že každý vykonaný požadavek je reprezentován zprávou. 

## `Message`

Základním metodou jak mezi sebou jednotlivé části systému komunikují je pomocí zasílání zpráv. Zpráva může reprezentovat akci, kterou požadujeme na systému vykonat (*command)*, nebo akci, která byla na systému vykonána (*event*) či jednoduše dotaz na stav systému (*query*). Více si o druhu zpráv napíšeme dále, v každém případě by zpráva měla nést informaci *komu* je určena, *kdo* ji zaslal, *k čemu je určena*, což většinou reprezentuje už její název a případně data, která jsou nutná pro zpracování zprávy -- např nové údaje, které chceme aplikovat.

Zpráva by měla obsahovat tyto atributy:

- event_info
  - id
  - version
  - created_at

- sender_info
  - id (Kdo zprávu poslal)

- entity_info
  - id
  - type
  - version

- command_id - pro idempotenci, např. několik eventů mohlo být vyprodukováné jediným příkazem a mi se cheme vrátit zpět o vššchny tyto události


To, k čemu je určena lze rozpoznat již z názvu zprávy respektive z jejího typy např. `RegisterPerson`. To co zpráva hlavně musí nést je informace potřebná ke zpracování zprávy v případě registraci osoby např. rodené číslo, jméno atd.

    type Message = { 
        Header
        Payload
    }

### Kategorizace zprávy

Podle účelu, který zpráva plní je lze rozdělit do několika kategorií.

### `Command` & `Query`

Podle toho jestli zpráva chce měnit stav nebo se jen dotázat na stav rozdělujem Message na Command a Query. Zapsáno pomocí sumačního typu:

    type Message = Command | Query

### `Event`

Zvláštním typem zprýve je Event, to je zpráva, která nese informace o změně stavu. Mezi Command/Query a Event existuje vztah:

Každé zpráacování Command/Query zprávy produkuje alespoň jeden Event message 

# Event Sourcing (ES)

# Command Query Responsibility Segregation (CQRS)

Poprvé popsal Greg Young


# USE CASE

Use Case
Co je to *use case*?

Pro vykonání nějakého *use casu* musíme dostat pokyn, takový pokyn je fakticky reprezentován Command objektem. Systém, který pro každé vykonání *use casu* vyžaduje zaslání zprávy -- příkazu je velmi dobře testovatelný respektive simulovatelný.


## Odkazy

- https://docs.microsoft.com/en-us/azure/architecture/patterns/cqrs

Event Sourcing se velmi pěkně pojí s DDD.
Doménový model může být mutabilní, kdy model obsahuje `apply(event)`.
Event Sourcing se dá kombinovat s CQRS, ale není to nutné.
CQRS se naopak bez ES neobejde, respektive potřebujeme aspoň základní event log: https://medium.com/@marco_be/cqrs-without-event-sourcing-but-most-likely-with-an-event-log-94fb5a5b5b84

# Event Sourcing v PostgreSQL

Způsobů, jak uložit `Event` je mnoho, v podtsatě jde o neustále rostoucí seznam.

## Událost

Každá událost je uložena v tabulce.
Předpokládáme, že každá entita, která představuje aggregate root
má unikátní identifikátor (GUID/UUID).

Všechny udáálosti mají typ nebo alespoň jméno.
V případě když je událost objektem, bereme třídu, ale můžeme 
vzít i jméno funkce, pokud ji implementujeme jako funkci.

Data události ukládáme jako typ JSONB.

## Projekce

Projekce je aplikace události na entitu za učelem změny stavu.
Konkrétně, pokud máme uživatele, kterému chceme změnit jméno,
pošleme command objekt s požadavkém na změnu jména, pakliže 
je příkaz přijat a zpracován, pak příslušný command handler 
vygeneruje event objekt, který se uloží do tabulky s událostmi.
Uložení události spustí funkci `project_user_update`, která 
upraví data v tabulce `user`.

Máme dva druhý projekcí `create` a `update`;

## Funkce vytvářející TRIGER

    create trigger 
        after_event_insert_triger 
    after insert on events

## Aplikace triggeru


## CommandHandler

*CommandHandler* je *UseCaseHandler*


## Poznámky

Query nemá žádný side-effect?


## Odkazy

### Domain Driven Design

- https://www.embedded.com/design/other/4219527/Using-Monte-Carlo-methods-to-design-domain-driven-device-clouds
- https://github.com/eventuate-clients/eventuate-client-java/tree/master/eventuate-client-java/src/main/java/io/eventuate

### Event Sourcing + CQRS

- [Simple event sourcing - conflict resolution (part 4)](https://tech.zilverline.com/2012/08/08/simple-event-sourcing-conflict-resolution-part-4) |  Erik Rozendaal | 2012
- [Simple event sourcing - consistency (part 2)](https://tech.zilverline.com/2012/07/23/simple-event-sourcing-consistency-part-2) | Erik Rozendaal | 2012
- [Simple event sourcing - introduction (part 1)](https://tech.zilverline.com/2012/07/04/simple-event-sourcing-introduction-part-1) | Erik Rozendaal | 2012
- [Simple event sourcing - Redis event store (part 3)](https://tech.zilverline.com/2012/07/30/simple-event-sourcing-redis-event-store-part-3) | Erik Rozendaal | 2012
- [Simple event sourcing - refactoring and transactions (part 5)](https://tech.zilverline.com/2012/08/26/simple-event-sourcing-refactoring-and-transactions-part-5) | Erik Rozendaal | 2012
- [Simple event sourcing - users, authentication, authorization (part 6)](https://tech.zilverline.com/2013/01/09/simple-event-sourcing-users-authentication-authorization-part-6) | Erik Rozendaal | 2012
- http://blog.jonathanoliver.com/cqrs-event-sourcing-and-immutable-data/
- http://blog.jonathanoliver.com/crime-scene-event-sourcing/
- http://danielwhittaker.me/2014/10/18/6-code-smells-cqrs-events-avoid/
- http://docs.simplebus.io/en/latest/Guides/command_bus.html
- http://kkanojia.me/blog/event-sourcing-part-1
- https://blog.arkency.com/2016/12/event-sourced-domain-objects-in-less-than-150-loc/
- https://gist.github.com/jaceklaskowski/d267bf4176822293e95e
- https://github.com/cer/event-sourcing-examples/wiki/
- https://github.com/mfelicio/NDomain/blob/master/source/NDomain/Aggregate.cs
- https://github.com/SimpleBus/MessageBus/tree/master/src/Bus/Middleware
- https://leanpub.com/esversioning/read
- https://mfelicio.com/2015/09/06/my-journey-on-ddd-cqrs-and-event-sourcing/
- https://github.com/cer/event-sourcing-using-scala-typeclasses/blob/master/eventstore-client-scala-typeclass/src/main/scala/net/chrisrichardson/eventstore/client/scalatypeclass/EventStoreToEntityStoreAdapter.scala
- https://medium.com/grabek-io/7-lessons-learned-about-event-sourcing-in-last-two-years-e64c0fde4d20

- https://www.hugopicado.com/2017/05/06/what-event-sourcing-is-not.html
- http://danielwhittaker.me/2014/10/18/6-code-smells-cqrs-events-avoid/

- https://eventstore.org/docs/event-sourcing-basics/
- https://ookami86.github.io/event-sourcing-in-practice/#slide-10

- https://medium.com/capital-one-developers/event-sourcing-with-aggregates-in-rust-4022af41cf67