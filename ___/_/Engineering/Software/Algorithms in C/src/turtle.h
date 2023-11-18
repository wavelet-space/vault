#ifndef TURTLE_H
#define TURTLE_H

#include <stdarg.h>
#include <stdbool.h>
/*
  TURTLE STATES STACK
  ===================
  Zásobník je implementován jako jednosměrně vázaný (zřetězený) spojový seznam.

  Každá struktura,kterou vkládáme na zásobník musí obsahovat členskou proměnnou
  `prev` typu ukazatel na další prvek struktury. Ta se při vytváření struktury
  incializuje na hodnotu NULL a její správná hodnota se přenastaví při samotném
  vkládání na zásobník. Dále též členskou proměnnou `new` typu ukazatel na
  funkci, která inicializuje celou strukturu hodnotami.

  Stack_New
  ---------
  Vytvoří datovou strukturu zásobníku. Nastaví jeho velikost na hodnotu 0 a
  vrchol na hodnotu `NULL`. Vrací ukazatel na nově vytvořenou strukturu.

  Stack_Delete
  ------------
  Odstraní datovou struktury zásobníku samotnou a všechny prvky v ní uložené.

  Stack_Push
  ----------
  Vloží nový prvek na zásobník, tzn., že alokuje paměť pro nový prvek, nastaví
  vrchol zásobníku, tak, aby ukazoval na tento nový prvke. Dále proměnnou `prev`
  nového prvku nastaví na prvke, který byl předtím vrcholem zásobníku a nakonec
  inkrementuje velikost zásobníku.

  Stack_Pop
  ---------
  Odstraní prvek, který je aktuálním vrcholem zásobníku. Nastavý nový vrchol
  zásobníku na předcházející prvek a nakonec dekrementuje velikost zásobníku.

  TURTLE
  =======
  Struktura popisující želvu a uchovávající její zásobník stavů.

  TURTLE STATE
  ============
  Struktura uchovávající stav želvy v rámci jednoho kroku.
*/

typedef struct turtle_s turtle_t;
typedef struct state_s state_t;
typedef struct stack_s stack_t;

//-----------------------------------------------------------------------------
// STATE: Datová struktura uchovávající stav želvy:
//-----------------------------------------------------------------------------
typedef struct state_s {
    double x;               // x souřadnice želvy
    double y;               // y souřadnice želvy
    double a;               // alfa kanál
    struct state_s * prev;  // ukazatel na předchozí prvek (stav)
} state_t;

//-----------------------------------------------------------------------------
// STACK: Datová struktura zásobníku pro uchování stavů želvy:
//-----------------------------------------------------------------------------
typedef struct stack_s {
    state_t * top;          // vrchol zásobníku
    unsigned int size;      // počet prvků v zásobníku
} stack_t;

//-----------------------------------------------------------------------------
// TURTLE: Datová struktura popisující želvu:sjflsmlksdjfoierjflksflierj
//-----------------------------------------------------------------------------
typedef struct turtle_s {
    stack_t states;
    bool locked;
} turtle_t;

/* Ukazatel na funkci, která nastaví hodnoty struktury `state` (stav želvy):
 *---------------------------------------------------------------------------*/
typedef state_t * (* fun_pt) (double x, double y, double a);

//-----------------------------------------------------------------------------
// TURTLE STATE function declarations:
// ----------------------------------------------------------------------------

/**
 * Vytvoři nový stav a vrací ukazatel na tuto strukturu.
 * Poznámka: Strukturu odstraníme přímo pomocí knihovní funkce `free()`.
 * @param x x-position
 * @param y y-position
 * @prama a alpha
 */
extern state_t * state_new (double x, double y, double a);

//-----------------------------------------------------------------------------
//  TURTLE STATES STACK function declarations:
//-----------------------------------------------------------------------------

/**
 * Vytvoři nový stav a vrací ukazatel na tuto strukturu.
 * Poznámka: Strukturu odstraníme přímo pomocí knihovní funkce `free()`.
 */
extern stack_t * stack_new(void);

/**
 * Odstraní všechny prvky v zásobníku a nakonec zásobník samotný.
 * @param Ukazatel na zásobník
 */
extern void stack_delete(stack_t * const stack);

/**
 * Vloží prvek na zásobník.
 * @param stack Ukazatel na zásobník.
 * @param fun Ukazatel na funkci, která inicializuje strukturu
 *---------------------------------------------------------------------------*/
extern int stack_push(stack_t * const stack, fun_pt fun, ...);

/**
 * Vyjme prvek ze zásobníku.
 * @param stack Ukazatel na zásobník
 */
extern void stack_pop(stack_t * const stack);

#endif
