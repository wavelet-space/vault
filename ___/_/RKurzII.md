---

---

# Moderní statistické metody

Celý tento kurz je o vytváření statistickýh modelů. To znamená, že máme vstupní data, o kterých se cheme něco dozvědět a musíme vybrat správné metody a statistikcý model pro jich zpracování.

# Moderní statistické metody I

Viz poznámky v NOTES


# Moderní statistické metody II


Kovariáta -- kontinuální proměnná, co spřesňuje ANOVA.
 např. velikost rostliny před pokusem reakace růstu na světlo.
 např. velikost živočicha při narození před pokusem růstu v závislosti na potravě.


# Lineární Model v R

- Nulový model y ~ 1

- one way ANOVA
  kontinuální je vysvětlovaná, kategoriální je vysvětlující

- two-way ANOVA

- ANCOVA


- nested ANOVA

Maximální reziduály jsou reziduály nulového modelu.
Signifikance našeho modelu je vždy testována proti nulovému modelu.

```bash
lm     y~x
aov    analýza variance
glm    zobecněný lineární model
gam
lme
nls
nlme
loess
tree
```

## Zjednodušování modelu

- Zahrneme vysvětlující porměnn, které mají z teorie vztah k vysvětlované proměnné.
  Do modelu není dobré nasekat velké množství proměnných. Počet vysvětlujících proměmných by neměl byl větší než 1/10 N (včetně interakcí) maximálně 1/3.

- Complete (full) model, reduced model, minimal (adequate) model.
  Plný odel bude vsyvětlovat vždy nejvíce variability, bude vždy lepší než ořezaný model. Ale ořezání modelu nemusí uškodit a tím si zjednodušíme práci.

- Korelace mezi vysvětlujícími modely

- Occamova břitva. Pokud se od sebe neliší, tzn. že signifikance není horší, pak bereme jednodušší model. Parsimonie: dvě věci (jedna jednodušší a druhá složitější), bereme jednodušší (lex parsimoniae).

## ANOVA (ANalysis Of VAriance)

trojná interakce A:B:C

    M1 y ~ A + B + C + A:B + A:C + B:C + A:B:C

Ostraníme trojnou interakci a porovnáme s M1

    M2 y ~ M1 - A:B:C

Odstraníme dvojné interakce a provnáváme s M2.

    M3 y ~ M2 - A:B
    M4 y ~ M2 - B:C
    M5 y ~ M2 - B:C

Který model je lepší?

- Model s n-1 parametry je lepší než s n parametry, pokud
- Model s k-1 vysvětlujícími proměnnými je lemší než s k proměnnými
- Model s lineární závislostí je lepší než každý jiný nelineární (polynomiální) model.
- Model bez interakcí lepší než s interakcemi.

Do plného modelu není dobrá dávat vše, co jsme měřili.
Je důležité opravdu promyslet základní plný model a dávat tam proměné, o kterých věříme, že
opravdu ovlivňují model. Plný model, musíme vložit vedle zjednodušeného modelu do článku, abychom
mohli zkontrolovat, co jsou prediktory.

### Problém kolinearity

Může nás potkat kolinearita tzn. že zjistíme, že nějaké na pohled nezávislé proměnné, jsou nějak závislé. Např. výška a tloušťka stromu bude korelovat/záviset. Např. nekoreluje plocha jednoho listu. Musíme zkontrolovat korelaci prediktorů.

Obecně by korelační koeficient (Pearsonův) měl být menší než 0.8.

Také se dá spočítat Variance Interaction Factor VIF.


Nicméně korelace dvou proměnných není kauzální příčina: tzn. otázka zní zapříčiňuje `A -> B` nebo obráceně?

Přikald: Ptáci -- latituda (temperátní) nebo kde je na glóbu. Je to složená kompozitní proměnná.... zahrnuje různé aspekty.

### Univariantní modely.

Uděláme s každou proměnonu zvlášť, naší závislou proměnnou s každým prediktorem zvlášť.


## R ko

- `update(model)`
- `add1`
- `drop(model)` (Mallows Cp)
- `step(model)` (AIC)

