
# Statistické metody I (2. část)

V celém kurzu budeme pracovat s normálně a nezávisle rozdělenou náhodnou proměnnou.

## Charakteristika souboru

průměr, medián, rozptyl, variance

var()

sd standard error of deviation (variance)

se standard error of mean

## Intervaly spolehlivosti

Interval spolehlivosti ukauje, že ve výberu bude X% náhodně vybných souborů z nekonečna možností obsahovat opravdový průměr.
Dokážu z variability jednoho výběru odhadnout průměr.

95% CI (confidence interval)


Pokud udělám dva výbery a nepřekrývají se jim konfidenční intrevaly, pak vím, že se liší.

Pro normální rozdělení je konfidenční interval symetrický kolem průměru.


## Základní statistické testy v R

Testování hypotéz

|                 | Nulová hypotéza platí          | Nulová hypotéza neplatí
|-----------------|--------------------------------|------------------------------
| Zamítáme $H_0$  | Type I Error                   | Correct Outcome
| Přijímáme $H_0$ | Correct Outcome, True Negative | Type II Error, False Negative


Mějme dva náhodné výbery, nulová hypotéza může znít, že se dva soubory od sebe neliší.
Nulovou hypotézu buď přijímáme nebo zamítáme. Pro statistický test budeme odhadovat míru pravděpodobnosti
$\alpha$ což značí chybu prvního druhu, tzn. že je 5% šance, že H_0 zamítáme chybně.


Type II error ukazuje sílu testu tzn. jak velký musí být výběr, abychom mohli o populaci něco říci.


## Parsimonie

William z Occamu (1287-1347), ořezávání. Pokud jsou dvě řešení stejně dobrá, bereme jednodušší.

Ve statistice můžeme pracovat s kontinuálními, kategoriální (faktorové) a uspořádáně kategoriální (ordered faktor) proměnných.

Např. u kategoriálních samec, samice jsou dvě kategorie, u  které nerozlišujeme pořadí. U velikosti malý, velky, však očekáváme možnost seřazení.


## Máme jeden výběr

Zajímá nás jaké je průměrná hodnota.

Liší se hodnota od předpokladu?

Jaká je nejistota ve stnovení průměru?

Jsou hodnoty normálně rozloženy

Co s odlehlými hodnotami (outliers) -- chyba měření, nebo skutečný outlier

    V R ku na box plotu jsou outliers označeny tečkou.

Je zde seriální autokorelace
    Meříme např. výšku dětí ve škole, ale měříme dvojčata, toto je bráno jako závislé pozorování. Řešením je započítat jen jedno dítě.


## Porovnání dvou variancí: Fisherův F-test

Dá se spočítat v ruce, dělíme mezi sebou variance: větší/menší 


## Porovnání dvou půměrů dvou výberů: Studentův T-test

##  Shapirů-Wilcox test normality

    > shapiro.test(xn)

	Shapiro-Wilk normality test

    data:  xn
    W = 0.78503, p-value = 3.539e-05


## Korelace dou proměnných Pearson, Spearman 

## 


## Rozložení dat

Normální rozložení $N = (\mu, \sigma)$  neboli Gaussovo rozložení. Jde o symetrickou zvonovou křivky, která má střed na průměrné hodnotě.

Rozložení může být zešikmené (skewed), nebo platikurtické (placatost)


    Skew, Skewness


## Homoscedasticita = konstantnost variance


## Studentovo t rozdělení


$$
    t = \frac{m - \mu}{s }
$$


Pokud uděláme t. sttaistiku, pak nás zajímá jejéí rozložení. Pro two-tailed test.


# Párový t-test

# Znaménkový test

Nemůžeme změřit rozdíl, alevidíme dva typy vůsledků.
Máme plavce, kterým měříme čas před tréninkem a po tréninku. Sledujeme jestli trénování vedlo ke zlepšení plavce.
Použijeme binomický test.

