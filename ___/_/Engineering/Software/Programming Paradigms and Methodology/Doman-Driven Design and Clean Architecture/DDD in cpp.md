extends: default.liquid
title: C++ Domain Driven Design
date: 1 January 2017 20.34:00 +0200
tags: C++
---

Domain-Driven Design

Hodnotový objekt (value objects)

V C++ není tak komplikované vytvořit hodnotový objekt. Hodnotové objekty nemají
koncept identity ani životního cyklu. Ideálně jsou to tedy neměnitelné objekty (immutable) a pokud chceme změnit některou z jeho komponent, pak jednoduše vytvoříme nový objekt. Dva hodnotové objekty porovnáváme podle obsahu jeho složek. Pakliže jsou si všechny rovny, prohlásíme objekty za totožné.
Narozdíl od jazyků, které pracují primárně s referencemu, není v C++ tak obtížné hodnotový objekt definovat.

Manipulovat s hodnotovým objektem může mít nekdy smysl, jen v rámci jedné 
konkrétní entity. Často je proto definujeme v samoststátném hlavičkovém souboru
nebo přímo v souboru s entitou. Pokud jsou v samostatném hlavičkovém souboru
můžeme mu nastavit podmínku, aby ho bylo možné vložit jen do hlavičkového soubory s entitou. Tím si můžeme zajistit větší integritu.

Hodnotový objekt nemusí být jen přapravka, lae má své vlsatní metody definující íchování. To nám ppomáhá vytáhnout např. v případě osobního jména
jeho validaci mimo samostbnou entitu.
    
    class Person {
      public:
        Person(string firstName, string lastName) 
            fullName(firstName, lastName)
        {}

        void changeFirstName(string firstName) {
            fullName = FullName(firstName, lastName) 
        }

      private:
        FullName fullName; 
    }