Alternativně Akaike information criterion (AIC) Bayezovksý přístup
- https://en.wikipedia.org/wiki/Akaike_information_criterion

    A + B + A:B
spočteme
    A = AIC
    B = AIC
    A + B + A:B
    A + B

## ANOVA opakování

0. Nulový model je celkový průměr
1. Suma čtverců odchylek od celkového průměru
2. Suma čtverců odchylek of průměru od jednotlivé úrovně faktoru

## REGRESE opakování

0. Nulový model není vztah mezi x a y
1. Hledáme regresní přímku se sklonem, takovým aby suma odchylek byla co nejmenší.
   deviance modelu

## ANCOVA

### Princip

Kombinuje ANOVA a REGRESE
Co je kovariáta?
Proč zahrnovat kovariátu do modelu?
Snižujeme chyby, statistická kontrola chyb => snížení reziduální variance => přesnější odhas parametrů modelu.

## Postup

Příklad:
- vysvětlovaná proměnná je *velikost snůšky* u husy
- faktory: druh potravy
- kovariáta: počáteční hmotnost


Zajímá nás:
- ovlivňuje potrava velikost snůšky?
- ovlivňuje počáteční hmotnost velikost snůšky?

Z grafu směrnic velikost snůšky vs hmotnost zjistíme, signifikance. Pokud jsou sklony paraelní, pak mi stačí jen jeden parametr (intercepty jsou sice rozdílné).

Nebo stačí jeden sklon a jeden intercept, což většinou nenastává.

viz slide.

### Čtení F-statistiky

```bash
Call:
lm(formula = Growth ~ Genotype * Photoperiod)

Residuals:
    Min      1Q  Median      3Q     Max
-0.5429 -0.1786  0.0000  0.1143  0.6286

Coefficients:
                      Estimate Std. Error t value Pr(>|t|)
(Intercept)            1.28571    0.48865   2.631  0.02193 *
GenotypeB              0.42857    0.69105   0.620  0.54674
GenotypeC             -0.42857    0.69105  -0.620  0.54674
GenotypeD             -0.85714    0.69105  -1.240  0.23855
GenotypeE              0.71429    0.69105   1.034  0.32169
GenotypeF             -1.57143    0.69105  -2.274  0.04213 *
Photoperiod            0.11429    0.03030   3.771  0.00267 **
GenotypeB:Photoperiod  0.07143    0.04286   1.667  0.12145
GenotypeC:Photoperiod -0.07143    0.04286  -1.667  0.12145
GenotypeD:Photoperiod -0.04286    0.04286  -1.000  0.33705
GenotypeE:Photoperiod -0.11429    0.04286  -2.667  0.02054 *
GenotypeF:Photoperiod  0.02143    0.04286   0.500  0.62612
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 0.3586 on 12 degrees of freedom
Multiple R-squared:  0.9611,	Adjusted R-squared:  0.9254
F-statistic: 26.93 on 11 and 12 DF,  p-value: 9.445e-07
```

### Z transformace = centrování

Tam kde je průkazná interakce.

- stadardizce centrování
- scale(A)

Viz https://besjournals.onlinelibrary.wiley.com/doi/10.1111/j.2041-210X.2010.00012.x
(Schielzeth 2010)

# AIC (Akaite Importance Criterion)

Nespoléhá na frekvencionistickou analýzu, v zásadě je to Bayessovský přístup, kdy vybíráme nejlepší model ze všechhkandidátních modelů.

AIC je měřítko kvaity modelu. Horší komplexnější model je penalizován tzn. že čím menší AIC, tím lepší model.

AIC můžeme pro každý model spočítat

nulový model, který nevysvětluje varianci.

Počet pozorování / počet pozorovaných parametrů v modelu < 40 (n/K <40>), tak použijeme AICc.

Tolik modelů, kolik je kombinací vysvětlujících proměnných a nulový model.

## Váha modelu $w_i$ (Akaike Importance Weight)

Váha modelu říká , pravděpodonost, že model je nejlepší a kolikrát je pravděpodobnější než jiný model. na škále 0-1 (0-100%)

Z vah a efektů...


### DÚ Pomocí balíku MuMIn, spočteme AIC; počítání barva.

## Kritika a předpoklady lineárních modelů


