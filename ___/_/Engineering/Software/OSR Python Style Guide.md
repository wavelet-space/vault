# Python code style guide 

- Odsazení/zarovnání

- Pořadí objektů v rámci modulu
- Pořadí metod v rámci třídy

- Dokumentační komentář
  - modul
  - konstanta/proměnná
  - funkce
  - třída
    - metoda
- Jmenná konvence
  - balík
  - modul
  - třída

## Odsazení a zarovnání

Protože Python má signifikant whitespace, je horizontální odsazení vesměs jasně dané. Pokud jde o vertikální odsazení mezi
definicemi tříd, metod a funkcí používáme jedno odsazení mezi metodami a dve odsazení mezi třídami anebo funkcemi.
Pro udržení jednotého stylu používám nástroj `black`. Komentáře `#` jsou jen jako poznámky.


```python

def function():
  ...
                                                        #< two vertical spaces between function and class
                         
class Point:
    """                                                 # no vertical space between class and comment
    The geometric point.
    """
    		                         		#< one vertical space between class comment and method
    def __init__(self, x: float, y: float) - > None:
        self._x = x
	self._y = y
                                                        #< one vertical space between methods
    @property
    def x() -> float:
        return self._x
		                          		#< one vertical space between methods
    @property
    def y() -> float:
        return self._y
                                                        
                                                        #< two vertical spaces between classes
class Vector:
   ....
```


## Dokumentační komentáře

Dokumentační komentář pro metody/funkce píšeme následovně:

	def method(a: A) -> B:
	    """Converts A to B.
	    
	    :param a: The input.
	    :return: The output
	    """
	
Příklady 

	Convert(s) ...
	Return(s)  ...
	Calculate ...
	Save ...
	Load .. 

Linting

    pycodestyle  --max-line-length=88 .\src\

Nastav pre-commit hook pro https://pre-commit.com/#cli
- black
- isort
- pytest

Generuj a publikuj dokumentaci pomocí gh-pages.


## Postup vývoje knihovny/aplikace v jazyce Python

- Založíme si projekt s požadovanou strukturou.
  Použijme šablonu projektu: knihovna, aplikace, knihovna + aplikace, webovy projekt, datový projekt.
- Zamyslíme se na povahou projektu a napíšeme si základní funkcionalitu, které bychom měli dosáhnout.
  Berme každou takovu funkcionlaitu jako možnou Python funkci nebo soubor metod třídy.
  Knihovan bude komunikovat s okolím pomocí svého rozhraní tj. modulů, které exportují třídy a/nebo funkce, či konstanty.
  Program s námu bude komunikovat např. pomocí:
  - konzolového vstupu
  - HTTP
  - atd.

## Co by každý python programátor měl umět.


- Kdy použít property, chached_property
- Kdy použít total_ordering
- Jak pracovat s dataclasses
- Přetížení __eq__ a __hash__, kdy proč jak.
- Rozdíl mezi `id(obj1) == id(obj2)` a `obj1 == obj2`
- `__str__` vs `__repr_` resp. `srt()` vs `repr()`.


- Vytvoř instalovatelný balík tzn. že ví co udělat pro to aby bylo možné udělat
	pip install your_shiny_package==1.0.0

- Zná rozdíl mezi `setup.py`, `setup.cfg` a `pyproject.toml`

- Píše rozumné jednotkové testy pro jím vytvořené funkce a metody.
  Nejde nějaká funkce rozumně otestovat? Pak jsi ji asi napsal špatně.
  Typické chyby jsou otevírat a zavírat soubory nebo spojení na DB, provádět výpočty
  v jedné funkci. Obecně IO se testuje jinak než jednotkově, ale lze to různě obejít.
	
  Lepší je předávat vždy funkcím obsah, které chcte zpracovat. Odkud přijde něchte na uživateli.
  Z opět, vracejet strukturu (objekt) a nechtě na uživateli ať si s ní dělá co potřebuje.

- Formátuje zdrojový kód pomocí nástroje `black` a `isort`.
- Když dělá větší změnu, vytvoř postranní větev a po dokončení otevři pull-request.
  - Názvy větví se volí s prefixem a poté oddělené lomítkem a další víceslovné názvy oddělěné spojovníkem.
	featuer/some-new_feature

- Commit message se píše s velkým počátečním písmenem, bez tečty na konci a v imperativu!
	Update README
	Refactor person class
	Fix login error

- Pokud je změna velká, napiště delší commit message než jen jednořádkový a popiště to případně v pull-requestu.

- Pokud vaše větev (pull-request) neprošli testy, nežádejte o review.
- Pokud si s něčím nevíte rady, napiště kolegovi a nečekejte týden.
- Pokud vám vaše feature zabere déle než se naplánovalo, napiště kolegovi a nečekejte týden viz předchozí bod.
- Piště dokumentaci pro všechny veřejné funkce, třídy a metody tzn. ty, které se objeví v proměnné `__all__`
- Dokumentace je normální text, tzn tvoř věty, ne jen shluk slov.
- Pokud je proměnná, funkce či třída veřejná, tak ji uveďte v proměnné `__all__` na začátku modulu.
- Inspirujete se naším oblíbeným OS Linux, tam také platí pravidla jak psát kód a nikdo se s nikým nebaví, pokdu to nedodržujete.
	https://www.kernel.org/doc/html/v4.16/process/howto.html


