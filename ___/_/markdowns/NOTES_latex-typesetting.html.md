<!DOCTYPE html>
<head>
  <meta charset="utf8">
  <link rel="stylesheet" type="text/css" href="./assets/main.css">
  <title></title>
 <script src="https://cdn.jsdelivr.net/npm/vega@5.4.0"></script>
    <script src="https://cdn.jsdelivr.net/npm/vega-lite@3.3.0"></script>
    <script src="https://cdn.jsdelivr.net/npm/vega-embed@4.2.0"></script>
  <style type="text/css">
  	/*.katex-display { background: rgb(250, 250, 240); padding: 1em; border: 1px solid #eee; }*/
  </style>

<body>
</head>

<div id="container">

<header></header>

<!-- CONTENT -->

<div id="main" class="center">

https://cs.overleaf.com/learn/latex/Integrals,_sums_and_limits#Sums_and_products

<div id="vis"></div>

# LaTeX v IPython Notebooku

## Mathematics

### Sums and Products

Sum $\sum_{n=1}^{\infty} 2^{-n} = 1$ inside text

$$\sum_{n=1}^{\infty} 2^{-n} = 1$$

## Matice

### Matrix without borders

```
$\begin{matrix}
a_{11} & a_{12} & a_{13} \\
a_{21} & a_{22} & a_{23} \\
a_{31} & a_{32} & a_{33} \\
\end{matrix}$
```

$$\begin{matrix} 
a_{11} & a_{12} & a_{13} \\
a_{21} & a_{22} & a_{23} \\
a_{31} & a_{32} & a_{33} \\
\end{matrix}$$

### (parentheses)

```
$
\begin{pmatrix}
a_{11} & a_{12} & a_{13} \\
a_{21} & a_{22} & a_{23} \\
a_{31} & a_{32} & a_{33} \\
\end{pmatrix}
$
```
$
\begin{pmatrix}
a_{11} & a_{12} & a_{13} \\
a_{21} & a_{22} & a_{23} \\
a_{31} & a_{32} & a_{33} \\
\end{pmatrix}
$

### (brackets)

```
$
\begin{bmatrix}
a_{11} & a_{12} & a_{13} \\
a_{21} & a_{22} & a_{23} \\
a_{31} & a_{32} & a_{33} \\
\end{bmatrix}
$
```
$
\begin{bmatrix}
a_{11} & a_{12} & a_{13} \\
a_{21} & a_{22} & a_{23} \\
a_{31} & a_{32} & a_{33} \\
\end{bmatrix}
$

### (bars)

Usually used for *determinant*.

```
$
\begin{vmatrix}
a_{11} & a_{12} & a_{13} \\
a_{21} & a_{22} & a_{23} \\
a_{31} & a_{32} & a_{33} \\
\end{vmatrix}
$
```
$
\begin{vmatrix}
a_{11} & a_{12} & a_{13} \\
a_{21} & a_{22} & a_{23} \\
a_{31} & a_{32} & a_{33} \\
\end{vmatrix}
$

### (double bars)

```
$
\begin{Vmatrix}
a_{11} & a_{12} & a_{13} \\
a_{21} & a_{22} & a_{23} \\
a_{31} & a_{32} & a_{33} \\
\end{Vmatrix}
$
```
$
\begin{Vmatrix}
a_{11} & a_{12} & a_{13} \\
a_{21} & a_{22} & a_{23} \\
a_{31} & a_{32} & a_{33} \\
\end{Vmatrix}
$

## Příklady

#### Vynechání prvků matice v řádku, sloupci, diagonále

Pokud zapisujem matice různorodé velikosti, používáme 

 - `\vdots` ($\vdots$) pro horizontílní vynechání 
 - `\cdots` ($\cdots$) pro vertikální vynechání
 - `\ddots` ($\ddots$) pro diagonální vynechání

```
A_{m,n} = 
\begin{pmatrix}
a_{1,2} & a_{1,2} & \cdots & a_{1,n} \\
a_{2,1} & a_{2,3} & \cdots & a_{2,n} \\
\vdots  & \vdots  & \ddots & \vdots  \\
a_{m,1} & a_{m,2} & \cdots & a_{m,n} \\
\end{pmatrix}
```

$
A_{m,n} = 
\begin{pmatrix}
a_{1,2} & a_{1,2} & \cdots & a_{1,n} \\
a_{2,1} & a_{2,3} & \cdots & a_{2,n} \\
\vdots  & \vdots  & \ddots & \vdots  \\
a_{m,1} & a_{m,2} & \cdots & a_{m,n} \\
\end{pmatrix}
$

#### Zápis matice v textu

Toto je zápis malé matice $\begin{smallmatrix} a & b \\ c & d \end{smallmatrix}$ přímo v textu.

### Zápis zlomků v matici
$
M = 
\begin{pmatrix}
  \frac{5}{6} & \frac{1}{6} & 0 \\[0.3em]
       \frac{5}{6} & 0 & \frac{1}{6} \\[0.3em]
       0 & \frac{5}{6} & \frac{1}{6}
\end{pmatrix}$


## Derivace


## Integrály

neurčitý

$$ \int f(x) $$

určitý

$
\int_{a}^{b}f(x)
$

$
\int_{0}^{\infty} f(x)
$

$$\int^{+\infty}_{-\infty} x \, dx$$


## Odkazy

- http://latexbestpractice.blogspot.com/

</div>
<!-- /CONTENT -->

</div> <!-- /container -->

<script type="text/javascript" defer src="./assets/markjax.min.js"></script>
<script type="text/javascript" defer src="./assets/main.js"></script>

<script type="text/javascript">
  var yourVlSpec = {
    $schema: 'https://vega.github.io/schema/vega-lite/v2.0.json',
    description: 'A simple bar chart with embedded data.',
    data: {
      values: [
        {a: 'A', b: 28},
        {a: 'B', b: 55},
        {a: 'C', b: 43},
        {a: 'D', b: 91},
        {a: 'E', b: 81},
        {a: 'F', b: 53},
        {a: 'G', b: 19},
        {a: 'H', b: 87},
        {a: 'I', b: 52}
      ]
    },
    mark: 'bar',
    encoding: {
      x: {field: 'a', type: 'ordinal'},
      y: {field: 'b', type: 'quantitative'}
    }
  };
  vegaEmbed('#vis', yourVlSpec);

    </script>
</body>
</html>