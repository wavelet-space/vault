# Jak navrhovat program (1)

> All theory, dear friend, is grey, but the golden tree of actual life springs ever green.<br>
> – J. W. von Goethe, *Faust* pt. 1 (1808) ‘Studierzimmer’

Každý i sebemenší program je dobré navrhnout tak, aby jsme se v něm dobře orientovali při budoucích změnách nebo rozšíření. Pokud je totiž dobře navržen tzn. rozvrstven nebo modularizován, pak je obykle jednoduché takový program také testovat, protože můžeme snadno izolovat jeho části.
Není nic horšího než se strachovat ze změn v programu jen proto, že se při sebemenší úpravě začne vše hroutit a my hledáme a odchytáváme chyby napříč funkcemi a moduly (soubory).

Existuje jednoduchý návod jak začít psát program tak, aby se nám nestávalo výše uvedené? Já myslím, že ano! Přesto, že existuje nespočet způsobů jak počítačový program navrhnout, existuje pár jednoduchých zásad, které vám pomohou zkrotit jeho zdánlivou složitost.

Než se psutíme do našeho tématu, ještě si popíšeme s jakými programy se v praxi můžeme potkat, respektive které po nás někdo může chtít vypracovat.

Program bez prezentační vrstvy v podstatě neexistuje.

Program vždy vrací nějakou hodnout, i když ji uživatel nevidí.
Program může spouštět i stroj a ten také musí umět zkontrolovat, co se stalo!

## Kategorie programů

### 1. Program s krátkodobým během

Takový program, označme ho např. *fire and forget*, může být spouštěn např. z konzole. Po vyvolání/spuštění provede požadovanou úlohu a skončí. Jsou v podstatě dva mpžné způsoby jak může skončit: 1. skončí úspěšně tzn. provedl, co se po něm chtělo, 2. skončí s neúspěchem.

### 2. Program s dlouhodobým během

Program s dlouhodobým během, myslíme takový, který běží jako server nebo démon.

+ program s interakcí v průběhu činnosti

+ Program si rozdělte minimálně do dvou částí.

Popíšeme si jak lze konceptuálně navrhnout konzolový program

## Sekvenční program

1. Přijmi požadavky od uživatele
2. Zpracuj požadavky a vrať výsledek
3. Zašli výsledky zpracování uživateli

```{mermaid}
sequenceDiagram
    F->>B: Command   
    activate B
    B-->>F: Result   
    deactivate B 
```

Co je *command*? Command je objekt, který nese informaci o tom, co chceme od systému. Jde tedy vlastně o formulaci scénáře (use-case) např. *Vyhledej všechny zákazníky, kteří mají aktuálně něco objednaného*.

Samozřejme že v každé doméně to může být něco jiného. I pokud děláte vědecké výpočty nebo vestavěné systémy, měli byste si sepsat scénáře, co od vašeho progamu chcete např. *Najdi řešení pro (nějakou) rovnici s těmito parametry*.

Takové scénáře popisují očekávané chování systému a lze je použít jako podklad pro testování a dokumentaci.

Aplikace má tedy minimálně dvě části, nebo chcete-li vrstvy. První je prezentační. Skrze ní uživatel komunikuje s aplikací, zadává požadavky a získává výsledky. V případě konzolové aplikace je command-line interface a konzole se standardním vstupe a výstupe naší prezentační vrstvou. Této vrstvě můžeme také říkat *frontent*.

Druhá vrstva, přijímá požadavaky z prezentační vrstvy, provádí požadované akce a vrací výsledky zpět do prezentační vrstvy. Této vrstvě můžeme říkat *backend*. Tato vrstva obsahuje veškerou logiku a validaci (validace mlže částěčne probíhat i na frontendu, ale na backendu musí být i tak!).

Každý use-case je možné vyjádřit funkcí, která zpracuje daný požadavek. Taková funkce zřejme bude přijímat nejaké parametry. Tyto parametry můžeme nazývat jako command a dokonce můžeme vytvořit samostatný typ

Příklad.

```{literalinclude} design1.py
:language: python
:emphasize-lines: 12,15-18

```

```py
def handle(command) -> Result[Event, Error]:
    # decide
    # process
    # return
```

Proč mít oddělenou funkci pro use case a samotný handler? Protože naše funkce neví nic o
frontendu. Úkolem hadler funkce je převzít požadavek z prezentační vrstvy, tou může být stdint (CLI)
nebo HTTP request (REST) nebo dokonce nativní GUI. Command objekt může kromě parametrů pro funkci `find_customer`, také obsahovat další metadata. Handle např. může logovat každý příchoz command, který navíc může nést např. informace, kdo, kdy a proč command poslal. Pro různé preznetační vrstvy stačí tedy jen v podstatě vytvořit jiný handler. Samotný usecase, což je logické jádro apliakce pracuje stále stejně.

Nyní se podíváme na funkci `find_customer()`.

Ta se potřebuje např. dotázat databáze, vyzvednou výsledek, konvertovat ho do entity Custoemer (doménový model) a vrátit výsledek handleru. Podle zvoleného jazyk a přístupu může také vyhazovat výjimku. Je úkolem handleru, aby tuto výjimku obsloužil.

Pro ukázku, jak to celé funkguje vytvoříme jednodychou CLI palikaci i REST. Jediné v čem se liší, je prezentační vrstva repektive handler.

## References

- [notes on clean code](clean-code-notes.md)