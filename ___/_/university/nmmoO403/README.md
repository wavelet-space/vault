---
title: Mechanika kontinua
---

V tomto předmětu se naučíme používat knihovnu FENICS pro řešení problémů machaniky kontinua pomocí
metody konečných prvků. Probereme:

- Poissonovu respektive Laplacovu rovnici (homogenní Poissonova rovnice)

# Lekce 3: Řešení rovnice tepla

Laplacova rovnice

$$
- \nabla u = f
$$

$$
u = 0 \,on\, \Gamma
$$

$$
\frac{\partial u}{\partial v} = g \,on\, \Gamma
$$

## Silné řešení

$$
u \in C^2 (\Omega) and C(\bar \Omega)
$$


## Slabé řešení

$$
a(u, v) = \int_{\Omega} \nabla u \, \nabla v \, dx
$$

$$
l(v) = \int_{\Omega} f\,v\,dx + \int_{\Gamma}
$$

$$
u \in V = {v \in W^{1,2}(\Omega), v \,on\, \Gamma_D = 0}
$$

## Numerické řešení

Silné řešení je například použití konečných diferencí, kdy diskretizujeme levou stranu.

Slabým řešením je použití konečných prvků.
Dostaneme vektor diferenciálních rovnic.

Máme čtvercovou doménu, kterou rozdělíme na simplexy (trojúhelníky).
Proč trojúhelníky? Protože mapování na bázovou funkci je lineární.
Bázová funkce je polynom (např. Lagrange Finite Elements nejnižšího stupně.)

Ve Fenicsu místo Lagrange používaji CG jako continuous Ghalerkin.


```python

from dolfin import Expression, FiniteElement, TrialFunction, TestFunction

def boundary(x, on_boundary):
    return on_boundary

f = Expression("...")
P4 = FiniteElement()
uex = Expression("...", element = P4, domain = mesh)

bc = DirichletBC(V, 0.0, boundary)

# Přípravíme variační formulaci.

u = TrialFunction(V)
v = TestFucntion(V)
a = inner(grad(u), grad(v)) * dx
L = f * v * dx

# Definujeme funkci a vyřešíme variační problém.

uh = Function(V)

with Timer("Problem solver") as t:
    solve(a == L, uh, bc)
    time = t.elapsed()[0]

print(f"Done in {time}"s)

# Spočteme chybu aproximovaného řešení.

with Time("Error evaluation") as _:
    err_L2 = ...
    e_L2 = ...
    err_H1 = ...
    e_H1 = ...
```

Můžeme samozřejmě řešit i na jiné než čtvercové doméně. Můžeme definovat doménu pomocí polygonu (uzavřená množina bodů), nebo pomocí geometrických operací např. odečíst od jedné čtvercové domény jinou doménu.



## Vizualizace

Pro vizualizaci použijeme program ParaView.

    module add paraview
    paraview


Běh úlohy na klusteru

    srun -p express3 -n 1 python your_script.py


## Lekce 2

- https://gitlab.karlin.mff.cuni.cz/cluster
- Připojíme Paraview přes SSH lokální na cluster.
- https://gitlab.karlin.mff.cuni.cz/cluster/helpdesk/-/wikis/paraview-remote-ssh


## Odkazy

- https://fenicsproject.org/
- The mechanics and thermodynamics of continua, Cambridge University Press