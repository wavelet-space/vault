---
title: Teorie obvodů
---

# 1. Elektromagnetické jevy v modelu obvodu

## Jev

Jev je časová změna stavu hmotného objektu. V elektronice nás zajímá např. okamžitý výkon $p$ jako časová změna tj. derivace práce (energie).

$$
p(t) = \frac{\mathrm{d}w}{\mathrm{d}t} \equiv \dot{w}.
$$

jev může být periodický, tj. opakuje se v cyklech, pak nás zajímá čast periody $T$ (primární kvantita) nebo četnost period za sekundu tj. frekvence(kmitočet) $ f = \frac{1}{T}$ (sekundární kavantita) nebo kruhová frekvence (kmitočet; úhlová rychlost kruhového pohyby)  $\omega = 2 \pi f$ (terciární kvantita).

- $f$ používáme pro periodické jevy
- $\omega$ používáme pro harmonické jevy

## Spádová vs průtoková veličina

## Definice elektrického napětí a proudu

Okamžité napětí $$ u(t) = \frac{ \mathrm{d}w}{ \mathrm{q} } $$

Okamžitý proud $$ i(t) = \frac{\mathrm{d}q}{\mathrm{t}} $$

## Stav naprázdno a nakrátko

- nakrátko: $ u(t) = 0 $
- naprázdno: $ i(t) = 0 $

Pokud je $u(t) \neq 0$ a $ i(t) \neq 0 $, potom můžeme napsat

(a) $ u(t) = \frac{p(t)}{i(t)} $ a  (b) $ i(t) = \frac{p(t)}{u(t)} $

napětí a produ jsou duální veličiny tz., že jedna neexsituje bez druhé, proto i výrazy (a) a (b) jsou duální.


## Časové funkce

### Skalární součin časové funkce

Práce je integrálem okamžitého výkonu za daný čas.

$$
W(J) = \int_a^b \mathrm{d}t\,p(t)
$$

### Norma časové funkce

$$
\lim \frac{W(J)}{J} = \frac{W(n . T)}{n . T} = \frac{T}{T} = \frac{1}{T} \int_0^T u(t) . i(t) \mathrm{d}t
$$

Norma

$$

||v|| = \sqrt{\int_a^b v^2 \mathrm{d}t} = \sqrt{(v, v)}

$$

Skalární součin i norma funkce jsou reálná čísla, norma navíc nezáporné reálné číslo.



### (ú)Činný výkon

$$
P_P = \frac{(u, i)}{T} = \frac{1}{T}\int_0^T u(t) \, i(t) \mathrm{dt}.
$$

- průběh napětí $U$
- průběh proudu $I$
- průběh skalárního součinu $(u, i)$
- průběh podílu $(u, i)/ J$
- průběh výkonu $P_P$, $P$, $\lambda_P$

# 2. Lineární obvod v harmonickém ustáleném stavu
