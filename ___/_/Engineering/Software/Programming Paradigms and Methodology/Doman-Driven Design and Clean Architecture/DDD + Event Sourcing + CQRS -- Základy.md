# Základy Event Sourcing + CQRS

## Událost

> Událost je fakt, který se se udál.

Protože událost již nastala, nazýváme slovesem v minulém čase. Údálost nese informaci (*payload*), která nemůže být změněna a proto ji musíme reprezentovat neměnitelným typem se strukturálním porovnáváním. Událost je součásti *ubiquitous language*.

Příklady posjmenování událostí.

    UserCreated
    UserNameChanged
    UserDeleted

### Aktuální stav a historie 

Aktuální stav agregátu je odvozne ze všech *event*, které se událi v minulosti.
(V případě *immutable* modelu je jeho *stav* samotný model.é

### Každý aggregát má svůj vlastní *event stream*
    
Z DDD víme, že agregát je skupina objektů, se kterými nakládáme jako s jednotkou, jako např *Order* nebo *BankAccount*. Každý aggregát má vlastní *event stream* a tedy každý *event* musí nést ID aggregátu.

    EVENT:
        AggregateRootId
        ...

Každý agregát má svůj event stream.
Každá event má id agregátu -- skrze něj se dotazujeme na eventy pro daný agregát.
Pak potřebujeme nějaký timestamp nebo verzi abychom mohli zjistit chcronologii. 


Event sourced domain entity

Jedna z možných strategií jak z doménové entity udělat event sourced domain entity je všechny změny stavu aplikovat pomocí metody, která bere jako argument příslušnou událost.

class EventSourcedEntity:
    
    def __init__(self):
        self.changes = []

    def _apply_changes(self, *events):
        pass

    def _commit_changes(self):
        pass

    @property
    def changes(self):
        return tuple(self._changes)


MESSAGE
Objekt, který nese informaci.
Základní atrributy každé zprávy jsou
    identifikátor např. UUID
    název naapř název třídy
    čas vytvoření
    ?? zdroj zprávy např IP klienta, ID částí systému...

Zprávy dělíme do třech kategorií, podle kontextu informací, které nese.

QUERY
Dotaz po vykonání vrací požadovaná data.

EVENT
Událost obsahuje informace o změnách, které byly provedeny.

COMMAND
Příkaz obsahuje inforamace o změnách, které by měli být provedeny.
    


CommandHandler
--------------
Postihuje pouze jden agregát!

Validace jestli může být příkaz vykonán.
Produkuje 0..N událostí, normální je 1.
Persistuje události do event Store.


CommandProcessor 
používá a seskupuje command handlery.

Zdroje

https://github.com/dstockhammer/todo-backend-aspnetcore
https://github.com/edumentab/cqrs-starter-kit/
http://cqrs.nu/Faq/occasionally-connected-systems
https://www.exceptionnotfound.net/implementing-cqrs-in-net-part-2-handling-commands-and-events/
https://github.com/tyronegroves/SimpleCQRS/
https://tech.zilverline.com/2012/07/04/simple-event-sourcing-introduction-part-1
https://tech.zilverline.com/2012/07/30/simple-event-sourcing-redis-event-store-part-3
https://github.com/spritely/Cqrs/blob/master/Cqrs/IQueryHandler.cs
https://github.com/BrighterCommand/Darker/blob/master/samples/SampleApi/Ports/GetPeopleQueryHandler.cs
https://www.future-processing.pl/blog/cqrs-simple-architecture/
https://github.com/d60/Cirqus/blob/master/d60.Cirqus/Events/IEventStore.cs
https://github.com/sandipray63in/DDD-Based-Enterprise-Application-Framework/blob/master/Domain/Base/ValueObjects/BaseValueObject.cs¨
https://bitbucket.org/sixty-north/d5-kanban-python/src/7fbf4ec14b483312330d747c720c836fad0f626a/kanban/domain/model/board.py?at=master&fileviewer=file-view-default
http://www.axonframework.org/docs/2.0/domain-modeling.html
https://dotnetcodr.com/2015/08/06/domain-driven-design-with-web-api-revisited-part-1-introduction/
https://cqrs.wordpress.com/documents/building-event-storage/
https://medium.com/technology-learning/event-sourcing-and-cqrs-a-look-at-kafka-e0c1b90d17d8

https://cqrs.wordpress.com/documents/building-event-storage/
https://docs.microsoft.com/en-us/azure/architecture/patterns/cqrs
https://docs.microsoft.com/en-us/aspnet/mvc/overview/older-versions/getting-started-with-ef-5-using-mvc-4/implementing-the-repository-and-unit-of-work-patterns-in-an-asp-net-mvc-application

http://www.corecursion.net/post/2017-01-01-Formalizing_Eventsourcing

http://abailly.github.io/posts/event-source.html

http://abailly.github.io/posts/cm-infra-1.html