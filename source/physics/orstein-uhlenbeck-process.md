# Poznámky k článku _Exact numerical simulation of the Ornstein-Uhlenbeck process and its integral_

Orsteinův-Uhlenbeckův proces.

Poprvé popsán v článku Langevina z roku 1908 pojednávajícím o Brownově pohybu.

V současné terminologii a nomenklatuře můžeme proces chápat jako  univarietní kontinuální (spojitý) Markovův proces , který se vyvíjí v čase $t \in \R^+$.


Různé ekvivalentní formulace UO procesu.

$$
X(t + \mathrm{d}x) = X(t)  - \frac{1}{\tau} X(t) \mathrm{d}t + \sqrt{c} N(t) \sqrt{\mathrm{d}t}
$$

$$
X(t + \mathrm{d}x) = X(t)  - \frac{1}{\tau} X(t) \mathrm{d}t + \sqrt{c} \mathrm{d}W(t)
$$

$$
X(t + \mathrm{d}x) = X(t)  - \frac{1}{\tau} X(t) \mathrm{d}t + \sqrt{c} \Gamma(t)
$$


$\tau$ je relaxační čas a $c$ je difůzní konstanta (kladné reálné hodnoty).

$dt \in [0, \epsilon]$, kde $\epsilon$ je dostatečně malé (blízké nule).

$N(t)$ je časově nekorelovaná normální náhodná proměnná s $\mu = 0$ a $\sigma^2 = 1$.

$dW(t)$ je časově nekorelovaná normální náhodná proměnná s $\mu = 0$ a $\sigma^2 = dt$. $W(t) \equiv W_t$ je označován Winereův proces.

$\Gamma(t)$ je Gaussovský bílý šum: je časově nekorelovaná normální náhodná proměnná s $\mu = 0$ a $\sigma^2 = 1/dt$.

Rovnost všech definic plyne z faktu, že pro $\mathcal{N}(\mu,\,\sigma^{2})\,$ platí
$$
\alpha + \beta \mathcal{N}(\mu,\sigma^2) = \mathcal{N}(\alpha + \beta \mu, \beta^2\sigma^2).
$$

Stochastická diferenciální rovnice.


Můžeme ho popsat také pomocí funkce hustoty pravděpodobnosti, která říka s jakou pravdšpodobností najdeme $x$ v čase $t$.

$P$ splňuje parciální diferenciální rovnic představující Fockerovu-Planckovu rovnic pro Orsteinův-Uhlenbeckův proces.

$$
\partial_t{P(x, t)} =  \frac{1}{\tau} \partial_x{x P(x, t)} + \frac{c}{2} \partial_{x^2}{P(x, t)}.
$$

Všechnuy zmíněné čtyři rovnice poskytují statisticky úplný popis časového vývoje Orsteinova-Uhlenbeckova procesu.

UO popisuje Brownův pohyb a Jonsonův šum.

Lze ukázta že pro komponentu rektilineární složky rychlosti Brownovské částice s hmotností $m$ a difuzivitou $D$ platí

$$
\tau = \frac{Dm}{kT},\quad c = \frac{2}{D}\left(\frac{kT}{m}\right)^2
$$

Také jako model obbvodu s rezistancí $R$ a samo induktancí $L$.

Nebo jako model barevného šumu.


Časový integrál OU X je definovaný jako proces Y splňující

$$
Y(t + dt) = Y(t) + X(t) dt.
$$

X a Y dohromady tvoří bivarietní Markovův proces .

V případě Brownova pohybu je

Keywords: Probability Density Function PDF, Cumulative Distribution Function CDF
