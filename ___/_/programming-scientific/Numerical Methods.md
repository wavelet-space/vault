---
topic: Numerické metody
---

-------------------------------------------------------------------------------
# Numerická interpolace a aproximace

### Interpolace

Lagrangeův (Newtonův) interpolační polynom
Hermitův interpolační polynom
Spline interpolace

### Aproximace

Diferenční formule
- Ekvidistantní uzly
- Richardsonova extrapolace

Kvadraturní formule
- Newton-Cotesovy vzorce
- Neurčité koeficienty

## Numerická derivace

## Numerická integrace

-------------------------------------------------------------------------------
# Numerické řešení soustav lineárních rovnic

Soustavu můžeme zapsat v maticovém tvaru.

$$
A . \vec{x} = \vec{b}
$$

Předpokládáme, že matice $A$ je regulární čtvercová matice tzn, že máme zaručeno řešení soustavy rovnic. U maticových numerickýh algoritmů, nás zajímá především rychlost a přesnost výpočtu.

Podle koeficientů rozeznáváme matice:

1. řídké (sparse), kdy většina koeficintů je nulových; často menšího řádu (pod 30); řešení statistických problémů.
2. husté (dense), kdy většina koeficitntů je nenulových; často velkého řádu (nad 100) řešení parciálních diferenciálních rovnic.

V dnešní době se řeši matice až řádu $10^6$.

## Podmíněnost soustavy

řešení soustavy můžeme naít pomocí inverní matice.


Násobíme soustavu $A \vec{x} = \vec{b}$ zleva iverzní maticí $A^{-1})$

$$
A^{-1} . A \vec{x} = \vec{b} \\
    E \vec{x} = A^{-1} \vec{b} \\
    \vec{x} = A^{-1} \vec{b}
$$

Pokud soustavu vyřešíme a zpětně dosadíme vektor řešení $x_c$ pak dostaneme sloupcový vektor

$$
    \vec{r} = \vec{b} - A \vec{x_c}
$$

který představuje chyby řešení a nazýváme ho *reziduum řešení* $x_c$.

Avšak malé reziduum nezaručuje malou chybu řešení. Soustavy takového typu nazýváme špatně podmíněné.

__Příklad__

$$
    2x + 6y = 8 \\
    2x + 6.00001y = 8.00001
$$
má řešení $x = 1, y = 1$, avšak soustava s malou změnou


$$
    2x + 6y = 8 \\
    2x + 6.00002y = 8.00002
$$
má řešení $x = 10, y = -2$!

## Zdroje chyb

1.
2.
3.

## Přehled metod

Metody pro řešení soustav lineárních rovnic rozdělujem na přímé a iterační.

### Přímé metody

Po konečném počtu kroků vedou k přesnému řešení, kdyby byl vůpočet prováděn bez zaokrouhlování (viz floating point aritmetika).
Přímým metodám také říkáme konečné metody. Jde o metody, které často používají při ručním počítání ze záklaních kurzů lineární algebry.

- Gaussova eliminační metoda (GEM), Gauss-Jordanova eliminační metoda (varianta GEM)
- LU rozklad (součin dolní a horní trojúhelníkové matice), QR rozklad
- Systém s třídiagonální maticí

#### Gaussova eliminační metoda

