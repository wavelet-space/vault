<!DOCTYPE html>
<head>
  <meta charset="utf8">
  <!-- <script type="text/javascript" defer src="./microlight.js"></script> -->
  <link rel="stylesheet" type="text/css" href="./assets/main.css">
  <title></title>
</head>
<body>
<div id="container">
<header>HEADER</header>
<div id="main" class="left-content">

# Computer Graphics Course & Computational Geometry Algorithms

*This course presents the foundation of computer graphics.*

## Resources

- https://cglearn.codelight.eu/pub/computer-graphics
- https://www.learner.org/courses/learningmath/geometry/
- https://www.learner.org/courses/learningmath/geometry/keyterms.html
- http://www.scratchapixel.com/lessons/mathematics-physics-for-computer-graphics/geometry/points-vectors-and-normals
- https://www.springer.com/gp/book/9781852338343
- http://codeofthedamned.com/index.php/geometry-in-3d-computer-graphics
- http://www.3drenderer.com/geometry-for-computer-graphics
- http://www.geometricalgebra.net/
- https://studios.disneyresearch.com/
- http://paulbourke.net/papers/interface/
- https://sketchfab.com/

- https://www.youtube.com/watch?v=Mcal5Cy7r4E&feature=youtu.be


## Fundamentals of Linear Algebra and Geometry (1)

*This chapter explains the basic mathematics used in computer graphics as point, coordinates (homogenous), vector, matrix, transformation, , Euclidean space*.

> Historically the linear algebra (LA) is a foundation of computer graphics but there is another algebra which is generalise and explain many concepts of LA quaternions -- is is called Geometric or Clifford algebra!I will cover some these concepts later but if youa re curious what I'm talking about, please visit https://en.wikipedia.org/wiki/Geometric_algebra. More links here (FIXME).

### Vector

> Vector is ..

$$\begin{equation} 
  \vec{e_x} = (1, 0, 0) 
\end{equation}$$

### Matrix

> Matrix is ...

### Coordinates 

## Projection and Coordinate Systems

Představme si scénu --3D virtuální svět (`VIRTUAL WORLD`), ve kterém jsou umístěny libovolné objekty. V této scéně určíme počátek souřadné soustavy. V podstatě do ní umístíme trojici navzájem kolmých jednotkových vektorů, které představují tzv. bázi souřadné soustavy. Každý objekt umístěný ve scéně má tedy určitou pozici vzhledem k těmto souřadnicím, kterým budeme říkat VIRTUAL WORLD COORDINATES či krátce WORLD COORDINATES.

Ve scéně je také umístena projekční polocha respektive kamera. S ní je svázána také souřadná soustava která je 2D -- říkamá je SCREEN nebo VIEW COORDINATES.

PROJEKCE je v podstatě zobrazení (funkce), kerý převádí souřadnice objektu v 3D WORLD COORDINATES do 2D SCREEN COORDINATES projekční plochy.    

$$\text{world  coordinates} \rightarrow \text{screen coordinates} \equiv (x, y, z) \rightarrow (x, y) $$

The notation $(x, y, z)$ represents the *world coordinates* and $(x, y)$ represents the *screen coordinates*.

{{canvas1}}

```javascript
let canvas = document.getElementById("canvas1")
let ctx = canvas.getContext("2d")

canvas.width  = 300;
canvas.height = 200;

canvas.style.width = canvas.width;
canvas.style.height = canvas.height;

canvas.setAttribute('width', window.innerWidth);
canvas.setAttribute('height', window.innerHeight);

ctx.fillStyle = "#223883"
ctx.strokeStyle = "#fff"

ctx.fillRect(0, 0, canvas.width, canvas.height);

ctx.save()
ctx.lineWidth = 1.5

ctx.fillStyle = "#fff"

// left top corner
ctx.beginPath();
  ctx.arc(0, 0, 10, 0, 2 * Math.PI)
ctx.closePath()
ctx.fill()

// center
ctx.beginPath();
  ctx.arc(canvas.width / 2, canvas.height / 2, 10, 0, 2 * Math.PI)
ctx.closePath()
ctx.fill()


// right top corner
ctx.beginPath();
  ctx.arc(canvas.width , 0, 10, 0, 2 * Math.PI)
ctx.closePath()
ctx.fill()

// left bottom corner
ctx.beginPath();
  ctx.arc(0, canvas.height, 10, 0, 2 * Math.PI)
ctx.closePath()
ctx.fill()

// right bottom corner
ctx.beginPath();
  ctx.arc(canvas.width, canvas.height, 10, 0, 2 * Math.PI)
ctx.closePath()
ctx.fill()
```

