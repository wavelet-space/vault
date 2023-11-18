# Paralelní maticové výpočty

- https://gitlab.karlin.mff.cuni.cz/nmnv532/
- https://en.wikipedia.org/wiki/InfiniBand
- Kniha https://www2.karlin.mff.cuni.cz/~mirektuma/ps/pp.pdf
- Slidy https://www2.karlin.mff.cuni.cz/~mirektuma/ps/ppslides.pdf
- BLAS https://www.gnu.org/software/gsl/doc/html/blas.html
- (BLAS 1, BLAS 2, BLAS 3) 

## Základy

Přihlášení pomocí `ssh`

     ssh landa@r3d3.karlin.mff.cuni.cz

Kopírování pomocí `scp`.

    scp .\lecture3-master.zip landa@r3d3.karlin.mff.cuni.cz:nmnv532

    tar -xvf .\lecture3-master.zip <-- funguje na Windows
    unzip lecture3-master.zip      <-- funguje na Linux

## Lekce 08-03-2022

## MPI

### Základní způsoby komunikace v MPI

- Broadcast = pošlu všem stejný balík dat
- Scatter = mám vektor dat a každému procesu pošlu část
- Gather = mám části dat a pošklu jednomu nodu vše jako vektor (opak scatter)
- All Gather =
- Reduce (opak broadcast)


Import modulu Python + knihovny

    module add python-env/sci+num+sym+ga+petsc

__Spuštění skriptu `task0_parallel_timing.py`__

    srun -p express3 -u -n 4 python task0_parallel_timing.py

    Is mpi.wtime global? 0
    MPI Wtime tick is 1e-09
    the now is [1646735598.2506351, 1646735598.250266, 1646735598.2506328, 1646735598.2502675]
    accuracy of time(): +- 1.84e-04
    the now is [1646735598.251097, 1646735598.251097, 1646735598.251097, 1646735598.251097]
    accuracy of datetime: +- 0.00e+00
    the now is [5232155.459022701, 5232155.459022598, 5232155.459023129, 5232155.459022413]
    accuracy of mpi wtime: +- 2.63e-07

__Spuštení skriptu `task0_comm_latency.py`__

    srun -p express3 -u -n 2 python task0_comm_latency.py
    send=[1.93119049e-05], recv=[5.05447388e-05], start=[-3.24249268e-05], end=[-1.1920929e-06]

__Spuštění skriptu `task1_pingpong.py`__

    srun -p express3 -u -n 2 python task1_pingpong.py

__Spuštění skriptu `task2_bcast_reduce.py`__

    srun -p express3 -u -n 2 python task2_bcast_reduce.py
    bcasting data 8
    rank 0 has data:  8
    rank 1 has data:  8
    rank 0 has sum:  16
    rank 1 has sum:  None

__Spuštění skriptu `task3_scater_gather.py`__

    srun -p express3 -u -n 2 python task3_scater_gather.py
    scattering data [1, 2]
    rank 0 has data:  1
    rank 0 after gather:  [1, 2]
    rank 1 has data:  2
    rank 1 after gather:  None

    srun -p express3 -u -n 4 python task3_scater_gather.py
    scattering data [1, 2, 9, 64]
    rank 0 has data:  1
    rank 1 has data:  2
    rank 1 after gather:  None
    rank 2 has data:  9
    rank 2 after gather:  None
    rank 3 has data:  64
    rank 3 after gather:  None
    rank 0 after gather:  [1, 2, 9, 64]

# Lekce 15-03-2022

## Snižovaní latence

### Případ 4

Snížení atence můžeme dosáhnout prefechem 1) instrukcí nebo 2) dat.

- prostorová lokalita (_spatial locality_)
- časová lokalita (_temporal locality_)
- pravidelnost procesovaných dat (_regurality_)

## Vektorizace

- Něco se vektorizuje dobře a něco špatně. Někdy stačí obrátit smyčku.
- Matice z konečných prvků či diferencí jsou řídké => spousta problémů musí řešit řídké matice jako soubor řídkých vektorů.

### Wheeel method

### Loop unrolling

AXPY operace BLAS
Po nějakém počtu kroků se smyčka explicitně rozepíše jako posloupnost kroků.

### Loop fusion

Spojení smyček do jedné.

### Asociativní transformace

## Standardizace na vyšší úrovni LAPACK

LAPACK založen na dřívějších balících LINPACK (1979) a EISPACK (1976), které daly základ MATLABu.

- Řešení systému lineárních rovnic.
- Řešení problému vlastních čísel.
- Řešení nejmenších čtverců předmodmíněných systémů.

__Příklad:__ LU faktorizace

Rozložime matici $A$ na součin dolní $L$ a horní $U$ trojúhelníkové matice.

$$
A = L * U
$$

__Příklad:__ QR (ortogonální) faktorizace

Givensova rotace, Hausholderova dimenze

## Násobení matice-matice

$$
C = C + A * B
$$

$$
for i = 1,\ldots, n do
  for j = 1,\ldots,n do
    for k = 1,\ldots\n do
      C_{ij} = C_{ij} + A_{ik} + B_{kj}
    end do ! k
  end do ! j
end do !i
$$

Přepíšeme jako blokové násobení pomocí dvou smyček

$$
for j = 1\ldots,N do
  for k = 1,\ldots,n do
    C^{(j)} = C^{(j)} + A_{*k}B^{(j)}(k,*)
  end k
end j 
$$


## 3. Multiprocesorový model

...

## Granuralita

- coarse (hrubé)
- medium (střední)
- fine (jemné)


## Problem decomposition