Upravujeme matici na horní trojúhelníkovou tj. do odstupňovaného tvaru pomocí ekvivalentních úprav, ze kterého lze
zpětným dosazením (substitucíé získat vektor řešení. Pokud se na diagonále objeví nulový prvek, pak lze zaměnit pořadí
řádků, tak abychom dostali nenulovou diagonálu.Pokud máme regulární matici soustavy, tak lze nenulovou diagonálu dostat vždy.
(Lze změnovat i sloupce, ale to pak musíme zaměnit i odpovídající prvky vektoru řešení.)

Algoritmus: viz Navara str. 116.

Výběr hlavního prvku (pivot): úplný výběr hlavniho prvku.
Výskyt nuly ošetřit umíme, ale pokud je hodnota prvku na diagonále blízká nule, pak rostou zaokrouhlovací chyby.

Teoreticky je GEM přesná metoda, avšak pokud pracujeme symbolicky ve tvaru zlomků. V případě práce s čísly s desetinnou tečkou (floating point arithmetic)
dochází ke kumulaci zaokrouhlovacích chyb.

#### Gaussova-Jordanova eliminační metoda

Pokud v eleiminaci horní trojúhelníkové matice budeme pokračovat, pak se můžeme zbavit prvků nad diagonálou a nakonec dělením každého řádku příslušným prvkem
dostaneme jednotkovou matici. Tím lze vypočítat např. inverzní matici a tato metoda známa ze základů lineární algebry se nazývá Gaussova-Jordanova. Je výpočetně
náročnější na počet kroků, takže se nepoužívá tak jako GEM, jen pro zmíněný výpočet inverzní matice.

#### LU rozklad

Řešení soustavy lineárních rovnic, můžeme vyjádřit také ve tvaru součinu dolní $L$ a horní $U$ trojúhelníkové matice. Tuto metodu nazýváme LU rozkladem.

$$
A = L . U
$$

$$
A \vec{x} = \vec{b}  \\
L . U \vec{x} = \vec{b}
$$

#### Determinant a inverzní matice

Determinant trojúhelníkové matice je součinem prvků na diagonále. Proto lze pro výpočet determinatu rozložit matici $A$ na $L . U$ a potom

$$
det A = det (L . U) = det L  det U = 1 . u_{1,1} . u_{2,2} . \cdots . u_{n,n}
$$

protože $L$ má na diagonále jedničky.

### Zpřesnění výsledků pomocí rezidua

viz Navara str. 121

### Iterační metody

Konstruujeme vektor, který konverguje k přesnému řešení. Potřebujeme tedy znalosti přesahující učivo lineární algebry.

Vektorové norma ${\lVert \dot \rVert}$ je zobrazení:

- maximová norma ${\lVert \vec{x} \rVert}_{\nathrm{R} = max \lvert x_i \rvert$
- součtová norma ${\lVert \vec{x} \rVert}_{\nathrm{S} = \sum \lvert x_i \rvert$
-

- Jacobiho metoda (JIM)
- Gauss-Seidlova metoda (GSM)
    - nutná podmínka
    - postačující podmínka
    - odhad největšího vlastního čísla matice (mocninná metoda)
- Superrelaxační metoda (SOR)

1. Bodově iterační metoda
2. Blokově iterační metoda

### Vlastní čísla a vektory matice

-------------------------------------------------------------------------------
# Diferenciální rovnice

- implicitní metoda
- explicitní metoda

## Numerické řešení obyčejné diferenciální rovnice

Formulace a řešitelnost

- Lineární
- Nelineární

Cauchyho počáteční úloha.
na daném reálném intervalu mám řešit diferenciální rovnici

$$
    y'(x) = f(x, y(x))
$$
$$
    F(x, y(x), y'(x)) = 0
$$

s počáteční podmínkou y_0 = y(x_0), kde $f$ je funce dvou reálných proměnných (pravá strana diferenciální rovnice) a
$y_0 \in R$.


Pokud by f nezávisela na y tj. $f(x, y(x)) = g(x) $ pak dostaneme výpočet určitého integrálu jako speciální případ řešení diferenciální rovnice

$$
    y'(x) = g(x)
$$
a tedy
$$
    y(x) = y_0 + \int g(x) \mathrm{d}x, \qquad x \in <x_0, x_n>
$$

Obyčejné diferenciální rovnice vyšších řádů lze vhodnou volbou pomocných proměnných převést na soustavy diferenciálních rovnic prvního řádu, které lze pak řešit pro jednu proměnnou, kde ale y je vektorová funkce reálného argumentu. její derivaci nahazujeme Jacobiánem atd.

Tvrzení: Existuje jedinečné řešení Cauchyho (čti [kóši-ho]) počáteční úlohy. Obecně tomu tak být nemusí.

> (__Lipschitzova podmínka__) Nechť funkce $f$ je definovaná a spojitá na intervalu $I \equiv <x_0, x_n>$ tj., $f(x, y)$ je určeno pro všechna $x \in I$ a všechna $y \in R$. Nechť
> $$
>    \exist L \in \R \forall <x_0, x_n> \forall y_1, y_2 \in \R : f(x, y1) - f(x, y2) \leq L |y1 -y2|
>$$
>pak existuje právě jedna reálná funkce $y$ na intervalu $<x_O , x_n>$, která je řešením úlohy s počáteční podmínkou.


Cauchyho úlohu lze přepsat na integrální tvar

$$
    y(x) = y_0 + \int_{x_0}^{x} f(t, y(t)) dt
$$


### Jednokrokové metody

U jednokrokové metody, počítáme nové hodnoty pouza na základě výsledku předchozího kroku řešení. Typickým zástupce je Runge-Kuttova metoda repsektive je to skupina metod.

#### Eulerova metoda a metoda Taylorova rozvoje

Eulerova (čti [ojler-ova]) metoda je nejjednodušší metodou pro numerické řešení obyčejné diferenciální rovnice s počáteční podmínkou (Euler, 1768). Také se nazývá  dopředná (forward) Eulerova metoda. Jde o explicitní metodu pro numerické integrování obyčejné diferenciální rovnice. Je to numerická procedura prvního řádu a nejjednodušší Runge-Kuttova metoda. Prvního řádu znamená, že lokální chyba (chyba při jednom kroku) je úměrná čtverci velikosti kroku globální chyba (chyba v daném čase) je  úměrná velikosti kroku. Často slouží jako základní metoda pro konstukci složitějších jako je např. prediktor-korektor.

__Odhad chyby__


První modifikace Eulerovy metody.

Druhá modifikace Eulerovy metody.

#### Rungova-Kuttova metoda 4. řádu.



### Vícekrokové metody


## Numerické řešení soustav obyčejných diferenciálních rovnic


## Numerické řešení parciální diferenciální rovnice

    hyperbolický $B^2 - AC > 0$
    parabolický  $B^2 - AC = 0$
    eliptický    $B^2 - AC < 0$

### Řešení PDE hyperbolického typu

### Řešení PDE parabolického typu

### Řešení PDE eliptické typu

---
???
---

---
title: Numerické metody
---

# Počítačová aritmetika

## Reprezentace čísel v počítači.

Nejmenší kladné číslo

    realmin

Největší kladné čílso

    realmax

Floating point number.


Zaokrouhlovací chyba a její narůstání
stabilita algoritmu

## Analýza chyb

## Podmíněnost problému

Číslo podmíněnosti matice.

## Přesnost výpočtu


## Schurův rozklad

__Věta__ (Schurova)
Pro libovolnou čtvercovu matici A existuje unitární matice U tak, že matice
$$
    R = U^*RU
$$
je horní trojúhelníková s vlastními čísli matice A na diagonále v libovolném předepsaném pořadí.
__Důkaz__


Rozklad $A = URU^*$ nazveme Scgurovým rozkladem matice A.
je základem pro výpočet vlastních čísel matic , funkcí matic aj. (QR algoritmus).

Lze Schurrův rozklad počítat konečným algoritmem?


Reálý Schurův rozklad.

Důsledky Schurovy věty.

## Nalezení spektra matice

Podobnostní transformace
Unitární transformace
Tvar transformované matice

# 3 Orotogonální transformace

1. Givensova rotace (otočení) vektoru v $\R$ a $\Complex$.
2. Householderova reflexe (zrcadlení) vektoru v $\R$ a $\Complex$.

# 4. Gram-Schmidtův proces

---
# Cvičení (opakování)
---

__Definice__ _Norma_ je funkcionál splňující následující podmínky:
- (pozitivní definitnost)
- (trojúhelníková nerovnost)
- (pozitivní homogenita)

Vektorová norma
- jedničková norma $||x||_1 \equiv \sum_{i=1}^n|x_i|$
- dvojková (euklidovská) norma $||x||_2 \equiv \sqrt{\sum_{i=1}^n|x_i|}$
- maximová norma $||x||_{\infty} \equiv max_{i=1 \cdots n}(|x_i|)$

Maticová norma
- Frobeniova norma $||A||_{F} \equiv \sqrt{\sum \sum a_{ij}}$

Pro uvedené normy nakreslíme jednotkové koule.

__Definice__ _Skalární součin_ je funkcionál.

__Matice__
- Transponovaná
- Hermitovsky sdružená
- Symetrická
- Hermitovská
- Singulární
- vlastní vektor $\vec{v}$ a vlastní číslo $\lambda$ pokud $A\vec{v} = \lambda \vec{v}$.
- Normální matice
- Unitární (Ortogonální) matice
- Singulární rozklad A = UDV*

Unitární (ortogonální) transformace

__Definice__ Generovaná norma je funkcionál

# Aproximace funkce

# Numerická derivace

# Numerická integrace

# Numerické řešení ODR


## Logistická rovnice

https://en.wikipedia.org/wiki/Logistic_function

S-křivka neboli sigmoid

$$
f(x) = \frac{L}{1 + e^{-k(x - x_0)}}
$$
kde $x_0$ je x-ová střední hodnota sigmoidu, $L$ je maximální hodnota a $k$ je rychlostní konstanta růstu neboli strmost křivky.

$x \in \R$ tj. $(-\infty, +\infty)$


Pro $L = 1$, $k = 1$ a $x_0 = 0$ dostáváme tzv standardní logistickou funkci.
$$
f(x) = \frac{1}{1 + e^{-1(x - 0)}} = \frac{1}{1 + e^{-x}} = \frac{1}{1 + \frac{1}{e^x}} = \frac{1}{\frac{e^x + 1}{e^x}} = \frac{e^x}{e^x + 1} = \frac{1}{2} + \frac{1}{2} \tanh(\frac{1}{2})
$$


Derivace standardní logistické funkce.





Logistická rovnice zjednodušené popisuje růst populace.

$$
\dot{y} = a t (1 - t)
$$

$y = y(t)$


Máme jeden volný paramter  $a$ a potřebujeme jednu počáteční podmínku $x_0 \equiv = x(t = 0)$.

Analytické řešení je

$$
    y(t) = \frac{x_0}{(1 - x0)e^{-a t} + x_0}
$$


# Numerciké řešení PDR


---
Analýza maticových metod
---

# Krylovovské prostory

Motivace Při numerických výpočtech často máme situaci, kdy matice je velká a řídká. Monoho metod počítá s celou maticí, prototo by se hodilo mít metodu jak zmenšit matici a přesto zachovat její charajteristiky. Takové metody existují a umožňují např. spočítat vlastní čísla menší matice a dokonce i iterativně zvětšovat dimenzi matice, pokud nejsme s výsledkem spokojeni.


Omezíme se na čtvercové regulární matice a požadujeme aby metoda umožnila matici:
1) lze iteračně zvetšovat dokud nejsem spokojen s aproximací
2) lze efektivně počítat, konstruovat např. přo řídké matice

Krylovovy prostory, jsou často používané podprostory.
Bude eme potřeboval, jak je to v numerice časté, jejich ortonormální bázi.

__Definice__ (Krylovovův podprostor)
Máme regulární čtvercové matice $A \in C^{n\times n}$ a nenulový vektor $\vec{v} \in C^n$ a číslo $m > 1$. Potom prostor $K_n(A, \vec{v}) = Span(\vec{v}, A\vec{v}, A^{m-1}\vec{v}}$ nazveme $m-tý$ Krylovův podprostor vzhledem k $A$ a $\vec{v}$.

Zajímá nás dimenze n-tého Krylova prostoru $ dim(K_m(A, v) <= m <= n>) $.

Označíme $\gamma$ nejmenší stupeň polynomu $A$.

__Definice__ (Minimální polynom)
Nechť A je čtvercová matice nad polem T. Nenulový polynom m(λ)∈T[λ] se nazývá minimální polynom matice A, jestliže to je anulující polynom matice A, který má nejmenší možný stupeň a je navíc normovaný (u nejvyšší mocniny λ má koeficient 1).


## Odkazy

- Záznam Krylovovské prostory https://su.mff.cuni.cz/file/home/hnetyn/AMV1/


# Maticový počet

Vektorový prostor
Homomorfismus
Podprostor vektorového prostoru


## Podobnost matic

Vlastní číslo matice
Vlastní vektor matice
Maticový polynom
Stopa matice
Determinant matice

Charakteristický polynom matice

Nalezněte charakteristický polynom matice tj. najdetě $Det(\lambda E - A)$.

$$
    \lambda E - A = \begin{pmatrix} \lambda & 0 \\ 0 & \lambda \end{pmatrix}
$$


Anulující polynom matice


Inverzní matice, invertovatelnost
Diagonální matice, diagonalizovatelnost
Ekvivalentní podobnost matice
Jordanova matice

## Lineární forma

## Bilineární forma



# Krylovovské prostory

Motivace Při numerických výpočtech často máme situaci, kdy matice je velká a řídká. Monoho metod počítá s celou maticí, prototo by se hodilo mít metodu jak zmenšit matici a přesto zachovat její charajteristiky. Takové metody existují a umožňují např. spočítat vlastní čísla menší matice a dokonce i iterativně zvětšovat dimenzi matice, pokud nejsme s výsledkem spokojeni.


Omezíme se na čtvercové regulární matice a požadujeme aby metoda umožnila matici:
1) lze iteračně zvetšovat dokud nejsem spokojen s aproximací
2) lze efektivně počítat, konstruovat např. přo řídké matice

