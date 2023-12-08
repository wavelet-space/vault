# C++ Interview Questions/Answers

*A simle questions and clear answers for job interviews,*
&hellip; and some random facts and rules how to program in C++.

[[Czech]]

- Každá třída má konstruktor a destruktor, buď námi definovaný, nebo výchozí (*default*).

- Co je konstruktor?
- Co je destruktor?
- Proč označit destruktor jako veřejný a virtuální?
- Co je oprátor přiřazení?

- Co je operátor rovnosti a kdy ho použít/přetížit?
  - pokud přetížíme operátor rovnosti, co operátor nerovnosti?

- Co je *move semantics*?

- Které druhy ukazatelů existují?
- raw
- unique
- shared

- Jak implementujete vlastní kontejner jako je vektor?
  - mrkni do knihy *Rozumíme C++ - Andrew Koenig, Barbara E. Moo*

- Co je pravidlo tří?
  *Pravidlo tří* říká, pokud potřebujej definovat kopírovací konstruktor, operátor přiřazení nebo destruktor, pak bude zřejmě třeba definovat všechny tři členské funkce.

- Co je pravidlo pěti?
  Je rozšířením pravidla tří pro nové verze C++ &hellip;.

- Co je pravidlo nuly?
  &hellip;

- <https://en.cppreference.com/w/cpp/language/rule_of_three>

## std::unique_ptr(), std::make_unique()

## std::move()
