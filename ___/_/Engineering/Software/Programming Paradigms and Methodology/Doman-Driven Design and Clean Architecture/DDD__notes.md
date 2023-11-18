### Command & Event
​
Event is something what happend and possibly changed the application state.
​
Each entity has to be created and possibly deleted so there are at least two commands which you need are:
​
- `CreateEntity` command produces `EntityCreated` event.
- `DeleteEntity` command produces `EntityDeleted` event.





NOTES 2018-07-25


> Vrstva s doménovým modelem nezávisí na žádne další vrstvě, ale všechny ostatní vrstvy závisí na ní.

Port := je USE CASE BOUNDARY
Implementace pomocí Facade/API vrstvy.

Adapter :=



NOTES 2018-07-24

CO JE TŘEBA PRO AVO

- [-] Je třeba stanovit běžné postupy v programování aplikací a knihoven v jazyku Python.

## Repository

Pro přístup do databáze používáme *Repository Pattern*. Jde o třídu, která se stará o perzistenci doménových entit do nějakého úložiště.
Toto úložiště může být databáze a to jak serverová, jako PostgreSQL nebo souborová jako SQLite, či dokonce jen úložiště v paměti (implementace např. pomocí slovníku nebo SQLIte otevřená jen v paměti.)

Repository by nás mělo odstínit od detailů jak jsou entity ukládány či získávány z úložiště. Je zřejmé, že v případě databáze budeme potřebovat nějaký druh spojení a v případě souboru ukazatel na soubor (file descriptor).

V mnoha případech budeme předávat nějaký connection_maneger, který řeší connection pooling.

Repository by měla imple,mentovat context managment tedy metody `__enter__`, `__exit__`.


## Domain Services

### Specification

též Predicate/Criteria

### Validators

...

### `Where` object

    where(collection, predicate)

### `Filter` object

Filter je funkce, kolekce funkcí nebo třída, která slouží pro filtrování prvků z kolekce.
Filter může používat specifikaci jako argument, nebo přímo  ji použít přímo.
Filter nemusí vracet celé kolekce, ale využít generátorů / streamování.

```python
def get_adult_person(persons: Iterable[Person]) -> Generator[Person]:
    for person in persons:
        if person.age > 18:
            yield person

```

Proč nepoužít funkci `filter` protože v Pythonu není chainable.

### Transformers

Transformer přebírá kolekci a upravuje prvky, které následně vrací. Jestli budeme modifikovat stávající entity, nebo
vracet kopii je na nás. Spíše se přikláním k vrácení nové kopie s tím, že entita by měla mít metody, které umožní snadnější
kopírován víiz `with_changed_name`.

```python
def change_persons_name_to_uppercase(persons: Iterable[Person]) -> Generators[Person]:
    for person in persons:
        modified_person = person.with_changed_name(person.name.upper())
        yield modified_person

```
### Generators

Generator vytváří nové prvky s požadovanými vlastnostmi.

### Specifications

LAYERS

domain <--uses-- service <--uses-- client
