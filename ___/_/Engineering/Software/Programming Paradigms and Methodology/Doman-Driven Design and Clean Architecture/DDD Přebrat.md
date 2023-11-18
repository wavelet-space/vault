#DOMAIN DRIVEN DESIGN ++ CQRS ++ ES


REPORT ke zpráva aktuálním stavu systému,

Co je to *bounded context*?
Co je to *aggregate* a *aggregate root*?
Co je to *entity* a *value object*?
Může enita odkazovat na další entity?
Pokud může entita odkazovat na další entity,  jsou zde nějaká pravidla, které musí být dodrženy?
Může value object obsahovat další value objecty případně entity?
Can a command result in multiple events? (Yes)
Co je to  *Factory* a jak ji implementujeme?


An aggregate defines a consistency boundary; every transaction is scoped to a single aggregate. Attempting to modify more than one aggregate at a time, such as in a command handler, goes against this advice.
A process manager (saga) is an ideal fit for this use case. It is an independent component that reacts to domain events in a cross-aggregate, eventually consistent manner. In its simplest form a process manager reacts to domain events and dispatches commands in response. It may also track state, related to the process, to help correlate events between aggregates.


Services

Pokud nemůžeme chování přiřadit žádné třídě (entitě, hodnotovému objektu), pak půjde s největší pravděpodobností o kód,
který by měl být jako service ... reprezentovaný bezstatvovo třídou ... nebo jednoduše funkcí v servisní vrstvě domény
 jde o domain service.

## Životní cyklus entit

Factories

Továrny se starají vytváření agregátů. Můžeme aplikovat GoF *Factory* nebo *Builder pattern*.

Repositories

Application Layer

má na strarost vytváření, získávání a volání metod (ve skupinách) -- je to fasáda pro GUI.


Odkazy
http://www.informit.com/articles/article.aspx?p=598888&seqNum=4

Application Sevices vs Domain Services

Pravidlo: Entita se může odkazovat jen na jinou entity ve stejném agregátu, nebo na entitu z jiného agregátu, pokud je kořenem.
if an entity has a reference to another entity, then the referenced entity must either be within the same aggregate, or be the root of some other aggregate.


http://programmer.97things.oreilly.com/wiki/index.php/Code_in_the_Language_of_the_Domain

file:///C:/Users/dlanda/Downloads/Deliver%20Domain%20Driven%20Designs%20Dynamically%20-%20Slides.pdf

Python Value Object
    https://github.com/quiqueporta/simple-value-object

 Python DDD


http://gorodinski.com/blog/2012/04/14/services-in-domain-driven-design-ddd/
When a significant process or transformation in the domain is not a natural responsibility of an ENTITY or VALUE OBJECT, add an operation to the model as standalone interface declared as a SERVICE. Define the interface in terms of the language of the model and make sure the operation name is part of the UBIQUITOUS LANGUAGE. Make the SERVICE stateless.

Eric Evans Domain-Driven Design

Domain Services / Domain Layer Services
To znamená, že *service* v kontextu DDD musí být součástí slovníku, který vyplyne z požadavků na produkt.
Také je zajímavé, že SERVICE je bezstavový, půjde tedy o čisté funkce .), nebo statické metody.

http://www.infoq.com/news/2015/07/ddd-mistakes
http://www.infoq.com/presentations/ddd-net-1?utm_campaign=rightbar_v2&utm_source=infoq&utm_medium=presentations_link&utm_content=link_text


Anti-Corruption Layer
Izoluj části, ketré se mění od těch které se mění.
Změny mohou přicházet jako zlepšení...

Application

    Application Services

Domain Model
    Entity
    Value Object

    Domain Model Services

    Domain Model Event

Infrastructure



Value Object
- Value Object může být součástí entity.
- Value Object je neměnitelný.
- Value objekt nemá žádnou identitu ...
- Dva Value objekty jsou stejné, pokud se shodují ve všech atributech.
- Value objekt může obsahovat jiné Value objekty i reference na Entity.

Vznikají ze specifikace, jsou součástí use cas, business rules.
Identifikujem samostatná podstatná jména a jménné fráze.

Běžné druhy / kategorie objektů / Conceptual classes
    Transakce
        platba, rezervace
    Fyzické objekty

    Místa

    Záznam
        recept

    Specifikace a Popis
        FlightDescription, ProductSpecification

    Catalog popisů
        ProductCatalog


Business Rules


Busines pravidlo my mělo být oddělena.
Busines pravidla mhou být součástí více UseCase
Busines pravidlo je o logice a zdůvodnění.
UseCase je o akci, kterou provádí aktor (uživatel nebo systém)


Limitations
    Zavazadlo nesmí překročit rozměr 50x80x20cm
Validations
    Zavazadlo nemá

Permisions


Každý případ užití *use case* obsahuje aktéra/y, akce které jsou s aktérem spojené.


Každý případ užití se odkazuje pomocí #ID na jednotlivá business parvidla.


Article
    Title
    Entries
    Authors
    Comments
    Category
    Tags

ArticleEntry

Author
    FirstName
    LastName
    LoginName
    Password
    Email
    Role

ArticleCategory

AuthorRole

[quote author=takynechápe link=topic=12988.msg161578#msg161578 date=1458834818]
 Jaké další metody ten argument má?
[/quote]

Pokud je tvoje otázka, jaké má argument metody ... tak třeba takto:
[code] print([method for method in dir(myobj) if callable(getattr(myobj, method))])[/code]
Ty ale chceš asi říci něco o horších možnostech refaktoringu? I když z těch různých emotivních vsuvek se to špatně chápe, co vlastně chceš demonstrovat.


---

Literatura:

Implementing Domain-Driven Design; Vaughn Vernon; Addison-Vesley.
Domain-Driven Design Distilled; Vaughn Vernon; Addison-Vesley.
Domain-Driven Design with Naked Objects; Dan Haywood; Pragmatic Bookshelf 2009.


Lidé:

Eric Evans
Udi Dahan
Vaughn Vernon


Kód:
https://github.com/VaughnVernon/IDDD_Samples


Odkazy:
http://domainlanguage.com/
http://domainlanguage.com/wp-content/uploads/2016/05/DDD_Reference_2015-03.pdf
https://github.com/VaughnVernon
https://github.com/BottegaIT
https://vaughnvernon.co/?p=838
https://github.com/dcomartin/DDD-CQRS-ES-Example
http://gorodinski.com/blog/2012/04/14/services-in-domain-driven-design-ddd/
http://culttt.com/2014/09/29/creating-domain-services/
http://culttt.com/2014/12/24/factories-domain-driven-design/
http://cqrs.nu/tutorial

https://blogs.msdn.microsoft.com/kcwalina/2004/10/11/design-guidelines-update-factories-vs-constructors/
https://github.com/SzymonPobiega/DDDSample.Net/blob/master/DDDSample-AutoPersistence/Domain/IAggregateMember.cs



https://github.com/eligosource/eventsourced
https://www.jayway.com/2013/03/08/aggregates-event-sourcing-distilled/

https://github.com/erikrozendaal
https://ookami86.github.io/event-sourcing-in-practice/#making-eventsourcing-work/03-command-sourcing-example.md


