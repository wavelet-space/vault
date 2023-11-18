## EVENT SOURCING v C++

## Odkazy

https://abdullin.com/post/event-sourcing-specifications/

## Úvod

Event sourcing je způsob jak reprzentujeme a pracujeme se stavem aplikace.

Stav objektu reprezentujeme jak sekvenci událostí, které popisují změnu tohoto stavu.
Zdá se to jednoduché, tedy po každé změně stavu objektu, vygenerujeme událost?
Ne tak docela. Mi měníme stav objektu jen skrze tuto událost, objekt má tedy 
shcopnost aplikovat na sebe událost, která změní jeho stav. To je výhodné 
pokud chceme objekt uvést do stavu ve kterém byl třeba před rokem nebo před
pádem aplikace.


Stav objektu je souhrnem všech dosavadních událostí, které popisují změnu jeho stavu.
Ve světě funcionálních jazyků bychom použili funkci `leftFold` v C++: std::accumulate().


Namísti přímé změny objektů, nejdříve vygenerujeme příkaz pro změnu stavu, který poté aplikujeme.
Pokud byl příkaz systéme přijat, provedeme příslušné změny a vygenerujeme událost, která 
popisuje změnu. Systém je schopý se pomocí aplikací událostí uvést do stavu ... 
Problém teorie je, že to zní velmi jednoduše a rozumně, ale v praxi narazíme na
spoutu detailů, které si budeme muste ujasnit ať už za pomoci dalších, nebo prostě sami .)

Vytvoříme si ukázkovou aplikaci v C++, která využívá *event sourcing*.

struct Message { ... };

struct Event: Message { ... };

struct Command : Message { ... };

struct Message 
{   
    Message() { ... } 

    }
    
    Message(const Message &other) { ... }
    virtual ~Message() { }    
}




MESSAGE
    je neměnný objekt, která může reprezentovat jak příkaz, tak událost.

    COMMAND 
        reprezentuje změnu, kterou chceme v systému provést (obvykle na nějaké entitě).
        
        class Command(aggregateID: UUID, ...)
                
    RETROACTIVE COMMAND 
        Příkaz, který produkuje opačnou akci než nějaký existující příkaz, např. Proveď_Vklad vs Proveď_Výběr.

    EVENT 
        Neměnný objekt, který reprezetuje změnu nějaké entity (aggregate root).
        Pokaždé když systém aktualizuje stav entity, tak je zvíšeno číslo verze tohoto objektu.
        
        class Event()

    RETROACTIVE EVENT 
        Objekt popisující změnu v systému ... podobně jako retroactive command.

    ACTION?
        command popisuje, která akce má být provedena.
         event popisuje, která akce byla provedena.

EVENT SOURCING


Jak event sourcing funguje?

Pro každé zpracovaném požadavku (command) na změnu stavu objektu, vygeneruj událost, ketrá popisuje jak (co) se změnilo.
Každou událost ulož se zachováním pořadí událostí, tak, jak byla vygenerována.

Poznámka:  Command sám o sobě nese jen informaci -- je to ndobka na data, neobsahuje tedy metodu execute(), 
jak ji známe z "command pattern", ale je vykonána až jiným objektem a to nám potencinálně umožňuje ji interpretovat
různě podle kontextu a jiných okolností.

COMMAND SOURCING

AGGREGATE ROOT
    receive commands and react by emiting events.

PROCESS MANAGER 
    receive events and react by emiting commands.
        
COMMAND UPGRADING
http://cqrs.nu/Faq
    
CommandHandler je objekt, který vykonává následující kroky:
    příjímá Command objekt
    validuje Command objekt
    zjistí příkemce Commandu (command objekt si sebou nese informaci o ID příjemce)
    spustí odpovídající metodu na 
    
 
 Dva možné způsoby jak implementovat ES
 

1)

AggregateRoot obsahuje metody pro obsluhu všech události je tedy samotným EventHandlerem, které s danou entitou souvisí a která 
    mění jeho stav. Většinou implementuhe rozhraní IHandleEvent<EventType> pro každý typ události, která s ním souvisí.
    
2) Nebo pomocí samostatného Objektu EventHandler
    
FLOW in ES

UI generuje *command* objekt, který je přidán na CommandBus



CommandBus objekt je zodpovědný za to, že zavolá potřebný CommandHandler pro tento typ příkazu (*command* objektu).
CommandHandler vybere správný AgggateRoot objekt (zpráva nese informaci o jeho ID) a sestaví jeho aktuální stav ze všech
dostupných událostí.

Stav získaný z historie událostí

Pomocí metody `loadFromHistory` získáme sekveni událostí, pro požadovanou entitu.
Na každou událost je aplikována metoda `apply` (tak jak šli za sebou).









Event Sourcing

Pokud navrhujete software, který běží mění během svého běhu scvůj stav, jste vždy vystaveni otázce,
zanamenat stav aplikace např pro jednoducho funkci *undo*.

Event sourcing je jednoduchá metoda a vlastně velmi stará metoda, která umožňuje sledovat stav aplikace 
od jejího spuštění až po současný stav, případne zrekonstruovat její stav přehráním všech dostupných 
záznamů.

Jedna z nejjednnodušších implementací je ta, že každá třída (aggregate root v terminologii DDD) si drží 
všechny změny stavu jako kolekci. Jak je taková změna zaznamenán je na nás. V OOP světě je to jednoduchý objekt,
který nese informaci o hodnotě atributu(ů), ketré se mění.

```
class User(String firstName, String lastName);

class UserFirstNameChanged(String newFirstName);

user.changeFirstName(String firstName);

```

Každá událost má zjednodušeně tento tvar:


Event: {
    AggregateRootId, 
    AggregateRootVersion, 
    EventType
    EventDate
    EventVersion
    EventPayload
};

class DomainEvent {
    UUDI getAggregateRootId();
}

Úkol:
Vyjádři historii stavu systému jako sekvenci událostí.
Událost musí být popsána tak, aby jí rozuměl každý z dané domény.
Vyvarujte se slovu `Update`, které většinou nepopisuje dostatečně co se událo.


Memory Model
Stav aplikace je udržován v paměti anmísto ukládaní do trvalého úložiště.
Často se tento způsob kombinuje s trvalým uložením stavu a to tak, se ukládají
jen tzv. snapshots, tedy souhrn stavu aplikace za nějaký definovaný interval nebo 
počet uložených stavů v paměti.

Výhodou udržovaní stavu aplikace v paměti je rychlost přístupu. Rychlost přístupu
se může navíc radikálně zvýšit, pokud se stav udržuje blízko procesoru v CACHE paměti L1 nebo L2.







Když jsem poprvé narazil na termím DOmain-Driven Design a přečetl si jak a proč bych se o něj měl zajímat, přesně to sedělo na mou situaci. Měl jsem 
několik aplikací, které jakž takž fungovali, kde v průběhu programování
věci dávali smysl, ale s nějakým odstupem se mi zdálo, že je něco špatně.

DDD je o *ubiqutous language*, tedy to co byschom mohli řeložit jako *společná řeč*, všechno ostatní je podružné. Nic jiného vám nepomůže tak, jako kladení si otázky "Co a to vytvářím?" a to opakovaně během v průběhu celého projektu.