Krylovovy prostory, jsou často používané podprostory.
Bude eme potřeboval, jak je to v numerice časté, jejich ortonormální bázi.

__Definice__ (Krylovovův podprostor)
Máme regulární čtvercové matice $A \in C^{n\times n}$ a nenulový vektor $\vec{v} \in C^n$ a číslo $m > 1$. Potom prostor $K_n(A, \vec{v}) = Span(\vec{v}, A\vec{v}, A^{m-1}\vec{v}}$ nazveme $m-tý$ Krylovův podprostor vzhledem k $A$ a $\vec{v}$.

Zajímá nás dimenze n-tého Krylova prostoru $ dim(K_m(A, v) <= m <= n>) $.

Označíme $\gamma$ nejmenší stupeň polynomu $A$.

__Definice__ (Minimální polynom)
Nechť A je čtvercová matice nad polem T. Nenulový polynom m(λ)∈T[λ] se nazývá minimální polynom matice A, jestliže to je anulující polynom matice A, který má nejmenší možný stupeň a je navíc normovaný (u nejvyšší mocniny λ má koeficient 1).



## Odkazy

- Záznam Krylovovské prostory https://su.mff.cuni.cz/file/home/hnetyn/AMV1/


# Maticový počet

Vektorový prostor
Homomorfismus
Podprostor vektorového prostoru


## Podobnost matic

Vlastní číslo matice
Vlastní vektor matice
Maticový polynom
Stopa matice
Determinant matice

Charakteristický polynom matice

Nalezněte charakteristický polynom matice tj. najdetě $Det(\lambda E - A)$.

$$
    \lambda E - A = \begin{pmatrix} \lambda & 0 \\ 0 & \lambda \end{pmatrix}
$$




Anulující polynom matice





Inverzní matice, invertovatelnost
Diagonální matice, diagonalizovatelnost
Ekvivalentní podobnost matice
Jordanova matice

## Lineární forma

## Bilineární forma



---

Einsteinova sumační konvence: Pokud se někde ve výrazu vyskytují dva stejné indexy, pak se přes ně sčítá.

