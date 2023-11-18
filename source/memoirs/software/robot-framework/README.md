# Robot Framework

**Návod a ukázky práce s nástrojem RobotFramework.**

## TL;DR

### Chci si vše vytvořit sám

```powershell
mkdir robotframework-demo
cd .\robotframework-demo\
```

### Chci začít s tímto repozitářem

```powershell
git clone https://github.com/groundf/course-robotframework.git
```

A dále již pokračujeme instalací balíků a spuštěním testů.

```powershell
py -m venv --upgrade-deps .venv
pip install -U robotframework robotframework-seleniumlibrary webdrivermanager
webdrivermanager chrome
robot --outputdir .\output\ .\browser-test.robot
```

## Začínáme (podrobně)

RobotFramework se instaluje jako Python balík pomocí nástroje `pip`. Potřebujeme mít tedy funkční instalací Pythonu, což můžeme na operačním systému Windows ověřit pomocí nástroje `py.exe`.

    py -V
    Python 3.10.0

Můžeme tedy vytvořt adresář pro náše testy a přemístit se do něj.

```powershell
mkdir robotframework-demo

    Directory: C:\Users\dlanda\Projects\Bussines

Mode                 LastWriteTime         Length Name
----                 -------------         ------ ----
d-----        24.03.2022     18:35                robotframework-demo

cd .\robotframework-demo\
```

RobotFramework můžeme instalovat buď globálně nebo do virtuálního prostředí, kde druhé je bezpečnější! Proto si vytvoříme virtuální protředí pomocí balíku `venv`, který je součástí Python instalace.

```powershell
py -m venv --upgrade-deps .venv
```

Aktivujeme si virtuální prostředí. Prefix `(.venv)` značí, že máme aktivováno. Pro deaktivaci stčí kdykoliv napsat `deactivate` (více o virtuálním prostředí na vyžádání).

```powershell
.\.venv\Scripts\activate
```

A nyní již naistalujeme potřebné balíky.

```powershell
(.venv) pip install -U robotframework
(.venv) pip install -U robotframework-seleniumlibrary
(.venv) pip install -U webdrivermanager
```

Předchozí lze zapsat také úsporně na jeden řádek.

```powershell
(.venv) pip install -U robotframework robotframework-seleniumlibrary webdrivermanager
```

Naistalovali jsme kromě samotnéhe balíku `robotframework` také rozšiřující balík `robotframework-seleniumlibrary` pro práci s knihovnou Selenium. Poslední balík `webdrivermanager` slouží pro snadnou práci s ovladači k jednotlivým prohlížečům.

V zásade lze každý ovladač stáhnout a vložit do cesty tzn. do proměnné `PATH`. Toto vše ale udělá `webdrivermanager` za nás. Stačí ho jen zavolat před samostným spuštěním testů -- stačí pouze jednou.

```powershell
(.venv) webdrivermanager chrome

Downloading WebDriver for browser: "chrome"
6148kb [00:01, 5099.85kb/s]
Driver binary downloaded to: "C:\Users\dlanda\Projects\Bussines\robotframework-demo\.venv\WebDriverManager\chrome\99.0.4844.51\chromedriver_win32\chromedriver.exe"
Driver copied to: C:\Users\dlanda\Projects\Bussines\robotframework-demo\.venv\Scripts\chromedriver.exe
```

Pokud si však chcete stáhnout např. `chromedriver.exe` tak zde https://chromedriver.chromium.org/downloads.

Já si ho stáhl napříkald do `C:\Users\dlanda\Projects\Libraries`, kdy celý adresář `Libraries` mám nastavený do cesty. Je nutné poté zavřít a opět otevřít terminál

![env1](/env1.png)
![env2](/env2.png)
![env3](/env3.png)

## Testování

Zapíšeme si do testovacího souboru `browser-test.robot`.

```robotframework
*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${URL}          http://google.com/
${BROWSER}      Chrome

*** Test Cases ***
The user can search for flights
    Open browser    ${URL}   ${BROWSER}
	Close all browsers
```

A spustíme náš test-case pomocí příkazu `robot`. Specifikujeme náš soubor s testy a výstupní adresář, kam se zapíšou výsledky testů.

```
(.venv) robot --outputdir .\output\ .\browser-test.robot
```

Měl by se otevřít a následně zavřít prohlížeč a do konzole y se měl vypsat následující výpis.

```
==============================================================================
Browser-Test
==============================================================================
The user can search for flights
DevTools listening on ws://127.0.0.1:54255/devtools/browser/60ba208e-4c81-40e9-9a44-7add76505372
The user can search for flights                                       | PASS |
------------------------------------------------------------------------------
Browser-Test                                                          | PASS |
1 test, 1 passed, 0 failed
==============================================================================
Output:  C:\Users\dlanda\Projects\Bussines\robotframework-demo\output\output.xml
Log:     C:\Users\dlanda\Projects\Bussines\robotframework-demo\output\log.html
Report:  C:\Users\dlanda\Projects\Bussines\robotframework-demo\output\report.html
```

**A to je prozatím vše!**

## Odkazy

- https://github.com/robotframework/
- https://github.com/robotframework/SeleniumLibrary#browser-drivers
