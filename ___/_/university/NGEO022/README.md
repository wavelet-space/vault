---
title: Numerické metody ve Fortranu
---

- http://geo.mff.cuni.cz/users/hanyk/NGEO022/index.htm
- Zkratka NR = Numerické recepty

# Lekce 1

a přikládám zdrojové soubory z první přednášky. Načrtli jsme matlabovský
skript pro řešení soustavy lineárních algebraických rovnic o velikosti
umožňující paralelizované řešení řádově v sekundách a pak jsme zpracovali
fortranské programy umožňující řešení podobným stylem, tedy pomocí
definovaného operátoru. Jako řešiče jsme použili dgaussj z Numerických
receptů a dgesv z LAPACKu. První z nich má dobře čitelný zdrojový soubor,
je však pomalý, druhý z nich je (v podání knihovny Intel MKL) vysoce
optimalizovaná černá skříňka, podle dosažené doby běhu totožná s řešičem v
MATLABu. Při velikostech soustavy 1000, resp. 10000 řádků jsme s prvním,
resp. druhým řešičem dosáhli řádově vteřinových běhů. Takové rozdíly v
době běhu se (při kubické časové náročnosti algoritmu) potkají snad jen v
té lineární algebře.

Za domácí úkol navrhuji nahradit gaussj řešičem ještě stále čitelným, ale
přece jen poněkud svižnějším, a to LU rozkladem podle Numerických receptů
kap. 2.3.

Numerické recepty - knihy i zdrojáky - jsem dočasně umístil na adresu
http://geo.mff.cuni.cz/~lh/zip/nr. Zdrojové soubory z přednášky přikládám
zde. Překladové řádky jsou v komentářích zdrojáků.

# Lekce 2

přikládám zdrojové soubory z druhé přednášky. Provedli jsme minulý
domácí úkol a v souboru testLinsolve_LU_NR.f90 do operátoru .linsolve.
vložili numerické recepty `ludcmp` a `lubksb` pro LU rozklad. Rychlost jsme
tak proti `gaussj` řádně zvýšili, ovšem stále zůstává hluboce pod LAPACKem.

Pak jsme pracovali s `testHilbert.f90`: hledali jsme inverzní Hilbertovu
matici, https://en.wikipedia.org/wiki/Hilbert_matrix. Jednak jsme doladili
`testHilbert.f90` a mNR.f tak, aby se změnou konstanty rp (ve třech
modulech) dala zvýšit přesnost na real(16), jednak jsme se zamýšleli nad
příčinou různých numerických výsledků z kódů různých překladačů při
real(8), viz níže, a jednak jsme hořce konstatovali, že náš operátor
.linsolve. by potřeboval zobecnění svého stávajícího rozhraní (matice A,
vektor b) na rozhraní (matice A, matice B). A to je jako domácí úkol na
vás.

Stran překladů, sázel jsem na rozdíly v interní přesnosti reálné aritmetiky, a numerická sumace prvků inverzních Hilbertových matic vrátila
shodné výsledky při překladu pomocí "gfortran" a "ifort -fp-model precise" (win: "ifort -fp:precise"). Vhodnou volbu pro nvfortran jsem nenašel,
vrací i nadále něco trochu jiného.

# Lekce 3

Vylovili jsme z NR (kap. 2.5) podprogram `mprove` pro iterační zpřesnění
řešení pomocí LU rozkladu, zkusili to bez valného úspěchu na Hilbertových maticích a nechali víře, že v praktických problémech to může pomoci. Pak jsme diskutovali číslo podmíněnosti obecně a problému Ax=b zvláště,
https://en.wikipedia.org/wiki/Condition_number, a prověřili jsme si jeho předpokládané hodnoty jednak pro Hilbertovy matice (Matlab: hilb), jednak pro matice náhodných čísel (Matlab: rand). Cestu k iteračnímu zpřesnění i číslu podmíněnosti přes LAPACK jsme zaměřili v extended solveru dgesvx
(dříve jsme použili _simple solver_ `dgesv`).

Pak jsme si prohlédli kapitolu NR 2.4 o pásových maticích, postěžovali jsme si na odlišné formáty ukládání pásových matic v NR a LAPACKu a
vyzkoušeli jsme obě knihovny. Na příkladu s 1 GB velkou maticí nám vyšla doba běhu 1:5 ve prospěch LAPACKu. Před nějakým časem vznikla na katedře
pomůcka pro užití LAPACKU skrz rozhraní NR, tu jsem také předvedl - "oběti" NR si tak mohou svižně ověřit, zda se jejich pásové matice neřeší v LAPACKu významně rychleji.

Zdrojové kódy k pásovým maticím: http://geo.mff.cuni.cz/~lh/NGEO022/sphinx-02 (dole).
