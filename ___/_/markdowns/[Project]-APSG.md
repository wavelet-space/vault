# Poznámky k vývoji balíku _APSG_

## Proposals

- Spojit `polylx` s `apsg` -- jako balík pro mikro/makro struckturní geologii.

- Doplnit testy k existujícímu kódu.

- Používat `doctest` jako dokumentační příklady, stejně tak je přepoužít v notebooku.

- Odstranit závislot na ndarray v podobě dědičnosti.
  Můžeme implementovat hash!
  Můžeme mít imutable typ -- prostě vracet kopie.
  Rychlost pro malé dimenze je snad i horší než nativní Python.

  Dá se implementovat __array__ poklu chceme převod do ndarray.

  Většinu metod nepotřebujeme
  <https://docs.scipy.org/doc/numpy/reference/generated/numpy.ndarray.html#numpy.ndarray>

- Benchmarky, jak na ně.
  viz změna implementace algoritmu, jak ověřit, že je nejen správný ale např i rzchlejší?

- Podívat se na numba (JIT optimalizace).

- Určit striktně pořadí metod ve třídě.

- Notebooky  
  - rozdělit na více částí?
  - změna v notebooku, mít je vyhodnocené nebo ne?
  - generování z dokumentace?

- Testy - rozdělit testy, podle modulů, aby tam nebyl jeden dlouhej file, aby se to dalo spoštět per modul.

- Autoformátování: Použít black? Zřejmě ano, ale např. data dát do stringu.
  Případně se podívat jak vypnout některá autoformátování.
  Má konfigurační soubor?

- Používat `__all__` jako tuple, ale dej si pozor na `__all__("Some",)` chybějící čárku!

- Přepsat test normalizace vektoru, kontrolovat magnitudu na 1.

- Oddělit __str__ a __repr__

- Jupyter notebook vždy commitovat jako vyhodnocený
  Jak to testovat? Napsat vlastní skript jako precommit-hook?

- Opravit chyby v plt.rcParams['animation.html'] = 'html5'

- Zdokumentovat _Rodriguezovu formule rotace_, používáme namísto rotační matice.
