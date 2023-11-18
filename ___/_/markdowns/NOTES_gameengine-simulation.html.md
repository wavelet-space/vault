<!DOCTYPE html>
<head>
  <meta charset="utf8">
  <link rel="stylesheet" type="text/css" href="./assets/main.css">
  <title></title>
</head>
<body>

<div id="container">

<header>HEADER</header>

<!-- CONTENT -->
<div id="main" class="left-content">
# Game Simulation Engine Design

## Resources

- http://behindthepixels.io/projects/

## Collision Detection

The collision detection of objects in virtual world. 

Why we detect collision?
How we detect the collision?

A bounding box is a cuboid, or in 2-D a rectangle, containing the object

### Axis Aligned Bounding Box (AABB)


## How to implement the 2D engine from scratch

Basics

define the Vector2, Matrix2, Matrix3
define shapes: Polygon, Line, Polyline (open/closed), Rectangle Circle, Ellipse + Diplay Styles: color, fill, stroke
define bounded box (rectangle)
define transformation in 2D world space: translation, rotation, scaling (dilatation)
define Scene (2D World) as collection of objects.
define Canvas 2D Renderer
define Layers...front/back position.

Physiscs

Collision detection:

Additional
define


# RBAC vs ABAC

Porovnání RBAC (Role Based Access Control) a ABAC (Attribute Based Access Control)

### DAC Discretionary Access Control 

### MAC Mandatory Access Control

## RBAC

### Kdy použít RBAC?

## ABAC

### Kdy použít ABAC?

## Souhrn

# Simulace -- Kolize objektů

Collision detection in interactive 3D environments

## Úvod

## Metody ve 2D

### Axis Aligned Bounding Box (AABB)

### Circle

## Metody ve 3D

### Oriented Boundig Box (OBB)

## Odazy

- https://developer.mozilla.org/kab/docs/Games/Techniques/2D_collision_detection


# Simulační (herní) smyčka

Simulační smyčka je blok programu, který uvede při spustí  program v cyklu.
Abychom program spustili v cyklu stačí nám k tomu v nejjednodušším případě nekonečný cyklus
v podobě *C/C++/JS* `for` nebo `while` smyčky.

```c
while (true) {
    // code
}
```

```c
for (;;) {
    //  code 
}
```

První varianta je pro potřeby simulační (herní) smyčky výhodnější, protože umožňuje před každým vstupem, namísto nynějšího výrazu `true` testovat nějakou hodnotu např. jestli uživatel žádá o ukončení.

Jak rychle však tato smyčka probíhá respektive kolik cyklů za jednu sekundu proběhne? 

Tuto hodnotu můžeme nazývat FPS (Frames Pers Second), protože ve své podstatě nám říká kolik snímků za sukundu jsme schopni zobrazit. Tato rychlost záleží na rychlosti vašeho procesoru, kolik procesorového času bylo našemu procesu přiděleno (tasking/OS scheduler) a samozřejmě na tomm jak dlouho probíhájí funkce `handle/update/render`. Zřejmě už je vidět, že proměnný frame-rate bude způsobovat problémy.

Na pomalých strojích bude simulace/hra běžet pomaleji a naopak na rychlejších strojích rychleji. V případě neinteraktivní simulace by nám toto vyhovovalo, čím rychlejší máme PC, tím rychleji budem emít výsledek. V případě interaktivních her máme však problém, protože čas simulovaného světa je nechynhronní.


__Smyčka běžící tak rychle, jak jen to jde.__

`SIMULATION_SHOULD_STOP`

```c++
while (not SIMULATION_SHOULD_STOP) 
{
    handle(event) // Handle the system/user events.
    update(state) // Update the state of the world
    render(state) // Render the state of the world.
}
```

- handle()

- update()

- render() není závslá na frame-rate. protože grafika není funkcí času.

__Pokud je běh moc rychlý, zpomal.__


Blbý je, že toto sice funguje, ale jen pokud je náš program rychlejší než očekávaný frame rate.
Navíc sleep blokuje.

```c++
while (true) 
{
    const auto start_time_ms = get_current_time_ms();
    
    handle();
    update();
    render();

    const auto elapsed_time_ms = get_current_time_ms() - start_time_ms;
    const auto should_sleep_ms = start_time_ms + MS_PER_FRAME - elapsed_time_ms; 

    sleep(should_sleep_ms)
}
```


__Fluidní/Variabilní časový krok__


```c++

std::size_t initial_time_ms = 0;
std::size_t current_time_ms = 0;
std::size_t elapsed_time_ms = 0;

while (true) 
{
    current_time_ms = get_current_time_ms();
    elapsed_time_ms = current_time_ms - initial_time_ms;
    
    handle();
    update(elapsed_time_ms);
    render();

    initial_time_ms = current_time_ms;
}

= Simulation

== Discrete Event Simutalion

Produkujeme Event objekt a pošleme ho na EventBus
Zpracujeme Event a změníme stavové proměnné. 
Každá událost má definovánu časový úsek, který byl třeba k jejímu zpracování.

Event               Time Points [s]
SimulationStarted   0    
CustomerArrival     10
CustomerService     300
CustomerDepart      12
SimulationStopped

Událost SimulationStarted inicializuje počet čekajících zázkazníků na nulu.
Událost CustomerArrival navýší počet čekajících zákazníků o jedna.

Simulation_Clock

Simulace je tedy sekvence stavů, které jsou generovány událostmi.

  Simulation_Event -> Current_State -> Future_State 
  Start S_0 -> S_1 -> S_2 -> S3 -> ... -> S_n Stop


## Zdroje

https://gamedev.stackexchange.com/questions/132831/what-is-the-point-of-update-independent-rendering-in-a-game-loop
</div>
<!-- /CONTENT -->

<div class="right-content"> 
  <div id="toc"></div>
</div>


</div> <!-- /container -->

<script type="text/javascript" defer src="./assets/markjax.min.js"></script>
<script type="text/javascript" defer src="./assets/main.js"></script>
</body>
</html>