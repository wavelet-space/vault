# UniQ

Projekt *UniQ* umožňuje snadné vyhledávání, zobrazování a správu středověkých textů a jejich autorů.  

## Zadání a popis projektu

Výsledkem projektu bude webová aplikace, která umožňuje vyhledávat, zobrazovat a spravovat databázi středověkých textů a jejich autorů.
Projekt a jeho zpracování je rozděleno na dvě části:

- Veřejná část aplikace
  - Prezentační rozhraní
- Neveřejná část aplikace
  - REST API
  - Administrační rozhraní
  - Databáze

Jako inspiraci uveďme projekt [*Ptolemaeus Arabus et Litanus*](https://ptolemaeus.badw.de/start).

### Zvolené technologie

- Backend: Webový server node.js nebo Python.
- Frontend: ReasonML transpilovaný do jazyka JavaScript.  
- Databázový server: PostgreSQL nebo MySQL, podle možností IT AV.

## Požadavky

- redakční systém
- odkazy na skeny textů (iframe?)
- vícejazyčnost?
- přihlašování
- přehled změn v databázi
- relační nebo dokumentová databáze?

- nasazení v docker kontejneru
- verzování v Git a github

### Aplikace

- Aplikace MUSÍ umožňovat ověření uživatele, tj. umožnit přihlašování např. za účelem administrace.

- Aplikace MUSÍ být dostupná přes webový prohlížeč.

- Aplikace MUSÍ mít konzistentí vzhled a chování ve všech běžně používaných verzích prohlížečích:
  - Google Chrome
  - Mozilla Firefox
  - Microsoft Edge / Internet Explorer

  Poznámka: Definujme přesné verze rozumně tak, abychom zahrnuli i uživatele, kteří nemohou použít novější verze prohlížeče. To se týká nejvíce prohlížeče Internet Explorer, který se dříve choval velmi odlišně oproti ostatním prohlížečům a naneštěstí byl výchozím prohlížečem v korporátním a často i akademickém prostředí.

  Poznámka: Prioritu v tomto případě má veřejná část aplikace oproti neveřejné, to např. znamená, že pro adminisraci stačí aby spolehlivě fungovala v posledních verzích prohlížečů.

- Aplikace MUSÍ umožnit pokročilé vyhledávání.

- Aplikace MUSÍ umožnit uložení citace textu do schránky (*clipboard*) pro další snadné vložení pomocí `CTRL+V`.

### Projekt

- Projekt MUSÍ být poskytnut v podobě zdrojových souborů v čitelné podobě.

- Projekt MUSÍ být publikován jako *open-source* pod vhodně zvolenou licencí.

- Projekt MUSÍ být náležitě zdokumentována na úrovni zdrojového kódu, jejího chování i způsobu nasazení.

### REST API

## Popis domény

Pod pojmen *popis domény* myslíme vysvetlení všech termínu, faktů a pravidel, která se kterými v aplikaci pracujeme, tak aby si programátoři odbornící na danou doménu -- v tomto případě historici -- rozuměli a hovořili tkzv. *stejným jazykem*.

> *Autor textu* je

> *Univerzálie* je druh středověkého textu ...

> *Kvodlibet* je druh středověkého textu ...

> *Rukopis* je druh středověkého textu, který ...

> *Foliace* je

> *Instituce uložení* je název instituce, kde je daný text fyzicky uložen.
  př. Národní knihovna ČR.

> *Rukopisná signatura* -- např. Praha, Národní knihovna ČR, X E 24, fol. 10r-25v  
