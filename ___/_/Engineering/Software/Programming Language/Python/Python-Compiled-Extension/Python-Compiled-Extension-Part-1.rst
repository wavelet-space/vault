=========================
Programovací jazyk Python  
=========================

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Tvorba vlastního nativního modulu v jazyce C: 1. část
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

V této části s=rie o programovacím jazyce Python si ukážeme jak lze vytvořit nativní (kompilovaný) balík v podobě dynamické knihovny, který vytvoříme v programovacím jazyce C.  

Úvod
====

Intepret programovacího jazyka Python, se jmenuje `CPython <https://github.com/python/cpython>`_. Jak název napovídá, je naprogramován v jazyce C a kromě toho, že interpretuje programy napsané v přímo v jazyce Python, umí také pracovat s kompilovanými moduly, díky lze některé operace, obzvláště ty, které něco počítají, mnohonásobně zrychlit. Za tímto účelem totiž vznikla většina knihoven (balíků) jako např. velmi používaný balík `NumPy <https://numpy.org>`_ pro práci s n-dimenzionálními poli. 

Předpoklad
==========

Pro vytvoření balíku potřebujeme mít instalovaný kompilátor a linker jazyka C. Na operačním systému Microsoft Windows lze vybírat z těchto kompilátorů: GCC, CLang, MSVC, z níhž poslední je přímo z dílny firmy Microsoft. Velmi důležitou informací je, že samotný **CPython je pro operační systém Windows kompilován práv s kompilátorem od firmy Microsoft**. Důvod je prostý, aby interpreter mohl načíst nativní balík v podobě dynamické knihovny, pak musí být binárně kompatibilní. 

Právě nekompatibilita kompilovaných balíků a samotného interpreteru byla v minulosti zdrojem mnoha potíží. Dnes je mnoho nativních balíků předpčipravena (předkompilována) a distribuována pomocí formátu wheeel o kterém si povíme později.

Před vytvářením nativního balíků si tedy musíme zjistit, jakou verzí kompilátoru byl vytvořen námi používaný Python interpretr (CPython). To můžeme zjistit několika způsoby. Nejjednodušší je prostě zavolat instalovaný interpretr. Protože mám na systému instalováno několik interpreterů, provedeme pro srovnání pro několik z nich.

