---
title: Fortran 95 a paralelní programování
---

- http://geo.mff.cuni.cz/users/hanyk/NPRF039/index.htm

## Lekce 1

Pánové kolegové,

z prvních dvou přednášek posílám první dva zdrojové kódy.

01-testSchedule.f90: Nechali jsme v cyklu podepisovat vlákna
(OMP_GET_THREAD_NUM) do jimi zpracovávaných prvků pole. Nastavovali jsme
různé hodnoty v klauzuli SCHEDULE pro rozdílení iterací cyklu mezi vlákna.
Pro případ potřeby překladu bez OpenMP jsme dodali vlastní modul
my_omp_lib_stubs s dvěma pahýly (stubs) OpenMP funkcí; potřeboval by to
gfortran, ifort má volbu -qopenmp-stubs a nvfortran pahýlům rozumí bez
dalšího. Zkuste si to párkrát pustit a sledovat, jak se proměňuje DYNAMIC
a GUIDED přiřazení iterací vláknům. Navrhoval jsem domácí úkol - vyčíslit
počty po sobě jdoucích iterací přiřazených témuž jádru, tedy např. pro
výpis 2 2 2 2 0 0 1 1 1 vrátit sekvenci 4 2 3, a prověřit si takto, jak
funguje SCHEDULE (GUIDED) různých překladačů.

02-testParallelLoops.f90: Pokusili jsme se o syntetickou zátěž procesoru -
do prvků pole se ukládají součty aritmetické posloupnosti získávané
postupnou kumulací. Testovali jsme rychlost sekvenčního běhu a paralelních
chodů při různém počtu vláken. Sekvenční cyklus DO jsme ošetřili
direktivami PARALLEL DO s default rozdílením iterací a SCHEDULE (GUIDED),
na cyklus FORALL a na přiřazovací příkaz jsme nasadili PARALLEL WORKSHARE
a také jsme vzali do hry novější DO CONCURRENT. Jak se ukázalo až po
přednášce, výraznou úlohu hraje v našem kódu autoparalelizace a také
autovektorizace. Překladové řádky jsou uvedené v záhlaví souboru, některé
volby ovšem nejsou ortogonální a jejich společné užití nemá dobrý dopad na
výsledek.

Několik klíčových poznatků zde shrnu:

- Velmi dobrých časů běhu konzistentně dosahuje prostý sekvenční cyklus DO
s direktivami PARALLEL DO a SCHEDULE (GUIDED). Default statické rozdílení
je při nerovnoměrné práci jednotlivých iterací nevýhodou.

- gfortran a ifort ignorují direktivu PARALLEL WORKSHARE pro paralelizaci
cyklu FORALL a přiřazení mezi poli, oba překladače však obě varianty
autoparalelizují (gfortran -ftree-parallelize-loops=N, ifort -parallel,
ifort/win -Qparallel). nvfortran autoparalelizaci nenabízí, ale jeho
OpenMP zohledňuje direktivu WORKSHARE, ale jen pro FORALL, přiřazení mezi
poli za direktivou WORKSHARE odmítne.

- Všechny tři překladače berou na vědomí DO CONCURRENT: ifort pomocí volby
pro OpenMP, gfortran pomocí autoparalelizační volby a nvfortran pomocí
specifické volby (-stdpar=multicore). Náš kód pak běží v DO CONCURRENT
stejně rychle jako prosté DO s direktivou PARALLEL DO SCHEDULE (STATIC).
Jak ovšem ještě uvidíme, DO CONCURRENT zatím nedosahuje dalších schopností
svého konkurenta. nvfortran v případě DO CONCURRENT (jen zde) vycítil, co
náš program dělá, a zoptimalizoval ho na nulovou dobu běhu.

- Kromě optimalizace -O3 se na modernějších strojích ukazuje jako účinná
také explicitní volba pro přizpůsobení se procesoru, především aktivování
vektorizace. Pro gfortran (a ifort/lnx a nvfortran jako synonymum) je to
-march=native, pro ifort/lnx -xHost, ifort/win -Qxhost a nvfortran
-ta=host. V nvfortranu je vektorizace aktivní od optimalizace -O2, takže
doby běhu implicitně vektorizujícího nvfortranu mohou být zvýhodněné proti
dalším dvěma překladačům při neaktivní vektorizaci.

Tak buď se podívejte na to rozdílení práce při SCHEDULE (GUIDED), nebo na
cokoliv jiného, co s přiloženými kódy lze studovat, a určitě dejte vědět,
když Vás něco zaujme.