- Používáme https://pypi.org/project/python-dotenv/


- Jaké je doporučené pořadí metod ve třídě?
- Jak dokumentovat
  - třídní atribut
  - metoda `__init__`
    https://stackoverflow.com/questions/64796801/documenting-class-level-variables-in-python

# Python Setup

### Clone the project and move to the folder

```
git clone https://github.com/czech-radio/cro-schedule-client.git
cd cro.schedule
```

### Create and activate the virtual environment

Vytvoř virtuální prostředí v adresáři projektu. Níže uvedený příkaz je platný pro Windows. S instalací Pythonu se do cesty vloží (zaváděcí) program `py.exe`, který lze použít pro spoustění různých verzí Python interpreteru. Zde explicitně říkáme: Zavolej interpretr Pythonu verze 3.10 (doporučené, používáme nejnovější verzi) a spusť zabudovaný modul `venv` (viz parameter `-m venv`) jako program s parametrem `.venv`. Ten vytvoří adresář `.venv`, do kterého se nakopíruje interpretr Pythonu s potřebnými balíky (knihovnami).

```
py -m venv --upgrade-deps --clear .venv
```

__Windows__

```
.\.venv\Scripts\activate
```

__UNIX__

```
source ./venv/bin/activate
```

Měli bychom vidět podobný prefix s názvem `(.venv)` v terminálu, který ukazuje, že máme aktivní virtuální prostředí daného jména tzn., že všechny instalace balíků a spouštění interpreteru bude probíhat v adresáři `.venv`.

```
(.venv) $ cro.schedule>
```

Jako jméno jsme mohli zvolit cokoliv, ale `.venv` je standardem (je např. uveden i v souboru `.gitignore`, protože ho rozhodně nechceme přidávat do repozitáře).

### Install the package in virtual environment

Instalace balíku v produkčním režimu.

```
pip install -U .
```

Instalace balíku ve vývojovém režimu.

```
pip install -U -e .[test,docs,lint]
```

Nyní můžeme s balíkem pracovat v našich skriptech.

### Deactivate the virtual environment

Provedeme příkazem `deactivate` nebo stačí aktivivat jiné virtuální prostředí.

```
deactivate
```

Další informace k virtuálním prostředím naleznete [zde](https://docs.python.org/3/library/venv.html)

Pokud si chcem být jistí, že spouštíme Python interpretr ze správného prostředí použijeme

__Windows__

```
where.exe python

C:\Users\{name}\Projects\{project}\.venv\Scripts\python.exe
^^^ OK: Jako výchozí spouštíme z virtuálního prostředí a další v řadě jsou následující:

C:\Users\{name}\AppData\Local\Programs\Python\Python310\python.exe
C:\Users\{name}\AppData\Local\Programs\Python\Python39\python.exe
C:\Users\{name}\AppData\Local\Microsoft\WindowsApps\python.exe
```

__UNIX__

```
which python
```

# Python cvičeníčka

Napiš funkci `cipher_rot13` a `decipher_rot13`, která zašifruje/dešifruje daný text pomocí metody rot13.


```
cipher_rot13(text: str) -> str
        ...

decipher_rot13(text: str) -> str:
        ...

def test_cipher_rot13():
    assert cipher_rot13("a b c") == "n p q"

def test_decipher_rot13():
    assert decipher_rot13("n p q") == "a b c"

```


Zde jsou sepsány často opakující se neduhy, které vídám ve zdrojovém kódu.


## Špatně importy

Takový import není vhodný

    from _client import Client as GeneeaClient

kdyžtak aspoň

    from ._client import Client as GeneeaClient

Ale nejépe absolutní

    from cro.geneea._client import Client as GeneeaClient

Důvody:
...

## Název balíku

Metody v Pythonu mohou být instanční, třídní nebo statické

    @classmethod
    @staticmethod


Pokdu nejsou instanční, pak tam parametr `self` nepoužíváme, ale třeba `cls`.


V metodách nepoužíváme print.
Print používáme maximálně pro debugging, ale i na to je lepší rovnou použít modul logging.
Print se dá použít v nějaké hodně top-level funkci, která už přímo vypisje do konzole,
jinak je to code-smell.


Python používá snake_case nikoliv cameCase.

Otevírání souborů v metodaách také není často nejlepší nápad.

prefixování parametrů metody pomocí `_` je zbytečné.

Buď dokumentuj typy parametů do doccommentu nebo aspoň napiš type hint.

Jak poznáme co dělá tahle metoda?

```
  @classmethod
    def get_txt(cls, file_name):
       ...
```


 except Exception as ex:

     vs  except:


Používejte f-string

     logging.error(f"Connection error {ex}")
      logging.error("Connection error: ", ex)










