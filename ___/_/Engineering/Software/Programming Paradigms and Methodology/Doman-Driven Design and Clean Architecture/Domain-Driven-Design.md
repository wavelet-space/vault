# Domain Driven Design (DDD)

## Data Types

- Primitive Type
- Value Object
- Entity

### Primitive Type

### Value Object

### Entity


### a) Why must Domain services use domain objects as parameters and return values?

This is not a strict constraint, but offers certain advantages. The idea behind the rule is that domain services contain functionality that supplements existing entities and value objects. Another non-strict constraint is closure of operations where both the argument and the return value of domain service methods are of the same type. Both of these constraints promote immutability and a functional style thereby reducing side-effects and making it easier to reason about the code, refactor the code, etc.

There are scenarios where it is perfectly acceptable for a domain service method to be parameterized by primitive types.

It is possible to have a domain service method that accepts a primitive type which is neither an entity or value object. However, extensive use of primitive types can result in primitive obsession.

If a primitive type suffices for an operation there is no reason to coerce it into something else. The use of entities and value objects is only a guideline and some prefer to be more strict than others. Some, for instance, use an explicit type to represent identities for each entity. So instead of using int you'd create a value object called OrderId to represent an identity of an order.

A domain service can avoid state mutation by returning new instances of objects instead of modifying the objects that were passed in. In this way, the signature of the method fully describes what it does because there are no side-effects.

### b) Why doesn't DDD also require methods of Entities and Value Objects to use domain objects as parameters and return values?

This constraint can be applied at the entity and value object level to an extent. Entities and value objects compose more primitive types to form complex types and some behaviors may depend on a primitive parameter. This primitive parameter can itself be turned into a value object.


https://stackoverflow.com/questions/14326230/why-must-domain-services-use-domain-objects-as-parameters-and-return-values


## Transient Entity

Pokud se na entitu podíváme z hlediska toho, jestli byla již někde uložena (persistována), k čemlž nám obvykle slouží nějaká databáze, pak může být
entita ve svou stavech: buď je persistentí nebo není, pak o ní říkáme, že je transientí.

Transientní entitta vzikne např, tak, že ji automaticky vugenerujeme pro uživatele-- ==> může i nemusí mít id-

Persistentí se stane, pokud ji např pomocí repository uložíme.

Naopka pokud danou entitu pomocí repository

An identifier value is probably not a strict condition for an object to be persistent since I could use assigned identifier generation strategy.

Pozor persistovat mlžeme do souboru, do paměti ... všechno jde

Jak na transientíentitu jak to poznáme?
Poznáme to tak, že nemá přiřazenou identitu....


## References

When designing REST API, what can we learn of DDD & REST?
In this talk Oliver Gierke present how to combine DDD and REST.
- [DDD & REST - Domain Driven APIs for the web - Oliver Gierke](https://www.youtube.com/watch?v=NdZqeAAIHzc)





Give me the current statet and event

evolve state event =
    ...

decide state command =


## Postup vztváření aplikace

## DOMAIN LAYER

TODO Vytvoř interatktivní animaci toku data systémem.

Nejdříve si vytvoříme mapu domény např. pmocí event stormingu

Zjistíme které entity a jak spolu souvisejí.

Entita je podstatné jméno a přídavné jméno např.

	type USER =
		| ANONYMOUS_USER of USER_DATA
		| REGISTERED_USER of USER_DATA

požadavek je sloveso v rozkazovacím způsobu

	Register_User

Požadavek je odeslán na COMMAND_DISPATCHER (Bus) a tam zpracován
pomocí funkce DISPATCH která vybere správký HANDLER

Zpracování může mít dva odlišné výsledky:

	COMMANDHANDLERESULT<> =
		| ACCEPTED OF SUCCESS_EVENT
		| REJECTED OF FAILURE_EVENT

	Accepted representuje objekt který je použit pro změnu stavu
	Rejected nese informaci o důvodu zamítnutí

	Oboje jsou poslány na Event_Dispatcher (Bus)

proces je je také podstatné jméno např.

	User_Registration

## VIEW LAYER

VIEW komunikuje s DOMAIN přes PRESENTER

Na frontendu se nám trochu změní slovník

	Je něco co vyvolá View např. stisknutí čudlíku
	Každý event je poslán na dispatch, kde je bud přijat nebo ignorován.

    Event dispatch
    Event handling
    Effect handling
    Query
    View
    DOM



# Poznámky k business rules

## Co je to businesové pravidlo?

## Jak je definovat?

Rozeznáváme čtyři druhy businesových pravidel.

#### 1. Definition

Specifická slova, fráze, termíny pro vyjádření businesových pravidel.
Termíny jsou obvykle zaznamenány v glosáři, např. *zákazník*, *účet*, *vklad*, *výběr*.

#### 2. Fact

Základní stavební prvky pro aplikaci pravidel. Např. *Zákazník banky může vkládat a vybírat peníze*.
Nicméně není nijak blíže specifikováno za jakých podmínek je může vkládat a vybírat.

Fakta mohou být definována jako *relationships*, *attributes*, *structures*.

#### 3. Constraint

#### 4. Derivation

## Reference

- [http://www.businessrulesgroup.org/first_paper/BRG-whatisBR_3ed.pdf](http://www.businessrulesgroup.org/first_paper/BRG-whatisBR_3ed.pdf)
