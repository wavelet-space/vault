# Thermodynamics for Geology

Gas of interests for geology

H20, H2, O2

CO2, C0, CH4

SO2, SO3, H2S

HCl, HF

N2, NH3

Noble gases: He, Ar, Ne, Xe, Kr, Rn


P-V-T

# Kinetic theory of gases

## Ideal gas

Equation of state for idela gas

$$
    PV = NRT
$$

where $T$ is the temperature, $R$ is ideal gass constant

## Compressibility factor Z

The ideal gas law provides a reference state. For nonideal gases we can define a compresibility factor $Z$ which give as

$$
    Z = \frac{PV}{RT}
$$

For and ideal gas the chart P vs Z give us a line parallel with x axis (P), startion at $Z = 1$.


Důvod proč se reálné plyny chovají odlišně od ideálního jsou molekulární interakce. reálné molekuly se totiž srážejí a mohou mezi nimi vznikat přitažlivé (attaractive) respektive odpudivé (repuslsive) síly.

Při malých tlacích a vysookých teplotách, vzdálenost mezi molekulami narůstá => malé množství interakcí mezi molekulami => chování reálného plynu se blíží ideálnímu chování.

Při velkých tlacích a malých teplotách, vzdálenost mezi molekulami klesá => velké množství  interakcí mezi moekulami => chování reálného plynu se velmi odlišuje od ideálního chování.

Proto se zavádí korekce chování reálného plynu od chování ideálního.


Taková korekce je započítána např do van der Waalsovy rovnice stavového chování reálného plynu.

$$
P = \frac{RT}{V - b} - \frac{a}{V^2}
$$

nebo

Redlich-Kwong rovnice, oblíbené geochemiky

