# WebGL and OpenGL

- shaders and GLSL
  - clipspace coordinates, colors
  - vertex shader 
  - fragment shader
  - geometry shader
  - Attribute
  - Buffer
  - Uniform
  - Texture
  - Varying

- shader program
- compile & link shader program
- rendering

- 2D Transformation with Matrix 3x3
  - Translate
  - Rotate
  - Scale
  - Symetry

- 3D
  - Transformation with Matrix 4x4
    - Translate
    - Rotate
    - Scale
    
  - Projection
    - Orthographic 
    - Perspective

## Nastavení prvku `<canvas>`

### umístění na stránce

#### Jak centrovat `canvas` horizontálně:

    canvas {
        border: 1px solid black;
        padding: 0;
        margin: auto;
        display: block;
        width: 640px;
    }

Pokud jsme spokojeni s poměrem stran 4:3, můžeme opravdu údaj o výšce vynechat, prohlížeš vždy dopočítá výšku do tohoto poměru.

#### Jak centrovat `canvas`  vertikálně:

Musíme zavést absolutní pozicování:

## Odkazy

https://stackoverflow.com/questions/5127937/how-to-center-canvas-in-html5



Práce s GL se dá rozdělit do dvou kroků:

1. INICIALIZACE

1.1. CREATE AND COMPILE SHADERS

Pro oba typy shader objektů, které budeme používat se používá stejný mustr.

```js
var shader = gl.createShader(gl.VERTEX_SHADER);
var shader = gl.createShader(gl.FRAGMENT_SHADER);

gl.shaderSource(shader, shaderCode);

gl.compileShader(shader);

if (!gl.getShaderParameter(shader, gl.COMPILE_STATUS)) {
   throw gl.getShaderInfoLog(shader);
}

gl.deleteShader(shader)
```

1.2. CREATE AND COMPILE FRAGMENT SHADER

```js
var shader = 
```


1.3. CREATE PROGRAM AND ATTACH VERTEX AND FRAGMENT SHADER


1.4. LINK PROGRAM


1.5. RECORD LOCATIONS OF ATTRIBUTES AND UNIFORMS

Looking up attribute locations (and uniform locations) is something you should do during initialization, not in your render loop.


2. VYKRESLENÍ
    
Kontext je objekt, který se stará o vykreslování do zadaného <canvas> elementu.
Kontext vytvoříme pomocí funkce getContext objektu canvas. Jako parametr zadáme
typ kontextu -- protože chceme používat WebGL máme dvě respektive čtyři možnosti.

Pro WebGL verze 1.0, která implementuje s malými rozdíly OpenGL ES 2.0 můžeme
použít typ "webgl" nebo "experimental-webgl" pro starší prohlížeče.

V současné době (2015) se také pomalu již blíží vydání WebGL 2.0, které by mělo
implementovat OpenGL 3.0 -- což přinese mnohá vylepšení (ale i nějaké restrikce)
oproti první verzi.

https://developer.mozilla.org/en-US/docs/Web/API/HTMLCanvasElement/getContext

    HTMLCanvasElement.getContext(contextType, contextAttributes);

    A RenderingContext which is either a
    CanvasRenderingContext2D for "2d",
    WebGLRenderingContext for "webgl" and "experimental-webgl" or
    WebGL2RenderingContext for "webgl2" and "experimental-webgl2" . 

Poznámka:

Pokud jsem jednou incializovali kontext, pak další volání funkce getContext
vrací null, pokud bychom ho vovolai s jiným typem, nebo ten samý kontext, pokud
ho voláme se stejným typem

    var context = canvas.getContext("webgl") //> vrací kontext
    context.getContext("2d")                 //> vrací null
    context.getContext("webgl")              // vrací původní kontext

## Velikost prvku CANVAS

Každý canvas má dvě velikosti.

1) První je velikost jeho vykreslovacího bufferu, tzn. kolik je dostupných pixelů k vykreslování.
2) Druhá je velikost, kterou je vykresleno samotný canvas objekt.

Nastavit vekikost vykreslovacího bufferu lze dvěma způsoby a to pomocí:

1. HTML 
  ```html
  <canvas id="canvas" width="300" height="300"></canvas>
  ```
2. JS : 
  ```javascript
  var canvas = document.getElementById("canvas");
  canvas.width = 300;
  canvas.height = 300;
  ```

Velikost, jakým je zobrazen samotný `canvas`, se nastavuje pomocí CSS.

```css
#canvas {
  width: 300;
  height 300;   
}
```

---

# OpenGL


## Možné problémy při kompilaci

Při kompilaci a linkování může nastat mnoho problémů, popíši ty, na které jsem narazil.

### Windows

- GLSL Linker Error: Definition for “void main()” not found

- https://stackoverflow.com/questions/22008845/glfw-mingw-link-error
- https://stackoverflow.com/questions/13784233/glewinit-failed-opengl-app


## 01_window

Nejprve zkusíme jen zkompilovat.

```c
#include <GLFW/glfw3.h>

int main(int argc, char const *argv[])
{
    return 0;
}
```


    gcc 01_window.c -I. -o 01_window.exe

Přepínač `-I.` říká: hledej hlavičkové soubory `GLFW`v této složce, ve které spouštím kompilátor.
Zatím potřebujeme jen vložit hlavičku.



```c
int main(int argc, char const *argv[])
{
    /*  vynecháno  */

    GLFWwindow * window = glfwCreateWindow( 1024, 768, "Tutorial 01", NULL, NULL);
    
    glfwMakeContextCurrent(window);

    glfwSetInputMode(window, GLFW_STICKY_KEYS, GL_TRUE);

    do {
        glClear( GL_COLOR_BUFFER_BIT );

        /* zde budeme vykreslovat */

        // Swap buffers
        glfwSwapBuffers(window);
        glfwPollEvents();

    } // Check if the ESC key was pressed or the window was closed
    while( glfwGetKey(window, GLFW_KEY_ESCAPE ) != GLFW_PRESS &&
           glfwWindowShouldClose(window) == 0 );

    return 0;
}

    C:\Users\dlanda\projects\personal\opengl_cpp_win>gcc -m64 -DGLFW_DLL 01_window.c
     -I. -L. -lglfw3dll -lopengl32 -o 01_window.exe

Nakonec spustíme naši aplikaci.

    01_window.exe

A to je pro dnešek vše!



# Můj OpenGL tutoriál v C/Pythonu/JS

První co potřebujeme, abychom vůbec mohli zavolat nějakou OpenGL funkci je kontext.
Kontext se většinou vytvoří spolus s oknem, např díky GLFW. Je ale i možnost otevřít kontext v tzv headles módu -- bez okna.

# DOKU

http://docs.gl/


## Vytvoření a kompilace `Skader` objektu.

http://docs.gl/gl4/glCreateShader
 

    GLuint glCreateShader(GLenum shaderType);


    glCreateShader(GL_VERTEX_SHADER)
    glShaderSource()


Funkce `GLuint glCreateShader(GLenum shaderType);` vrací identifikátor shader objektu. 


