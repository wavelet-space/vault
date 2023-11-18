========
Numerika
========

.. contents:: Obsah
    :depth: 3
    :local:
    :backlinks: none

Řešení soustavy lineárních rovnic
=================================
* Přímé metody - Gaussova eliminace, LU dekompozice
* Iterační metody - Jacobiho, Gauss-Seidelova metoda, superrelaxační, metoda sdružených gradientů, GMRES
* Podmíněnost soustavy
* Numerické řešení nelineárních rovnic a soustav nelineárních rovnic.
* Existence a jednoznačnost řešení, konvergence a stabilita metody

Aproximace a interpolace
========================
* Metoda nejmenších čtverců
* Lagrangeova a Newtonova interpolace, interpolace spline funkcemi

Numerická integrace
===================
* jednoduché a složené Newton-Cotesovy kvadraturní vzorce, Richardsonova extrapolace, Rombergův vzorec.

Obyčejné diferenciální rovnice (ODR)
====================================

* jednokrokové metody
* vícekrokové metody

* Eulerova metoda
  * Forward Euler
  * Backward Euler
* Runge-Kutta metody

* Cauchyho úloha
* Lineární vícekrokové metody, prediktor-korektor, stabilita, stiff rovnice.
* Obyčejné diferenciální rovnice, okrajová úloha
* Aproximace konečnými diferencemi, stabilita, konvergence.
* Variační formulace, Galerkinova metoda.

Parciální diferenciální rovnice (PDR)
=====================================

* Klasifikace, Fourierova analýza lineárních PDR, charakteristiky.
* Eliptická rovnice - diskretizace, konečné diference, pěti a devítibodové schéma, okrajové podmínky, řešení lineárního systému, LOD a ADI metody.
* Rovnice difúze - konečné diference, metoda přímek, stabilita, von Neumannova analýza, Crank-Nicolson.
* Rovnice advekce - konečné diference, metoda přímek, Lax-Friedrichs, Lax-Wendroff, upwind metody, spektrální metoda, stabilita.
* Hyperbolické systémy - rovnice mělké vody.

Interpolace, Extrapolace
========================

Řešení soustav lineárních rovnic (matice, vektory)
==================================================
- Podmíněnost, číslo podmíněnosti
- LU rozklad (faktorizace)
- QR rozklad (faktorizace)
- Schur(ův) rozklad (faktorizace)
- SDV (Singular Value Decomposition)

- Iterační metody
- Gauss-Seidel metoda
- Metoda sdružených gradientů

Obyčejné diferenciální rovnice ODR
==================================
- Eulerova metoda
- Metoda polovičního kroku
- Lineární ODR
- Logistická rovnice

- Jednokrokové metody
    - Runge-Kutta (klasické) metody

- Vícekrokové metody
    - ...

# Parciální diferenciální rovnice

- Rovnice vedení tepla = Fourierův zákon
  - Laplace
  - Poisson
- Rovnice difuze

- Metoda konečných diferencí
- Metoda konečných prvků

- Kurz NMNV532: Paralelní maticové výpočty; https://www2.karlin.mff.cuni.cz/~hron/NMNV532/

- Kurz NMMO403: https://www2.karlin.mff.cuni.cz/~hron/NMMO403/