$$
P = \frac{RT}{V - b'} - \frac{a}{ \sqrt{T} V (V + b)}
$$


Nicméně nepotřebujeme pro každý reálný plyn stavovou rovnici, protože teorém korespondujícíh stavů říká, že všechny plyny následují stejnou EOS, pokud P a T jsou normalizovány vzhledem k jejich kritickým hodnotám.

### Kritická hodnota

Pokud je reálný plyn dostatečně stlačen, pak zkapalní.


## Cvičení

Spočitej parametry a a b pro H2O z van der Waals a Redlich-Kwong rovnice.

Spočítej kompresibilní faktor pro H2O.


Spočítej redukovaný kompresibilní faktor $Z_r$ pro 1 mol H2O při teplotě $T = 1000\,C$ a tlaku $P = 1\,kbar$.

## Termodynamické zákony

## 0. Zákon

Zavádí stavovou funkci (intenzivní veličina) teplota $T$ systému.
  Dvě tělesa A, B každé v termální rovnováze se třetím tělesem C, jsou také v termální rovnováze.

$$
T_\mathrm{A} = f(P_\mathrm{A}, V_\mathrm{A}) \\
T_\mathrm{B} = f(P_\mathrm{B}, V_\mathrm{B}) \\
T_\mathrm{C} = f(P_\mathrm{C}, V_\mathrm{C}) \\

(T_\mathrm{A} = T_\mathrm{C} \land T_\mathrm{B} = T_\mathrm{C}) \implies T_\mathrm{A} = T_\mathrm{B}
$$

## 1. Zákon

Zavádí stavovou funkci vnitřní energie $U$ systému a dává do souvislot teplo $Q$ a práci $W$.
Teplo a práce jsou formy energie, které vstupují nebo vystupují do/ze systému. protože jsou to formy energie, mají obě stejné jednotky a to $Joule = kg^2 s^{-2}$.

Práce může být různého druhu např. objemová práce $W_\mathrm{volume}$ též $PV$ práce.

Komprese: dodáváme energii => kladné znaménko práce
Dekomrese: odebíráme energii => záporné znaménko práce

Teplo (Heat) je forma energie, která proudí do/ze systému a způsobuje změnu teploty. neplést si teplo a teplotu. Teplo je substance, teplota stav systému.

Teplo nemusí být ale dodáno externím zdrojem, samotný systém může produkovat teplo např. chemickou reakcí. Chemické reakce, které produkují teplo nazýváme exotermní a naopak, chemické reakce spotřebovávájící teplo jsou endotermní. Většina reakcí je exotermních.

$$
\Delta = Q + W
$$

kde W zarnuje všechny formy práce tj. $W = W_\mathrm{chemical} + W_\mathrm{mechanical}$

$$
\mathrm{d}U = \delta Q + \delta W
$$

Připomínáme si:

- Pokud Q vstupuje do systému a W je konána na systému => kladné znaménko. Mnemo: Systém něco přidáváme!
- Pokud Q vystupuje do systému a W je konána systémem => záporné znaménko. Mnemo: Systém něco odebíráme!

Nicméně, jde o znaménkovou konvenci, lze ji zcela obrátit!

__Pamatuj:__ Sourounding (Environment), System, T, U, +W, +Q, -W, -Q (znaménková konvence).

## 2. Zákon

Cyklický proces = systém se vrátí do původního stavu.
Do původního stavu se vrací systém, nikoliv to nutně platí pro okolí.

Termodynamické stroje.




Zavádí stavovou funkci entropie $S$ systému.

$$
\frac{\mathrm{d}Q_\mathrm{reversible}}{T} = \mathrm{d}S, \quad closed\,system \\

\therefore \\

\mathrm{d}Q_\mathrm{reversible} = T\mathrm{d}S
$$

$$
\frac{\mathrm{d}Q_\mathrm{reversible}}{T} + \sum_i S_i \mathrm{d}n_i = \mathrm{d}S, \quad open\,system
$$

Kombinací 1. a 2. zákona pro uzavřený systém dostaneme

$$
\mathrm{d}U \leq \mathrm{d}Q_\mathrm{reversible} + \mathrm{d}W_\mathrm{volume}, \quad [P] \\
\mathrm{d}U = T\mathrm{d}S + p\mathrm{d}V
$$


Izotermální expanze ideálního plynu tj. za stálé teploty z V1 na V2.
viz tabulka slide 37


### Entaplie

Za stálého tlaku se nám hodí definovat veličinu zvanou entalpie $H$.


$$
\mathrm{d}H = T\mathrm{d}S + V\mathrm{d}P
$$


Entalpie měří množství tepla, ketré je uvolněno nebo spotřebováno systémem např. při reakci při stálém tlaku (většina reakcí v běžných podmínkách). Pokud je $H < 0$ pak je exotermní (odebíráme teplo) a pokud je $H > 0$ pak je endotermní (přidáváme teplo).

Tedy měřením teploty v kalorimetru, získáme hodnotu entalpie, která říká něco o teplu a druhu reakce.
Přesněji řečeno získáme změnu entalpie, protože měříme změnu teploty tj. $\delta H$.

$$
\Delta H^0
$$


### Entalpie chemické reakce

Entalpie chemické reakce je entalpie produktů mínu entalpie reaktatntů.


$$
    H_r = H_\mathrm{products} - H_\mathrm{reactants}
$$

Zapsáno sumačně

$$
\delta H_r = \sum v_i H_{f,i}^0
$$

kde $v_i$ je stochiometrický koeficient látky $i$. Pro produkty má kladné znaménko a pro reaktanty záporné.

Prvky mají entalpii standardního stavu $H^0 = 0$.


__Příklad__

$$
    H2(g) + \frac{1}{2}O2(g) -> H20(l) \quad H_{f, 298}^0 = -285.83\,J mol^-1
$$


$$
    H2(g) + \frac{1}{2}O2(g) -> H20(g) \quad H_{r, 298}^0 = -241.81\,J mol^-1
$$

Všimněme si formační vs reakční entalpie ($f$ vs $r$), protože pára není nejstabilnější fáze pro H2O za danných podmínek.


__Příklad__

Spočtěte přírůstek entalpie pro ..


## Gibbsova volná energie

Je energie dostupná za stálého tlaku.


$$
G = H - TS \qaud [P]
$$


## Helmholzova volná energie

Je energie dostupná za stálého objemu.


$$
A = U - TS \qaud [V]
$$


## 3. Zákon

Stavová funkce dává do souvislosti stavové proměnné a popisuje rovnovážný stav systému. Stavová funkce má obecně tvar...

$$
f(...)  = 0
$$

např. pro ideální plyn nám stačí tři proměnné

$$
f(P, V, T, n) = PV - nRT = 0
$$


# Fázová rovnováha v jednoduchém systému

Phase

Specie

Component: rozlišueme single, binary, ternary komponentní systém.

$$
    C = N - R
$$

Počet komponent $C$ je roven počtu cehmických sepcií $N$ mínus počet nezávislých chemických reakcí.

$$
H2 +\frac{1}{2}02 -> H20 \\

C = 3 - 1 = 2
$$


Mějme systém složený z $H2O$ a $Al2O3$ kam zakreslíme $AlOOH$ a $Al(OH)3$?

Máme tedy čtyři fáze, musíme si uvědomit, kolik nezávislých reakcí pro ně máme.

## Gibbsovo fázové pravidlo


# Termodynamika směsí

Solution: homogenní fáze, kdy je rozpuštěna jedna subsatnce v druhé, respektive je smícháme. Pokud je jedné stějně jako druhé nemůžeme stanovit, která je rozpuštěna v které.


Molární zlomek: $\sum_i x_i = 1$ je poměr počtu molů dané látky vs celkový počet molů $N$.

## Raoltův zákon

$$
P_\mathrm{total} = P_\mathrm{A} + P_\mathrm{B}  = \sum P_i \implies  P_i = X_i P_\mathrm{total}
$$


Raoltův zákon udáva parciální tlak $i$ té kompenenty směsi.

Platí ale jen pro ideální směsi, např. směsi ideálních nebo řídkých plynů, kdy zandbávám interakce.


## Henriho zákon

Parciální tlak rozpuštěné komponenty je roven

$$
P_i = h X_i
$$

kde $h$ je henryho konstanta.


# Parciální molární Gibbsova energie neboli chemický potenciál

$$
\mu_i = \left( \frac{ \partial G }{\partial n_i} \right)_{P, T, n_i}
$$


## Gibbs-Duhem vztah


## Entropie míšení

## Entalpie míšení



---


# Otázky

Je správně za W dosadit dvě složky tj. chemickou a mechanoskou práci? Mechanická práce je např. objemová? Jaké jsou další? Chemická práce je také nějakých druhů?


Píše že fáze je liquid, gas, solid, ale to není zcela pravda. Různé skupenství implikuje různé fáze, ale ne naopak.


# Zápisky od Kolorenč

---

# 1. přednáška

## Stav termodynamické rovnováhy

Makroskopický systém je ve stavu termodynamické rovnováhy, pokud se žádné makroskopické veličiny v čase nemění.

Postulujeme, že každý izolovaný systém dospěje po dostatečně dlouhém čase do stavu, ve kterém se se již makrsokopicky nemění a tento stav je určen jen vnitřními faktory, nikoliv dříve působícími vnějšími vlivy. Z toho vyplývá, že ve stavu termodynamické rovnováhy si  systém si nepamatuje svoji historii. Př. Pokud hodíme kostku ledu do vody a necháme ji dostatečně dlouho v místnosti, pak kostka ledu roztaje a pokud nevíme, že tam předtím byla, nemůžeme rozhodnout jak do tohoto stavu přišla, jestli prostým dolitím vody, nebo roztátím kostky ledu.

Fyzikální systémy ale obecně paměť mají, jejich vývoj je odezva na minulou interakci s okolím. Tady již předjímáme, že vývoj systému směrem k rovnováze je nevratný proces a to je v kontrastu s makroskopyckými rovnicemi, které můžeme obrátit a vývoj s ním.

Rovnice klasické i kvantové mechaniky je vratný, můžeme se vrátit v čase, tyto rovnice jsou deterministické.

## Popis termodynamického rovnovážného stavu

Popisujeme ho makroskopickými veličinami, které můžeme měřit -- stavové veličiny.

skalárními: P, V, N, vektorovými: $\vec{E}$, $\vec P$, $\vec{H}$, $\vec{M}$ a dále $\sigma$ (povrchové napětí), vizkozita, el. vodivost.

Teplotu $T$ a vnitřní energii $U$  nyní intuitivně chápeme, ale budeme je teprve definovat.

Ne všechny stavovové velčiny (pro daný systém) jsou nezávislé, tj. ze znalosti několika málo, mlžeme ostatní odvodit a to buď ze znalosti
stavových rovnic pro daný systém nebo z obecných vztahů, které termodynamika poskytne.

=> nezávislé stavovové veličiny == stavové proměnné, definují stavový prostor (podbně jako fázový v klasické mechanice).

- Každý bod stavového prostoru odpovídá jednomu možnému rovnovážnému stavu.
- Volba nezávislých stavových veličin je do značné míry libovolná respektive závisí na studovaném systému.

Např. pro plyn budeme studovat PV stavový prostor a konstruovat tzv. PV diagram.

Stavová rovnice pro ideální plyn (tzn. neinteragující částice) $p V = N k_\mathrm{B} T$, který ale platí jen pro tento konkrétní systém!

Termodynamiku nezájíma, mikroskopická podstata studovaného systému, ani nám nedokáže nic o jejho struktuře říci. Nedokáže ani říci, jak mají vypadata stavové rovnice, to musí přijít zvenčí: z experimentu, pozorování.

- Ostatní veličiny jsou závislé a budeme je nazývat jako stavové funkce, tj. funkce na stavovém prostoru. Např. pro PV bude závislá T.

Počet nezávislých stavových proměnných definuje dimenzi stavového prostoru např. PV stavový prostor má dimenzi 2.

- Závisí na charakteru systému: otevřený, uzavřený...
- Závisí na typu a přesnosti dostupných měření.

Př. jednokomponentní plyn: PV, TV, TP ... podle volby se nám může lépe či hůře řešit daný problém.

Pokud si vyberu T a V jako nezávislé stavové veličiny, pak bude P stavová (závislá) funkce


$$
    P = P(V,T) = \frac{N k_\mathrm{B} T}{V}
$$

Kolik je obecně nezávislých veličin, je těžké říci. Záleží na charakteru systému (otevřený, uzavřený) tj. jak interaguje s okolím. Také dělení na mikroskopické a makroskopické je problematické, někdy můžou být pod rozlišovací schopností pro daný systém.

## Charakter termodynamických veličin

Obecně všechny TD veličiny dělíme na extenzivní a intenzivní. Extenzivní jsou závislé na velikosti systému a intenzivní nikoliv.

- Exenzivní: úměrné velikosti systému (počet částic, hmostnosti); jsou aditivní pro nezávislé podsystémy. tj. rozdělíme li systém na podsystémy, pak suma dáva celek.
  N, V, U, Magnetizace, Polarizace
- Intezivní: nezávislé na velikosti systému (množství látky); mají stejnou hodnotu v celém systému.

Mimo rovnováhu nejsou intenzivní definovány např. pokud budeme mít nádobu s plynem, ve které budeme točit vrtulí, nemůžeme tlak jednoznačně určit.

## Vzájemná termodynamická rovnováha

Dva makroskopické systémy jsou v termodynamické rovnováze, pokud se při kontaktu nemění ani jedna z makroskopických (pozorovatelných)termodynamickýc veličin.

Nultý terodynamický princip: vztah vzájemné rovnováhy je tranzitivní.

## Empirická teplota

Na nultém termodynamickém principu je založen teploměr. Pokud mám objekt zvaný teploměr $\mathrm{A}$ a přiložím ho (dám ho do kontaktu) k objektu $\mathrm{B}$, za předpokladu, že $\mathrm{A}$ neovlivní $\mathrm{B}$ (např. teploměr $\mathrm{A}$ je velmi malý v porovnání s $\mathrm{B}$) a následně přiložím $\mathrm{A}$ k $\mathrm{C}$, tak pokud nedojde k žádné makroskopické změně (nezmění se poloha rtuti v $\mathrm{A}$), potom $\mathrm{B}$ je také v rovnováze s $\mathrm{C}$.

## Příklad stavové rovnice

Mějme jednokomponentní plyn popsaný dvojící nezávislých stavových proměnných $\{P, V\}$. jestliže $\mathrm{A}$ a $\mathrm{B}$ jsou v rovnováze, potom  $P_\mathrm{A}$, $V_\mathrm{A}$, $P_\mathrm{B}$, $V_\mathrm{B}$ nemohou být nezávislé $\implies $ existuje vztah

$$
A  \sim B \implies F_\mathrm{AB}(P_\mathrm{A}, V_\mathrm{A}, P_\mathrm{B}, V_\mathrm{B}) = 0 \implies P_\mathrm{A} = f_{AB}(V_\mathrm{A}, P_\mathrm{B}, V_\mathrm{B})
$$

a analogicky

$$
\mathrm{A} \sim C \implies F_{AB}(P_\mathrm{A}, V_\mathrm{A}, P_\mathrm{C}, V_\mathrm{C}) = 0 \implies P_\mathrm{A} = f_{AB}(V_\mathrm{A}, P_\mathrm{C}, V_\mathrm{C})
$$

a z tranzitivnosti

$$
\mathrm{A} \sim B \implies F_\mathrm{BC}(P_\mathrm{B}, V_\mathrm{B}, P_\mathrm{C}, V_\mathrm{C}) = 0

$$

dostáváme implikaci

$$
    f_\mathrm{AB}() = f_\mathrm{AC}() \implies F_\mathrm{BC} = 0
$$

dále viz přednáška

Termická stavová rovnice $\theta$ je __empirická teplota__.

Empirická teplota je charakteristika rovnovážného vztahu.

Není to vlastnost mikroskopických částic látky.

Srovnáme s kinetickou teoriíí plynů $T \sim \bar{E}_\mathrm{k}$

Teplota je empirická, protože je určena vlastnostmi konkrétní látky, kterou použijeme jako teploměr a její konkrétní charakteristikou (výška sloupce/objem).

Postup lze opakovat pro složitější systémy charakterizované pomocí $k$ proměnných $X_1, \ldosts,X_k$ a dostaneme opět $\theta = \phi(X_1,\ldots,X_k$.

Izoterma: nadpolocha ve stavovém prostoru.

Teplota je intenzivní veličina: systém můžeme (myšleně) dělit na podsystémy (opet ale makroskopické), které jsou v rovnováze a tedy teplota je stejná ve všech bodem systému.

> Nultý princip implikuje existenci teploty, jako charakteristiky rovnovážného stavu a také  stavové rovnice jako funkčního stavu mezi stavovými parametry (proměnnými).

## Stavové rovnice konkrétních systémů

### Ideální plyn

Model ideálního plynu, chápeme jako soubor neinteragujících částic, kdy stav je popsán pomocí $Z$ proměnných. To znamená, že částice berem jako bodové a vzájemně nijak nekolidují, a jen se odráží od stěn nádoby.

Omezení: Neumí popsat zkapalnění plynu, je však vhodný pro teoretické úvahy. Při nízkých tlacích se reálné plyny blíží ideálnímu chování.

### van der Waalsův

Bereme v úvahu již konečnou velikost části a jejich vzájemné interakce.

- b > 0 efekt (oprava/korekce) konečné velikost částic a tedy odpudivost (repulze).
- a > 0 efekt (oprava/korekce) přitažlivosti částic (atrakce).

První lepší popis reálného chování plynu, přesto se již dnes nepoužívá, ale je vhodné ho studovat z pedagogických důvodů.

Pokles tlaku je úměrný ...

### Viriálový rozvoj

obecnější popis odchylek reálného od chování ideálního plynu.

# První termodynamický zákon

__Stěna__
1) adiabatická <-> izolovaný systém =>
2) diatermální <-> uzavřený systém => vyměňuje teplo, ale ne hmotu
3) permeabilní <-> otevřený systém => vyměňuje teplp i hmotu

