# C++

## Resources

- https://en.cppreference.com
- Scot Meyers Books


## Getting Started


+ QMake, CMAke, MSVC, GNU C++, CLang, 
+ Catch: https://github.com/philsquared/Catch
+ GoogleTest: https://github.com/google/googletest
+ GoogleMock: https://github.com/google/googletest
+ Google Benchmark: https://github.com/google/benchmark
+ Boost: http://www.boost.org/
+ CppUTest: http://cpputest.github.io/



## Type system

Structural typing; Duck typing via templates

## Containers

std::array
Není ni cjiného než jednoduchá struktura, která obaluje céčkovské pole a dělá ho trochu bezpečnější

Jak můžeme pole inicializovat?


std::array<char, 2> arr1{'a', 'b'};

std::array<char, 2> arr1 = {'a', 'b'};


## Custom Types (`struct` and `class`)

### Konstruktor


- Má stejné jméno jako třída.
- Nemá žádný návratový typ.
- Může přijímat parametry.
- Může volat jiný konstruktor (vlastní třídě nebo nadtřídě).
- Může být označen jako public, protected i private.
- Třída může deklarovat více konstruktorů, ty se musí lišit počtem nebo typem 
  parametrů (nebo obojím).

Pokud nedeklarujem žádný konstruktor, je při vytváření instance volán tzv. 
implicitní konstruktor. Ten je vytvořen kompilátorem při překladu, říká se
mu *synthesized default construtor*. Výchozí konstruktor nepřebírá žádné parametry.

Výchozí konstruktor je generován jen pokud není definován jiný konstruktor.

Je lepší definovat i prázdný konstruktor explicitně:
    Constructor() {};
    Constructor() = default; // c++11

Konstruktor můžeme definovat uvnitř i vně třídy -- v definiční nebo 
implementační souboru.

Abstraktní třída je taková, která obsahuje alespoň jednu čistě virtuální funkci.

Konstruktor nemůže být virtuální 
Konstruktor může být označen jako noexcept

Herb Sutter:
\destrucktor by měl být buď public a vitrual nebo protected a nonvirtual


V C++11 lze uvnitř třídy volat jiný konstruktor:
		
```c++
template <typename T>
class Point {
	
	const T x;
	const T y;

	Point(T const& x_value, T const& y_value) 
	  : x(x_value)
	  , y(y_value) 
	  { }
	
	Point(T const& value)
	  : Point(value, value) 
	  { }
};
```

Konstruktor může mít výchozí parametry:

```c++
template <typename T>
class Point {

	const T x, 
	const T y,


	Point(T const&)

}
```

#### Copy constructor

> Kopírovací konstrutor je speciální typ konstruktoru, který má jednu z těchto signatur

```c++
T::T(T& t)
T::T(const T& t)
````

Vždy existuje alespoň jeden kopírovací konstruktor a to buď implicitní nebo explicitní,
tedy buď ho vytvoří kompilátor sám, nebo v případě, že ho definoval uživatel.

**Rule of three!**

Pokud je uživatelem definován kopírovací konstruktor, musí také definovat *operátor přířazení* `=` a *destruktor*.

##### AVoid copy

1. kopírovací konstruktor a operátor přiřazení jsou jen privátní deklarace

Pokud kopírovací konstruktor a operátor přiřazení pouze deklarujeme jako soukromé členy a nejsou implementovány. Každý pokus o použití konstruktoru nebo operátoru skončí chybou při kompilaci.

```c++
class NonCopyableClass {
    
private:
    NonCopyableClass(const NonCopyableClass&);
    NonCopyableClass& operator=(const NonCopyableClass&);
}
```

+ https://ariya.io/2015/01/c-class-and-preventing-object-copy

### Destruktor

```c++
~Point() = default

~Point() {}

virtual ~Point() { }

```

### Operators


## Pointers

 `<memory>`

 `unique_ptr`

Unique pointer je reprezentovaný typem `std::unique_ptr`.

std::make_unique

```cpp
class UniquePointerDemo 
{

}
```
## `shared_ptr`

Shared pointer je reprezentovaný typem `std::shared_ptr`.

Shared pointer
std::make_shared


## Dynamic and Static Libraries


## Threads and Multithreading


## Compile Time Features -- `constexpr`


constepr

if constexpr

enable_if


## Type inference `decltype<T>`