> Demo

## Colors

How are colors represented and what is *color space*? 


# POČÍTAČOVÁ GRAFIKA & GEOMETRIE

## Grafické/Geometrické Transformace

    Rotation    -> rotate
    Dilatation  -> dilate (scale)
    Translation -> translate

object = image, 3D shape...

A DILATATION := (is) a transformation that produces an {object}
that is the same shape as the original, but is a different size.

A dilation that creates a smaller image is called a REDUCTION.
A dilation that creates a larger image is called an ENLARGEMENT.


Vujičić, Milan. Linear Algebra Thoroughly Explained. Berlin: Springer, 2008.
Vujičić, Milan. Linear Algebra Thoroughly Explained. Berlin: Springer, 2008.


## Space

V kterékoliv 3D aplikaci rozeznáváme čtyři základní souřadnicové prostory (coordinate space).

1. *World Space (3D)* -- Definuje pozici všech objektů ve scéně. Tento prostor tedy určuje polohu objektů a orientaci vůči sobě.

2. *Model Space (3D)* --také nazývaný jako *Object* nebo *Local Space* Tento model je lokální vzhledem k obkjektu ve scéně. Představme si např konvičku s třemi vektory ve středu tohoto ojektu. Vzhledem k počítku se pozice ani oriantace objektu nikdy nemění.

3. *Camera Space (3D)* -- Také známý jako *View Space* nebo *Eye Space* je prostor relativní vzhledem ke kameře. Kamera je umístěna v počátku O = (0, 0, 0) tohoto prostoru a kamera samotná je zadána věktorem určujícím směr pohledu (snímání) a směrem UP.

4. *Clip Space (2D)* -- ...

4. *Screen Space (2D)* -- Prostor představující obrazovku, tj. prostor ve kterém např. určujeme souřadnice kurzoru.

Right Handed Coordinate System

## View(ing) Frustum

VPN = View Plane Normal
VUV = View Up Vector
VRP = View Reference Point

- Orthographic Projection => Cube-Like-Frustum

- Perspective Projection => Pyramid-Like-Frustum


# Computer Graphics Notes

## Atlas Texture

https://en.wikipedia.org/wiki/Texture_atlas
https://github.com/septag/atlasc

### Structure Packing

http://www.catb.org/esr/structure-packing/


## Graphic Primitive Object


- What is mesh?
-

# Graphics file formats

## 3D Model File Formats

### OBJ + MTL

- extension .obj
- Wavefront Technologies
- https://en.wikipedia.org/wiki/Wavefront_.obj_file

MTL (Material template library)

### PLY

Polygon File Format

## Image Graphics File Formats

https://en.wikipedia.org/wiki/Image_file_formats

### Raster Graphics File Formats

- Exif

- JPEG (Joint Photographic Experts Group) https://en.wikipedia.org/wiki/JPEG

- TIFF (Tagged Image File Format) https://en.wikipedia.org/wiki/TIFF

- PNG

- GIF (Graphics Interchange Format)

- BMP (Windows Bitmap)

- PPM, PGM, PBM, and PNM

### Vector Graphics File Formats

### Container formats of raster graphics editors

- PSD
- PSP



</div> <!-- /left-content -->

<div class="right-content"> 
  <div id="toc"></div>
</div>


</div> <!-- /container -->

<script type="text/javascript" defer src="./assets/markjax.min.js"></script>
<script type="text/javascript" defer src="./assets/main.js"></script>
</body>
</html>