## $\Chi^2$ test a $\Chi^2$ statistika

Chi kvadrát by měl měčit s nezávislými proměnnými.
modré oči světlé vlasy

Yatesova korekce ... radši ji nepoužíváme, ale musíme ji vypnout

Je li očekávané frekvence menší než 5 pak se nemá používat chi kvadrát.


## G test


## Fisherův exaktní test


## Korelační test mezi dvěma proměnnými

Příklad: Diversita horních a dolních toků na několika potocích.

Pearson's product momnet correlation

U regrese máme jasně dané co je závíslá a nezávislá proměnná a nelze prohaozvat proměnné.
Naopak u korelace je na pořadí nezávisí.


    cor(x, y)
    cor(y, x)
    # Pokud nemají data stejnou varianci nebo nejsou styejně rozložené
    cor.test(x, y, method="s") # Spearman's Rank

    # Ručne
    r = cov(x, y) / odm(s_x^, s_y^2)


## Data dredging andbe korelační matice


V lineárních modelech nechceme mít korelační koeficient větší než řekněme 0.7. Čím menší tím lepší.



# Statistické modely a modelování

- Lineární vs nelineární
- jednorozměrné vs vícerozměrné
- proměnné závislé a nezávislé
- proměnné diskrétní spojíte

Budeme pracovat jen s 1D lineárními modely tzn. že máme jednu nezávislou a jednu závislou proměnou a očekáváme mezi nimi lineární závislost.


V Rku použijeme statistické funkce.


## Lineární model

- systematická a náhodná složka
- regrese, ANOVA, ANCOVA
- y = a + bx_i + e_i, kde e_i je náhodná složka

U základních metod očekávám, že e je normálně a nezávisle rozdělená náhodná proměnná.

e_i je reziduál, to nelze modelem vysvětlit.


Měříme li hmotnost samců a samic můžeme nám vyjít bimodální rozdělení, protože pro samice, vyjde jeden kopeček.

Testujeme jestli mezi reziduály je normální rozložení.

    lm
    aov
    glm
    gam
    lme
    nls
    nlme
    loess
    tree

### Lineární regrese

Ordinary Least Square Regression

x je daná nezávislá proměnná, y je závisla s chybami.

    y = a + bx

Cílem je odhadnout parmatery $a$ a $b$ a jejich standardní chyby.
Odhadujeme jaká část rozptylu je odelem vysvětlen, určuje koeficinet determinance r^2 [0, 1]
Použijeme standardní chyby k odhadu


První krok: explorace dat

- Mají data sestupný nebo vzestupný trend.

pro stanovení a, b použíjeme metodu nejmenších čtvěrců.

Přímka se bude točít kolem střední hodnoty \bar x a \bar y. 
Takto proloži samozřejmě mžeme i data, která nemají žádnou závislost.

Nulový model.

$$
    SST = \sum (x - \bar y)^2
    SSE = min(\sum (y - a * bx)^2
    SSR = 
    SST = SSE + SSR
$$

Lineární regrese: numerický příklad.
Famous five: \suma X, \suma x^2, \suma Y, \sum y^2, \suma XY

ANOVA Tabulka linární regrese

jednoparametrová-jednoocasá t-statistika


Co nevysvětlíme modelem, tomu říkáme deviance.


Pro regresi si můžeme vyplotoit:

Normal-QQ
Residuals vs Levarage
Scale-Location
Residuals vs Fitted

Fitted values, Theoretical quantiles


Otestujeme normalitu residuálů.

    shapiro.test(resid(model))


## ANOVA

Princip:

Pro výpočet potřebujeme znát tři typu sum čtverců.

- SST celková suma čtverců: 
- SSE reziduální suma čtverců:  SUMA(pozorování - průměr skupiny)^2
- SSA = SST - SSE

Kdy je rozdíl průměrů mezi jednotlivými úrovněmi faktoru podstatný?

Dostaneme ANOVA tabulku

