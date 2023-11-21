# Vstupně výstupní komunikace

## Přerušení

Přerušení je způsob jak procesoru dáváme najevo, že je nutné reagovat na nějakou událost.
Takovým přerušením je např. stisk klávesy, příchod dat, nebo hodinový signál.

- U procesoru 8080 existuje pro přerušení vstup INT.
- Na konci každé instrukce procesor testuje stav vstupu INT.
- Přerušení může být programátorem zakázáno (speciální instrukce ???).
- ...

## Čísličový počítač

procesor, paměť, periferie

## Mikropočítač jednočipový

Pokud jsou processor, paměť a periferie v jednom pouzdře, říkáme mu jednočip, mikrořadič, mikrokontrolér = microcontroller.
Vznikly z mikroprocesosu, sloučením těchto částí do jedné.  např. přidaly ROM a malou RAM a několik periferií: např. paralelní, sériové rozharní, čítače/časovače; poté i s EPROM a nakonec FLASH (dnes nejrozšířenější).

## AVR

8bitový s prvky RISC architektury.

## PIC


## Hardwarové a softwarové přerušení

SW INT(8) interupt

```shell
IRQ0 ... časovač
IRQ1 ... klávesnice
...
```

Pro přerušení existuje hardwarový obvod  8259A

Máme 8bytový registr , kam přichází přerušení.

Interupt Request register IRR, Interupt Mask Register

```
IRR [ | | | | | | | | ]
IMM [ | | | | | | | | ]
```

Obvod 8259 byl ve své době složitější než samotný procesoru 8080.

## Polovodiče

## Odkazy


- https://knihy.nic.cz/files/edice/hradla_volty_jednocipy.pdf


== Hardwarové a softwarové přerušení

SW INT(8) interupt


```   
IRQ0 ... časovač
IRQ1 ... klávesnice
```

Pro přerušení existuje hardwarový obvod  8259A
Máme 8bytový registr , kam přichází přerušení.
Interupt Request register IRR, Interupt Mask Register


```
IRR [| | | |]
````