Co platí pro REGRESI a ANOVA, to platí i pro ANCOVU.

Můžeme udělat test, jestli jsou reziduály normálně rozložené.

Shapirův test normality reziduálů.

Proč je důležité testovat normálnost reziduálů namísto vstupních parametrů?
Když pomícháme samce a samice a váhu, pak budeme mít dva hrby => není nromální rozložení.
Ale reziduály z modelu normální budou.

## Požadavky

### Náhodnost výberu

data musí být sbíraná náhodně, nesmí to být klastry. Pokud nejsou, zpravidla celý pokus musíme opakovat. Pokud víme, jaké jsou tam klastry, dá se s tím něco dělt viz mixované modely.

### Homogenita variance

Často je stav kdy variance závisí na průměru a rozložení normální.
Umí si stím poradit různé transformace.
Data mohou být rozně zešikmená, špičata, placataá.

Co s tím? Transfromace? Jen vysvětlující proměnné? I vysvětlované?
typické případy kdy vysvětlovaní proměnná je reprezentována počty či poměry

Hodnoty predikované modelem nesmí být menší než 0 -- negativní počet je nesmysl.

Řešení!!!!

# Zobecněné lineární modely GLMs (glims)

Mají tři základní parametry.

- Chybová struktura
- Lineární prediktor
- Link funkci

- Distribuce je sešikmená a heteroskedatsická
- platy-lepto kurtické
- chyby striktně ohraničené

Chybová struktura v GLM

- Poisson -> proměnné představují počty
- Binomial -> proměnné představují poměry
- Negativně binomické - . počty
- Gamma - lognormální regrese, kontinuální kladné proměnné, váha, čas.
- Exponenciální - přežívání

 ## Lineární prediktor $\eta$ (eta)

$$
    n_i = \sum x_{ij} \beta_i
$$

## Link funkce

## Kanonická link funkce

$$
\eta = 1 (\mu) = \mu
$$


Maximální věrohodnost (maximal likelihood)

- jinak než u normálního rozložení


Null deviance $NE$

## Normální modely

- Normální: závislá proměnná je kontinuální

## Poissonovský model

- Závislá proměnná je diskrétní (celá čisla): počet uhynulých živočichů, počet
- Četnosti: víme koikrát jev nastal
- Logaritmická spojovací funkce


Overdisperze....


Konfidenční interval je cca 2 * SE (standard error).

# Binomický  model

- Prvádíme na poměrných datech, poměry počtů (frekvence)
- Chybová struktura:
- Rozdíl mezi Poissonem a binomickým... víme jak často spadají experimentální data do určité kategories a jak často spadají do jiné kategorie

Proč nepoužívat procenta jako závislou proměnnou

- procenta... ztrácíme informaci, jaký byl celkový počet
- tady je na to pamatováno, tzn. z jak velkého poolu počítáme.
-


Modelování vyžaduje specifikaci binomického jmenovatele

    cbind(počet+, počet-) kontroluje velikost vzorku (binomický jmenovatel)

Počet úspěchů ě počet neusúěchů = binomický jmenovatel

    LOGISTICKˇA REGRESE

Logitová spojovací funkce.

# Bernoulliho rozložení

Bernoulliho rozložení je speciálním případěm binomického rozložení, s tím, že pravdepodobností proměnná může nabývat pouze hodnoty 0 nebo 1 (ANO/NE).

---


# Zobecněné lineární modely
...


## Odkazy

- https://cs.wikipedia.org/wiki/Korelace
- https://cs.wikipedia.org/wiki/Anal%C3%BDza_rozptylu
- https://en.wikipedia.org/wiki/Foundations_of_statistics
- https://bookdown.org/ndphillips/YaRrr/comparing-regression-models-with-anova.html
- https://en.wikipedia.org/wiki/Akaike_information_criterion
- https://en.wikipedia.org/wiki/Likelihood-ratio_test
- https://en.wikipedia.org/wiki/Overdispersion
- https://cs.wikipedia.org/wiki/Binomick%C3%A9_rozd%C4%9Blen%C3%AD
- https://cs.wikipedia.org/wiki/Poissonovo_rozd%C4%9Blen%C3%AD