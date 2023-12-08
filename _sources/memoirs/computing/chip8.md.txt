#  CHIP-8

## Memory

Pamět je 4K a u moderních implementací slouží celá pro programová data. U straších implementací bylo prvních 512 byt rezervováno pro interpretr. Většina programů tedy začínala na adrese 512 (0x200) a dále. 

## Regisers

- 16 x 8-bitových datový registr *V0* až *VF*.
- VF register slouží jako příznak (*flag*) pro některé instukce a tedy něml by se běžně používat.
  - addition
  - subtraction
- Adresní registr *I*.

## Stack

## Timer

K dispozici jsou dva časovače:

- Delay timer: používán pro události hry.
- Sound timer: Používán pro zvukové effekty.

## Input

Klávesnice s šstnácti klávesami značenými 0 až F.
Pro určení směru jsou obvykle použity klávesy 8, 4, 6 a 2.