Pro vyhledání všech na systému instalovaných interpreterů můžeme použít spouštěč ``py.exe``, s parametrem ``--list``, kde hvězdičkou je označen výchozí interpretr (tj. interpretr, který se spustí při příkazu ``python``. 

.. code-block:: powershell

    PS C:\Users\dlanda> py --list
    Installed Pythons found by C:\Windows\py.exe Launcher for Windows
    -3.10-64 *
    -3.9-64
    -3.8-64

Případně s absolutní cestou k interpreteru:

.. code-block:: powershell

    PS C:\Users\dlanda> py --list-paths
    Installed Pythons found by C:\Windows\py.exe Launcher for Windows
    -3.10-64       C:\Users\dlanda\AppData\Local\Programs\Python\Python310\python.exe *
    -3.9-64        C:\Users\dlanda\AppData\Local\Programs\Python\Python39\python.exe
    -3.8-64        C:\Users\dlanda\AppData\Local\Programs\Python\Python38\python.exe

Nyní pomocí ``py`` spustíme každý interpretr pomocé parametru označující verzi.

.. code-block:: powershell

    PS C:\Users\dlanda> py -3.8
    Python 3.8.6 (tags/v3.8.6:db45529, Sep 23 2020, 15:52:53) [MSC v.1927 64 bit (AMD64)] on win32
    Type "help", "copyright", "credits" or "license" for more information.
    >>>

.. code-block:: powershell

    PS C:\Users\dlanda> py -3.9
    Python 3.9.0 (tags/v3.9.0:9cf6752, Oct  5 2020, 15:34:40) [MSC v.1927 64 bit (AMD64)] on win32
    Type "help", "copyright", "credits" or "license" for more information.
    >>>

.. code-block:: powershell

    PS C:\Users\dlanda> py -3.10
    Python 3.10.0 (tags/v3.10.0:b494f59, Oct  4 2021, 19:00:18) [MSC v.1929 64 bit (AMD64)] on win32
    Type "help", "copyright", "credits" or "license" for more information.
    >>>

K tomu slouží následující tabulka:
  
.. csv-table:: Microsoft Visual C++ versions
   :header: "Visual C++ version", "_MSC_VER"
   :widths: 20, 20

    Visual C++ 4.x, 1000
    Visual C++ 5, 1100
    Visual C++ 6, 1200
    Visual C++ .NET, 1300
    Visual C++ .NET 2003, 1310
    Visual C++ 2005 (8.0), 1400
    Visual C++ 2008 (9.0), 1500
    Visual C++ 2010 (10.0), 1600
    Visual C++ 2012 (11.0), 1700
    Visual C++ 2013 (12.0), 1800
    Visual C++ 2015 (14.0), 1900
    Visual C++ 2017 (15.0), 1910
    Visual C++ 2017 (15.3), 1911
    Visual C++ 2017 (15.5), 1912
    Visual C++ 2017 (15.6), 1913
    Visual C++ 2017 (15.7), 1914
    Visual C++ 2017 (15.8), 1915
    Visual C++ 2017 (15.9), 1916
    Visual C++ 2019 RTW (16.0), 1920
    Visual C++ 2019 (16.1), 1921
    Visual C++ 2019 (16.2), 1922
    Visual C++ 2019 (16.3), 1923
    Visual C++ 2019 (16.4), 1924
    Visual C++ 2019 (16.5), 1925
    Visual C++ 2019 (16.6), 1926
    Visual C++ 2019 (16.7), 1927
    Visual C++ 2019 (16.8), 1928
    Visual C++ 2019 (16.9), 1928
    Visual C++ 2019 (16.10), 1929
    Visual C++ 2019 (16.11), 1929
    Visual Studio 2022 RTW (17.0), 1930

Kompilace balíku/modulu na Windows
==================================

.. code-block:: powershell

    (.venv-3.9) PS C:\Users\dlanda\Projects\Personal\skia-python-demo\native-module> python setup.py install --verbose
    running install
    running bdist_egg
    running egg_info
    creating demo.egg-info
    writing demo.egg-info\PKG-INFO
    writing dependency_links to demo.egg-info\dependency_links.txt
    writing top-level names to demo.egg-info\top_level.txt
    writing manifest file 'demo.egg-info\SOURCES.txt'
    reading manifest file 'demo.egg-info\SOURCES.txt'
    writing manifest file 'demo.egg-info\SOURCES.txt'
    installing library code to build\bdist.win-amd64\egg
    running install_lib
    running build_ext
    building 'demo' extension
    creating build
    creating build\temp.win-amd64-3.9
    creating build\temp.win-amd64-3.9\Release
    C:\Program Files (x86)\Microsoft Visual Studio\2019\BuildTools\VC\Tools\MSVC\14.24.28314\bin\HostX86\x64\cl.exe /c /nologo /Ox /W3 /GL /DNDEBUG /MD -IC:\Users\dlanda\AppData\Local\Programs\Python\Python3.9\include -INone -IC:\Users\dlanda\Projects\Personal\skia-python-demo\.venv-3.9\include -IC:\Users\dlanda\AppData\Local\Programs\Python\Python39\include -IC:\Users\dlanda\AppData\Local\Programs\Python\Python39\include -IC:\Program Files (x86)\Microsoft Visual Studio\2019\BuildTools\VC\Tools\MSVC\14.24.28314\include -IC:\Program Files (x86)\Windows Kits\10\include\10.0.17763.0\ucrt -IC:\Program Files (x86)\Windows Kits\10\include\10.0.17763.0\shared -IC:\Program Files (x86)\Windows Kits\10\include\10.0.17763.0\um -IC:\Program Files (x86)\Windows Kits\10\include\10.0.17763.0\winrt -IC:\Program Files (x86)\Windows Kits\10\include\10.0.17763.0\cppwinrt /Tcdemo.c /Fobuild\temp.win-amd64-3.9\Release\demo.obj
    demo.c
    creating C:\Users\dlanda\Projects\Personal\skia-python-demo\native-module\build\lib.win-amd64-3.9
    C:\Program Files (x86)\Microsoft Visual Studio\2019\BuildTools\VC\Tools\MSVC\14.24.28314\bin\HostX86\x64\link.exe /nologo /INCREMENTAL:NO /LTCG /DLL /MANIFEST:EMBED,ID=2 /MANIFESTUAC:NO /LIBPATH:C:\Users\dlanda\Projects\Personal\skia-python-demo\.venv-3.9\libs /LIBPATH:C:\Users\dlanda\AppData\Local\Programs\Python\Python39\libs /LIBPATH:C:\Users\dlanda\AppData\Local\Programs\Python\Python39 /LIBPATH:C:\Users\dlanda\Projects\Personal\skia-python-demo\.venv-3.9\PCbuild\amd64 /LIBPATH:C:\Program Files (x86)\Microsoft Visual Studio\2019\BuildTools\VC\Tools\MSVC\14.24.28314\lib\x64 /LIBPATH:C:\Program Files (x86)\Windows Kits\10\lib\10.0.17763.0\ucrt\x64 /LIBPATH:C:\Program Files (x86)\Windows Kits\10\lib\10.0.17763.0\um\x64 /EXPORT:PyInit_demo build\temp.win-amd64-3.9\Release\demo.obj /OUT:build\lib.win-amd64-3.9\demo.cp39-win_amd64.pyd /IMPLIB:build\temp.win-amd64-3.9\Release\demo.cp39-win_amd64.lib
    Vytváří se knihovna build\temp.win-amd64-3.9\Release\demo.cp39-win_amd64.lib a objekt build\temp.win-amd64-3.9\Release\demo.cp39-win_amd64.exp.
    Vytváří se kód.
    Vytváření kódu se dokončilo.
    creating build\bdist.win-amd64
    creating build\bdist.win-amd64\egg
    copying build\lib.win-amd64-3.9\demo.cp39-win_amd64.pyd -> build\bdist.win-amd64\egg
    creating stub loader for demo.cp39-win_amd64.pyd
    byte-compiling build\bdist.win-amd64\egg\demo.py to demo.cpython-39.pyc
    creating build\bdist.win-amd64\egg\EGG-INFO
    copying demo.egg-info\PKG-INFO -> build\bdist.win-amd64\egg\EGG-INFO
    copying demo.egg-info\SOURCES.txt -> build\bdist.win-amd64\egg\EGG-INFO
    copying demo.egg-info\dependency_links.txt -> build\bdist.win-amd64\egg\EGG-INFO
    copying demo.egg-info\top_level.txt -> build\bdist.win-amd64\egg\EGG-INFO
    writing build\bdist.win-amd64\egg\EGG-INFO\native_libs.txt
    zip_safe flag not set; analyzing archive contents...
    __pycache__.demo.cpython-39: module references __file__
    creating dist
    creating 'dist\demo-0.1.0-py3.9-win-amd64.egg' and adding 'build\bdist.win-amd64\egg' to it
    removing 'build\bdist.win-amd64\egg' (and everything under it)
    Processing demo-0.1.0-py3.9-win-amd64.egg
    removing 'c:\users\dlanda\projects\personal\skia-python-demo\.venv-3.9\lib\site-packages\demo-0.1.0-py3.9-win-amd64.egg' (and everything under it)
    creating c:\users\dlanda\projects\personal\skia-python-demo\.venv-3.9\lib\site-packages\demo-0.1.0-py3.9-win-amd64.egg
    Extracting demo-0.1.0-py3.9-win-amd64.egg to c:\users\dlanda\projects\personal\skia-python-demo\.venv-3.9\lib\site-packages
    demo 0.1.0 is already the active version in easy-install.pth

    Installed c:\users\dlanda\projects\personal\skia-python-demo\.venv-3.9\lib\site-packages\demo-0.1.0-py3.9-win-amd64.egg
    Processing dependencies for demo==0.1.0
    Finished processing dependencies for demo==0.1.0


Kompilace zřejmě proběhla v počádku během procesu vznikly dva adresáře ``build`` a ``dist``. V adresáří build vidíme

.. code-block::

    (.venv-3.9) PS C:\Users\dlanda\Projects\Personal\skia-python-demo\native-module> ls .\build\

        Directory: C:\Users\dlanda\Projects\Personal\skia-python-demo\native-module\build

    Mode                 LastWriteTime         Length Name
    ----                 -------------         ------ ----
    d-----         7/25/2022   9:43 AM                bdist.win-amd64
    d-----         7/25/2022   9:43 AM                lib.win-amd64-3.9
    d-----         7/25/2022   9:43 AM                temp.win-amd64-3.9


.. code-block::

    (.venv-3.9) PS C:\Users\dlanda\Projects\Personal\skia-python-demo\native-module> ls .\dist\

        Directory: C:\Users\dlanda\Projects\Personal\skia-python-demo\native-module\dist

    Mode                 LastWriteTime         Length Name
    ----                 -------------         ------ ----
    -a----         7/25/2022   9:43 AM           6495 demo-0.1.0-py3.9-win-amd64.egg


Import balíku/modulu
====================

Spustíme interpretr a vyzkoušíme, jestli výsledný modul ``demo`` lze importovat a zavolat naší funkci ``division``.

Instalovat balík můžeme pomocí příkazu:

.. code-block::

    pip install -e .

.. code-block::

    (.venv-3.9) PS C:\Users\dlanda\Projects\Personal\skia-python-demo\native-module> py
    Python 3.9.0 (tags/v3.9.0:9cf6752, Oct  5 2020, 15:34:40) [MSC v.1927 64 bit (AMD64)] on win32
    Type "help", "copyright", "credits" or "license" for more information.
    >>> import demo
    >>> demo.division(3, 2)
    1

Pokud vidíte výsledek jako na předchozí ukázce, můžeme si gratulovat, že se nám podařilo vytvořit naší první nativní (kompilovanou) extenzi!

Způsob jak zjistit, který Python interpretr používáme.

.. code-block:: powershell

    where.exe python

Shrnutí
=======

Ukázali jsem si jak jednoduše pomocí Python C API vytvořit a zkompilovat vlastní nativní modul. Použili jsme setup.py, kdy Python sám zkompiluje daný nativní modul. V příští části si ukážeme, jak použít pro kompilaci použít nástroj `CMake <https://cmake.org>`_. 