- Rozložení problému je způsob jak rozdělit výpočet mezi jednotlivé výpočetní jednotky (jak dosáhnout potřebné granularity).
    1. task based
    2. data based

- Load balancing

TASK based
1. rekurzivní rozdělení
2. explorativní rozdělení
3. spekulativní rozdělení

DATA based
- statické a dynamické rozdělění dat

## Cvičení: Paralelní násobení hustých matic

Programování MPO a komunikátory; paralelní násobení vektorů a matic.

```shell
module add python-env/sci+num+sym+ga+petsc

Using system: gcc/7.4.0
Loaded: openmpi/3.1.4-gcc7.4.0
Loaded: python/3.7.7-gcc7.4.0
Loaded: petsc/3.11.4
Loaded: petsc4py/3.11.0
Loaded: globalarrays/5.7
Loaded: ga4py/5.7
Loaded: mpi4py/3.0.3
Loaded: matplotlib/3.2.2
Loaded: numpy/1.19.0
Loaded: scipy/1.5.0
Loaded: sympy/1.4
Loaded: pandas/1.1.2
Loaded: h5py/2.10
Loaded: python-env/sci+num+sym+ga+petsc
```

1. `split_comm.py`: `srun -p express3 -u -n 8 python split_comm.py`

(subkomunikátor)

Můžeme rozdělit výpočet mezi komunikátory; adresujeme pomocí _rank_.

```
srun: job 326755 queued and waiting for resources
srun: job 326755 has been allocated resources
[Global Rank 0] - Split - local rank 0 in size of 4
[Global Rank 1] - Split - local rank 1 in size of 4
[Global Rank 2] - Split - local rank 2 in size of 4
[Global Rank 3] - Split - local rank 3 in size of 4
[Global Rank 4] - Split - local rank 0 in size of 4
[Global Rank 5] - Split - local rank 1 in size of 4
[Global Rank 6] - Split - local rank 2 in size of 4
[Global Rank 7] - Split - local rank 3 in size of 4
[Global Rank 2] - Group0 - not present in any group
[Global Rank 3] - Group0 - not present in any group
[Global Rank 4] - Group2 - local rank 0 in size of 3
[Global Rank 5] - Group2 - local rank 1 in size of 3
[Global Rank 6] - Group2 - local rank 2 in size of 3
[Global Rank 7] - Group0 - not present in any group
[Global Rank 0] - Group1 - local rank 0 in size of 2
[Global Rank 1] - Group1 - local rank 1 in size of 2
```

2. `cartesian_comm.py`: `srun -p express3 -u -n 4 python cartesian_comm.py`

Kartézský komunikátor adresujeme pomocí indexů.

```
		     | 0 | 1 |
[0 | 1 | 2 | 3 ] --> |---|---|
                     | 2 | 3 |
```

```
srun: job 326756 queued and waiting for resources
srun: job 326756 has been allocated resources
MPI suggested cartesian grid 4x2
MPI suggested cartesian grid 4x2
MPI suggested cartesian grid 4x2
MPI suggested cartesian grid 4x2
MPI suggested cartesian grid 4x2
MPI suggested cartesian grid 4x2
MPI suggested cartesian grid 4x2
MPI suggested cartesian grid 4x2
[0] dim:   2
[0] topo:  ([4, 2], [0, 0], [0, 0])
[1] dim:   2
[1] topo:  ([4, 2], [0, 0], [0, 1])
[2] dim:   2
[2] topo:  ([4, 2], [0, 0], [1, 0])
[3] dim:   2
[3] topo:  ([4, 2], [0, 0], [1, 1])
[4] dim:   2
[4] topo:  ([4, 2], [0, 0], [2, 0])
[5] dim:   2
[5] topo:  ([4, 2], [0, 0], [2, 1])
[6] dim:   2
[6] topo:  ([4, 2], [0, 0], [3, 0])
[7] dim:   2
[7] topo:  ([4, 2], [0, 0], [3, 1])
[0] my coords: 0,0 and rank: 0
[0] left/right neigbourink ranks: -2 / 2)
[0] up/down neighbouring ranks:   -2 / 1)
[1] my coords: 0,1 and rank: 1
[1] left/right neigbourink ranks: -2 / 3)
[1] up/down neighbouring ranks:   0 / -2)
[2] my coords: 1,0 and rank: 2
[2] left/right neigbourink ranks: 0 / 4)
[2] up/down neighbouring ranks:   -2 / 3)
[3] my coords: 1,1 and rank: 3
[3] left/right neigbourink ranks: 1 / 5)
[3] up/down neighbouring ranks:   2 / -2)
[4] my coords: 2,0 and rank: 4
[4] left/right neigbourink ranks: 2 / 6)
[4] up/down neighbouring ranks:   -2 / 5)
[5] my coords: 2,1 and rank: 5
[5] left/right neigbourink ranks: 3 / 7)
[5] up/down neighbouring ranks:   4 / -2)
[6] my coords: 3,0 and rank: 6
[6] left/right neigbourink ranks: 4 / -2)
[6] up/down neighbouring ranks:   -2 / 7)
[7] my coords: 3,1 and rank: 7
[7] left/right neigbourink ranks: 5 / -2)
[7] up/down neighbouring ranks:   6 / -2)
```

- Příklady na silné a slabé škálování
  - `task2_matvec_weak.py`
  - `task2_matvec_strong.py` 

## Úkol

Modifikujte násobení matice a vektoru

- Zkusit si matici distribuovat po sloupcích (procesor pro každý sloupec)
- Zkusit si matici distribuovat po blocích (procesor pro každý blok)
- (Procesory mají celé vektory x, y)

Příště přejdeme na násobení matice * matice: některé algoritmy se budou škálovat lépe než při 
