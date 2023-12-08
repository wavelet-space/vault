# CPU SIMD overview

SIMD (Single Instruction Multiple Data) označuje instrukce dostupné pro jednotlivé procesory, které umožňují provádět některé operace nad několika daty v jediném kroku.
Tím se zajistí určité zrychlení. Tato technika se používá pro výpočetně náročné úlohy bežící na procesoru (CPU). Jako alternativa a doplněk se
dnes používají grafické procesoru (GPU) např. s CUDA (doplň odkaz). SIMD instrukce můžeme programovat "ručně", avšak většina kompilátorů jik umí
vuyžívat automaticky.

Skalární operace: 4 instrukce

    [a1] + [b1] = [c1]
    [a2] + [b2] = [c2]
    [a3] + [b3] = [c3]

Vektorová operace: 1 instrukce

    |a1|   |b1| = |c1| 
    |a2| + |b2| = |c2|
    |a3|   |b3| = |c3|

Každý výrobce procesorů definuje pro svoje procesory vlastní SIMD instrukce.

- Intel (SSE)
- AMD

## Intrinsic functions

### SSE

Používá osm 128bitových registrů xmm0 až xmm7 respektive až xmm15 na 64bitových procesorech.
SSE intrincits můžou pracovat se 4 zbalenými float nebo dvěma doubly nebo 4 32bitocými integery...

### AVX

rozšiřuje velikost registů na 256 bitů

AVX512 will increase the width of the SIMD registers from 256 to 512 bits

## Práce SSE vektory

    Square Root
    __m128 x_squared = _mm_sqrt_ps(x)

    Division

    _mm_div_ps(x_squared, x)

Popis SSE Funkcí na INTEL procesoru

addps

    __m128 _mm_add_ps(__m128 a, __m128 a) 

## Reference

- <https://software.intel.com/sites/landingpage/IntrinsicsGuide/#techs=SSE>
- <https://software.intel.com/sites/landingpage/IntrinsicsGuide/>
