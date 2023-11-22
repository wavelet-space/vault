# Flask

Toto jsou poznámky sepsané pro vývoj webových aplikací pomocí frameworku Flask.
Mnoho poznámek je čerpáno z oficiální dokumentace, jsou však zapsány tak, aby podle nich šlo jít krok za krokem při vývoji vlastní aplikace.

## Úvod

Flask je minimalistický framework, spíše sada tříd a funkcí, které obalují  knihovnu Werkzeug a přidávají šablonovací systém Jinja. Flask toho v základní výbavě má dost pro tvorbu jednoduchých webových aplikací, nedostanete však jednoznačný návod, jak ji strukturovat narozdíl např. od frameworku Django. To je v případě učení se podle mne výhoda. Rozšířit Flask o vlastní řešení nebo nastavení vastního workflow je jednoduché a FLask vám nediktuje jak a co máte dělat.

Werkzeug je knihovna implementující WSGI. WSGI specifikuje jak má komunikovat
webový server s Python aplikací. Oproti novějšímu ASGI jde o blokující komunikaci tzn. že není asychronní. Možnost asychronní komunikace se však dá simulovat respektive Flask k tomu nabízí svoje řešení (více později). Pokud si chcete vyzkoušet asycnronní webofý server poohlídnětě se po knihovně Starlette a nad ní postaveným frameworkem FastAPI.


## Instalace

.. code:: shell
    pip install flask

.. code:: shell
    pip install --upgrade -e .

## Minimální aplikace

Jako minimální palikaci můžeme vytvořit soubor `wsgi.py`. To proto, že Flask tento modul automaticky hledá/načítá při použití jeho konzolového rozhraní, o kterém si povíme více v dalších částech.

    wsgi.py


    import flask

    def create_app() -> flask.Flask:
        app = Flask(__name__)
        return app

## Spuštění

- Flask aplikaci můžeme spustit několika způsoby. Nejlepší je odkazovat se na oficiální a aktuální verzi dokumentace než hledat na internetu spoustu někdy více a jindy méně funkčních řešení viz https://flask.palletsprojects.com/en/2.2.x/quickstart/.
- Flask ideálně spouštíme pomocí příkazu `flask` což není nic jiného než program/skript, který nám usnadňuje práci se samotným Flask(em) i jeho případnými rozšířeními (extenzemi) viz https://flask.palletsprojects.com/en/2.2.x/cli/.
- Příkaz `flask run` se dá volat s různými přepínači a to podle toho, jak máme strukturovanou aplikaci.
  Pozor musíme mít Flask >= v2.2

```
flask --version
```

```
flask run --help
```

```
flask --app <module> run
flask --app <module>:<function> run --host ...

-h --host
-p --port
--cert
--key
```

Spuštění s debugerem a reloadem

;flask run --debugger --reload

či zkráceně

    flask run --debug