Obecně je změna stavu systému vyvolána interakcí s okolím.
Vlastnost stěny definuje možný způsob interakce systému s okolím.

## Práce

Experiment ukazuje, že adiabatické systémy existují, tzn., že je možné systém uzavřít a měnit jeho stav pouze přesně kontrolovaným způsobem tj. působěním práce (velmi ze tomu blíží Dewarova láhev).

Práci definujeme jako interakci s okolím, kterou lze spojit s kontrolovatelnou změnou nějaké měřitelné makroskopické extenzivní (většinou) veličiny.

Víme však, že systém interaguje s okolím i jinak: led se rozpustí, pokud dostatečně dlouho počkáme, přestože, že byl zpočátku s tekutionou v rovnováze (zdánlivě).


> Práce vykonaná na izolovaném systému, během přechodu z rovnovážného stavu $\mathrm{A}$ do stavu $\mathrm{B}$, nezávisí na způsobu, jakým byla vykonána.

To implikuje existenci odpovídající stavové veličiny zvané vnitřní energie, kterou definujeme jako

$$
    \Delta U = U(\mathrm{B}) - U(\mathrm{A}) = W^\mathrm{ad}
$$

Podobně jako potenciální energie, je vnitřní energie definována vůči nějakéme základnímu (referenčnímu) stavu.

$$
    u(A) - U(0) = W_{0\mathrm{A}}^\mathrm{ad}
$$

Adiabatická práce $W^\mathrm{ad}$

> Požadavek na U je, aby v celém stavovém prostoru bylo možné přejít mezi dvěma libovolnými body {A, B} alespoň v jednom směru pouze pomocí působení práce.

Možné to může být jen v jednom směru! Například v Dewarově nádobě mícháme vrtulkou, zvyšuje se teplota a roste tlak. Míchání je adiabatická práce, dodáváme do systému energii.
