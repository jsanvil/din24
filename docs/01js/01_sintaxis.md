# 1.1 Sintaxis básica de Javascript

## Introducción

**Javascript**, muchas veces abreviado como **JS**, es un lenguaje de programación **interpretado** de alto nivel, usado principalmente en el lado del cliente (navegador web) para mejorar la interactividad de las páginas web. También se usa en el lado del servidor (Node.js) y en aplicaciones de escritorio (Electron).

Es un lenguaje orientado a objetos, basado en prototipos, de tipado dinámico y débil. _Javascript_ tiene una sintaxis similar a _C++_ y _Java_.

## ECMAScript

_**ECMAScript**_, abreviado como **ES**, es la **especificación** del lenguaje de programación que se basa en _Javascript_. La última versión es la _**ECMAScript 2024**_ (_ES2024_), aunque la más usada es la _**ECMAScript 2015**_ (_ES6_) que introdujo muchas novedades en el lenguaje, como las **constantes**, **let**, **arrow functions**, **clases**, **módulos**, etc.

## Comentarios

Los comentarios en _Javascript_ se pueden hacer de dos formas:

* **`//`**: para comentarios de una línea
* **`/* ... */`**: para comentarios de varias líneas

```js linenums="1"
// Esto es un comentario de una línea

/* Esto es un comentario de
   varias líneas */
```

## Sentencias

Las sentencias en _Javascript_ terminan con un punto y coma **`;`**. Aunque no es obligatorio ponerlo al final de cada sentencia es recomendable hacerlo para evitar errores.

```js linenums="1"
let x = 5;  // sentencia
let y = 6;  // sentencia
let z = x + y;  // sentencia
```

## Logs

Para mostrar mensajes en la consola del navegador se usa la función **`console.log()`**.

```js linenums="1"
console.log('Hola mundo');
```

Existen otras funciones como **`console.error()`**, **`console.warn()`**, **`console.info()`**, **`console.table()`**, **`console.time()`**, **`console.timeEnd()`**, etc.

```js linenums="1"
console.time('Tiempo');  // Inicia un temporizador, se le pasa un nombre para identificarlo
console.error('Error');
console.warn('Advertencia');
console.info('Información');
console.table(['Manzana', 'Pera', 'Naranja']); // Muestra una tabla con los datos
console.timeEnd('Tiempo');  // Finaliza el temporizador y muestra el tiempo transcurrido
```

El resultado de la ejecución depende de la consola donde se ejecute, y cada tipo de mensaje suele representarse con iconos o colores.

```txt title="Resultado de la ejecución"
❌ Error
⚠️ Advertencia
Información
┌─────────┬───────────┐
│ (index) │ Values    │
├─────────┼───────────┤
│ 0       │ 'Manzana' │
│ 1       │ 'Pera'    │
│ 2       │ 'Naranja' │
└─────────┴───────────┘
Tiempo: 5.468ms
```

## Bloques

Los bloques de código se encierran entre llaves **`{ }`**. Un bloque puede contener varias sentencias.

```js linenums="1"
{
    let x = 5;
    let y = 6;
    let z = x + y;
}
```

!!! note "Nota"
    En sentencias como `if`, `for`, `while`, etc., se pueden omitir las llaves si sólo hay una sentencia en el bloque, aunque es recomendable ponerlas siempre.

## Variables

_Javascript_ es un lenguaje con **tipado dinámico**. Esto significa que no se indica el tipo de una variable al declararla e incluso puede cambiar su tipo a lo largo de la ejecución del programa.

Esto se conoce como **inferencia de tipos**, se asigna el tipo de una variable en función del valor que se le asigna.

Ejemplo:

```js linenums="1"
let miVariable;          // declara miVariable y como no se asigno un valor valdrá undefined
miVariable = 'Hola';     // ahora su valor es 'Hola', por tanto contiene una cadena de texto
miVariable = 34;         // ahora contiene un número
miVariable = [3, 45, 2]; // ahora un objeto array
miVariable = undefined;  // por último vuelve a valer undefined
```

Ni siquiera es obligatorio a declarar una variable antes de usarla, aunque es recomendable para evitar errores.

Las variables de declaran con **`let`** (lo recomendado desde _ES2015_), aunque también pueden declararse con **`var`**. La diferencia es que con _`let`_ la variable sólo existe en el bloque en que se declara mientras que con _`var`_ la variable es **global**. Ejemplo:

```js linenums="1"
let edad = 25;

if (edad < 18) {
  let textoLet = 'Eres mayor de edad';
  var textoVar = 'Eres mayor de edad';
} else {
  let textoLet = 'Eres menor de edad';
  var textoVar = 'Eres menor de edad';
}

console.log(textoLet);  // mostrará undefined porque fuera del if no existe la variable
console.log(textoVar);  // mostrará la cadena 'Eres mayor de edad' porque es global
```

Cualquier variable que no se declara dentro de una función (o si se usa sin declarar) es _global_. Debemos **evitar el uso de variables globales**.

Se recomienda que los nombres de las variables sigan la sintaxis _**camelCase**_ (ej.: _miPrimeraVariable_).

### Constantes

Desde _ES2015_ también se pueden declarar constantes con **`const`**. Se les debe dar un valor al declararlas y si intentamos cambiar su valor se producirá un error.

Se recomienda usar **`const`** siempre que sea posible y sólo usar **`let`** si sabemos que el valor de la variable va a cambiar.

Se recomienda que los nombres de las constantes sean en mayúsculas y con guiones bajos para separar palabras. Ejemplo:

```js linenums="1"
const PI = 3.14159;
const MAXIMO_INTENTOS = 3;

PI = 3.14;              // Error: Assignment to constant variable
MAXIMO_INTENTOS = 5;    // Error: Assignment to constant variable
```

Otro uso común de las constantes es almacenar objetos o arrays que no van a cambiar. Ejemplo:

```js linenums="1"
const colores = ['rojo', 'verde', 'azul'];
const persona = {
    nombre: 'Juan',
    edad: 25
};
```

### Ámbito de las variables

El **ámbito** de una variable es la parte del programa donde se puede acceder a ella. En _Javascript_ las variables declaradas con **`let`** tienen un ámbito de **bloque**. Esto significa que sólo se pueden acceder a ellas dentro del bloque en que se declaran.

```js linenums="1"
{
    let x = 5;
    console.log(x);  // 5
}

console.log(x);  // Error: x is not defined
```

Las variables declaradas con **`var`** tienen un ámbito de **función**. Esto significa que sólo se pueden acceder a ellas dentro de la función en que se declaran.

```js linenums="1"
function miFuncion() {
    var y = 6;
    console.log(y);  // 6
}

console.log(y);  // Error: y is not defined
```

### Hoisting

El **hoisting** es un comportamiento de _Javascript_ que mueve las declaraciones de variables y funciones al principio del ámbito en que se encuentran. Esto significa que podemos usar una variable o función antes de declararla.

```js linenums="1"
console.log(miVariable);  // undefined
var miVariable = 5;
```

Esto es porque _Javascript_ interpreta el código de la siguiente forma:

```js
var miVariable;
console.log(miVariable);
miVariable = 5;
```

Esto sólo ocurre con las variables declaradas con **`var`**. Las variables declaradas con **`let`** y **`const`** no tienen hoisting y si intentamos usarlas antes de declararlas se produce un error.

```js linenums="1"
console.log(miVariable);  // Error: Cannot access 'miVariable' before initialization
let miVariable = 5;
```

## Tipos de datos básicos

En Javascript ES2015 existen 9 tipos de datos:

- Primitivos:
    - number
    - string
    - boolean
    - undefined
    - null
    - bigint
    - symbol
- No primitivos:
    - Object (Array, Function, Date, Map, Set, etc.)

Los primitivos son **inmutables**, es decir, no se pueden modificar. Si se modifica una variable que contiene un valor primitivo se crea una nueva variable con el nuevo valor.

Para saber de qué tipo es el valor de una variable tenemos el operador **`typeof`**. Ej.:

* `typeof 3` devuelve _number_
* `typeof 'Hola'` devuelve _string_

Existen dos valores especiales:

* **undefined**: es lo que vale una variable a la que no se ha asignado ningún valor.
* **null**: es un tipo de valor especial que podemos asignar a una variable. Es como un objeto vacío (`typeof null` devuelve _object_)

También hay otros valores especiales relacionados con operaciones con números:

- **NaN** (_Not a Number_): indica que el resultado de la operación no puede ser convertido a un número (ej. `'Hola' * 2`, aunque `'2' * 2` daría `4` ya que se convierte la cadena `'2'` al número `2`)
- **Infinity** y **-Infinity**: indica que el resultado es demasiado grande o demasiado pequeño (ej. `1 / 0` o `-1 / 0`)

### _Casting_ de variables

Como hemos dicho las variables pueden contener cualquier tipo de valor y, en las operaciones, _Javascript_ al ser débilmente tipado, realiza **automáticamente** las conversiones necesarias para, si es posible, realizar la operación. Por ejemplo:

* `'4' / 2` devuelve `2` (convierte `'4'` en `4` y realiza la operación)
* `'23' - null` devuelve `23` (`23 - 0`)
* `'23' - undefined` devuelve _`NaN`_ (no puede convertir `undefined` a nada así que no puede hacer la operación)
* `'23' * true` devuelve `23` (`23 * 1`)
* `'23' * 'Hello'` devuelve _`NaN`_ (no puede convertir `'Hello'`)
* `23 + 'Hello'` devuelve `'23Hello'` (`+` es el operador de concatenación así que convierte `23` a `'23'` y los concatena)
* `23 + '23'` devuelve `'2323'` (convierte el número `23` a *string*, no al revés)

Además comentar que en _Javascript_ todo son objetos por lo que todo tiene métodos y propiedades. Veamos brevemente los tipos de datos básicos.

### Number

Sólo hay un tipo de número, no existen enteros y decimales. El tipo de dato para cualquier número es **number**. El carácter para la coma decimal es el **.** (como en inglés, así que `23,12` debemos escribirlo como `23.12`).

- Operadores aritméticos:
    - **`+`** suma.
    - **`-`** resta.
    - **`*`** multiplicación.
    - **`/`** división.
    - **`%`** módulo (resto de la división).
    - **`**`** potencia.

- Operadores unarios:
    - **`++`** incremento.
    - **`--`** decremento.

Se pueden usar los operadores aritméticos junto al operador de asignación **`=`**:

  - **`+=`** suma y asignación.
  - **`-=`** resta y asignación.
  - **`*=`** multiplicación y asignación.
  - **`/=`** división y asignación.
  - **`%=`** módulo y asignación.

Algunos métodos útiles de los números son:

- **`.toFixed(num)`**: redondea el número a los decimales indicados.

    _Ej.: `23.2376.toFixed(2)` devuelve `23.24`_

- **`.toLocaleString()`**: devuelve el número convertido al formato local.

    _Ej.: `23.76.toLocaleString()` devuelve `"23,76"` (convierte el punto decimal en coma)_

Se puede forzar la conversión de una cadena de texto a número con la función **`Number(valor)`**. Ejemplo `Number("23.12")` devuelve `23.12`

Otras funciones útiles son:

- **`isNaN(valor)`**: nos dice si el valor pasado es un número (`false`) o no (`true`).
- **`isFinite(valor)`**: devuelve _`true`_ si el valor es finito (no es _`Infinity`_ ni _`-Infinity`_). 
- **`parseInt(valor)`**: convierte el valor pasado a un número entero. Siempre que comience por un número la conversión se podrá hacer. Ej.:
    ```javascript
    parseInt(3.65)      // Devuelve 3
    parseInt('3.65')    // Devuelve 3
    parseInt('3 manzanas')    // Devuelve 3
    parseInt('tres')        // Devuelve NaN
    ```

- **`parseFloat(valor)`**: como la anterior pero conserva los decimales.

!!! warning "Precisión"
    al sumar *floats* podemos tener problemas de precisión. Por ejemplo:

    ```javascript
    console.log(0.1 + 0.2)    // imprime 0.30000000000000004
    ```

    Para evitarlo se pueden redondear los resultados (`(0.1 * 10 + 0.2 * 10) / 10`).

### String

Las cadenas de texto van entre comillas simples o dobles, es indiferente. Podemos escapar un caràcter con `\` (ej. `'Hola \'Mundo\''` devuelve _`Hola 'Mundo'`_).

Para forzar la conversión a cadena se usa la función **`String(value)`** (ej. `String(23)` devuelve `'23'`)

El operador de concatenación de cadenas es **`+`**.

Algunos métodos y propiedades de las cadenas son:

* **`.length`**: propiedad que almacena la longitud de la cadena, es decir, el número de caracteres que contiene.

    ```js
    'Hola mundo'.length // devuelve 10
    ```

* **`.at(index)`**: devuelve el carácter en la posición indicada (puede ser negativa).

    ```js
    'Hola mundo'.at(-2) // devuelve 'd'
    ```

* **`.charAt(position)`**: devuelve el carácter en la posición indicada, si la posición no existe devuelve `''` (cadena vacía).

    ```js
    'Hola mundo'.charAt(2) // devuelve 'l'
    // OJO: Si la posición no existe devuelve ''
    ```

* **`[]`**: se puede acceder a un carácter como si fuera un array. Funciona igual que `charAt` pero devuelve `undefined` si no existe.

    ```js
    'Hola mundo'[2] // devuelve 'l'
    // OJO: Si la posición no existe devuelve undefined
    ```

* **`.indexOf(character)`**: devuelve la posición de la primera aparición del carácter indicado. Si no se encuentra devuelve `-1`.

    ```js
    'Hola mundo'.indexOf('l') // devuelve 2
    ```

* **`.lastIndexOf(character)`**: devuelve última la posición de carácter indicado. Si no se encuentra devuelve `-1`.

    ```js
    'Hola mundo'.lastIndexOf('o') // devuelve 9
    ```
 
* **`.substring(from [, to])`**: devuelve la subcadena desde la posición `from` hasta la posición `to` (sin incluirla). Si no se indica `to` devuelve hasta el final.

    ```js
    'Hola mundo'.substring(1,3) // devuelve 'ol'
    'Hola mundo'.substring(2) // devuelve 'la mundo'
    ```

* **`.substr(from [, length])`**: devuelve la subcadena desde la posición `from` y, de manera opcional, la longitud indicada, si no se indica devuelve hasta el final.
  
    ```js
    'Hola mundo'.substr(2,4) // devuelve 'la m'
    'Hola mundo'.substr(2) // devuelve 'la mundo'
    ```

    !!!warning "Obsoleto (_deprecated_)"
        Este método está deprecado y no se recomienda su uso.
        [Mas información](https://developer.mozilla.org/es/docs/Web/JavaScript/Reference/Global_Objects/String/substr)

* **`.replace(pattern, replacement)`**: reemplaza la primera aparición de `pattern` (un patrón indicado) por `replacement` (el texto que lo reemplaza). Si se quiere reemplazar todas las apariciones se debe usar una expresión regular.

    ```js
    'Hola mundo'.replace('Hola', 'Adiós') // devuelve 'Adiós mundo'
    ```

    Si se quiere reemplazar todas las apariciones se debe usar una expresión regular.

    ```js
    'Hola mundo'.replace(/o/g, 'O') // devuelve 'HOla mundO'
    ```

    !!!note "Expresiones regulares"
        Las expresiones regulares son patrones que se utilizan para hacer coincidir combinaciones de caracteres en cadenas. Se pueden usar para validar, buscar y reemplazar texto. Se definen entre barras `/.../`.

        [Más información](https://developer.mozilla.org/es/docs/Web/JavaScript/Guide/Regular_expressions)

* **`.toLocaleLowerCase()`**: devuelve la cadena en minúsculas.

    ```js
    'Hola mundo'.toLocaleLowerCase() // devuelve 'hola mundo'
    ```

* **`.toLocaleUpperCase()`**: devuelve la cadena en mayúsculas.

    ```js
    'Hola mundo'.toLocaleUpperCase() // devuelve 'HOLA MUNDO'
    ```

* **`.localeCompare(string)`**: retorna un número que indica si la cadena a que se aplica el método es anterior, posterior o igual a la cadena pasada como argumento.  _`-1`_ si es anterior, _`1`_ si es posterior y _`0`_ si son iguales. Tiene en cuenta caracteres locales como acentos `ñ`, `ç`, `ó`, `à`, `ü`, etc.

Útil para ordenar cadenas de texto alfabéticamente.

    ```js
    'Hola'.localeCompare('Hola') // devuelve 0
    'Hola'.localeCompare('Adiós') // devuelve 1
    'Hola'.localeCompare('Mundo') // devuelve -1
    ```

* **`.trim(string)`**: elimina los espacios en blanco al principio y al final de la cadena. Los caracteres intermedios no se ven afectados.

Se consideran caracteres en blanco: espacios, tabuladores, saltos de línea, etc.

    ```js
    '   Hola mundo   '.trim() // devuelve 'Hola mundo'
    ```

* **`.startsWith(string)`**: devuelve _`true`_ si la cadena comienza con el texto indicado.

    ```js
    'Hola mundo'.startsWith('Hol') // devuelve true
    ```
  
* **`.endsWith(string)`**: devuelve _`true`_ si la cadena termina con el texto indicado.

    ```js
    'Hola mundo'.endsWith('Hol') // devuelve false
    ```

* **`.includes(string)`**: devuelve _`true`_ si la cadena contiene el texto indicado.

    ```js
    'Hola mundo'.includes('mun') // devuelve true
    ```
  
* **`.repeat(times)`**: repite la cadena el número de veces indicado.

    ```js
    'Hola mundo'.repeat(3) // devuelve 'Hola mundoHola mundoHola mundo'
    ```

* **`.split(separator)`**: divide la cadena en un array de subcadenas, usando el separador indicado, y devuelve el array resultante.

    ```js
    'Hola mundo'.split(' ') // devuelve ['Hola', 'mundo']
    ```

    Si se le pasa como separador una cadena vacía (`''`), devuelve un array con cada carácter de la cadena.

    ```js
    'Hola mundo'.split('') // devuelve ['H', 'o', 'l', 'a', ' ', 'm', 'u', 'n', 'd', 'o']
    ```
  
Podemos probar los diferentes métodos en la página de [w3schools](https://www.w3schools.com/jsref/jsref_obj_string.asp).

#### Template literals

Desde ES2015 también podemos poner una cadena entre **`` ` ``** (acento grave) y en ese caso podemos poner dentro **variables** y **expresiones** que serán evaluadas al ponerlas dentro de **`${ }`**. También se respetan los **saltos de línea**, tabuladores, etc que haya dentro. Ejemplo:

```js linenums="1"
let edad=25;

console.log(
`El usuario tiene:

${edad} años`)
```

Mostrará en la consola:
> El usuario tiene:

> 25 años

### Boolean

Los valores booleanos son **`true`** y **`false`**. Para convertir algo a booleano se usar **Boolean(valor)** aunque también puede hacerse con la doble negación (**`!!`**). Cualquier valor se evaluará a _`true`_ excepto `0`, `NaN`, `null`, `undefined` o una cadena vacía (`''`) que se evaluarán a _`false`_.

Los operadores lógicos son **`!`** (negación), **`&&`** (and), **`||`** (or).

Para comparar valores tenemos **`==`** y **`===`**. La triple igualdad devuelve _`true`_ si son igual valor y del mismo tipo. Como *Javascript* hace conversiones de tipos automáticas, conviene usar la **`===`** para evitar cosas como:

* `'3' == 3` true
* `3 == 3.0` true
* `0 == false` true
* `'' == false` true
* `' ' == false` true
* `[] == false` true
* `null == false` false
* `undefined == false` false
* `undefined == null` true

También existen dos operadores de _diferente_: **`!=`** y **`!==`** que se comportan de forma similar a los anteriores.

Los operadores relacionales son **`>`**, **`>=`**, **`<`**, **`<=`**. Cuando se compara un número y una cadena ésta se convierte a número y no al revés (`23 > '5'` devuelve _true_, aunque `'23' < '5'` devuelve _false_) 

## Control de flujo

### `if`

El **if** es como en la mayoría de lenguajes. Puede tener asociado un **else** y pueden concatenarse varias condiciones con **else if**.

```javascript
if (condicion) {
    ...
} else if (condicion2) {
    ...
} else if (condicion3) {
    ...
} else {
    ...
}
```

Ejemplo:

```js linenums="1"
if (edad < 18) {
    console.log('Es menor de edad');
} else if (edad > 65) {
    console.log('Jubilación');
} else {
    console.log('Edad correcta');
}
```

### Operador ternario

Es una forma abreviada de hacer un **`if`**. Se compone de la condición, seguida de un signo de interrogación **`?`**, seguida de la expresión que se ejecutará si la condición es _`true`_, seguida de dos puntos **`:`** y la expresión que se ejecutará si la condición es _`false`_.

Sintaxis:

```javascript
(condicion) ? expresionTrue : expresionFalse;
```

Ejemplo:

```javascript
let esMayorDeEdad = (edad>18) ? "mayor" : "menor";
```

### `switch`

El **`switch`** es una forma de simplificar un **`if`** cuando se tienen muchas condiciones. Se evalúa una expresión y se ejecuta el bloque de código que corresponda al valor de la expresión.

Hay que poner _`break`_ al final de cada bloque para que no continúe evaluando las siguientes condiciones. Si no se pone _`break`_ se ejecutarán todas las sentencias que haya debajo de la condición que se cumpla.

```js linenums="1"
switch(colorLetra) {
    case 'blanco':
    case 'amarillo':    // Ambos colores entran aquí
        colorFondo = 'azul';
        break;
    case 'azul':
        colorFondo = 'amarillo';
        break;
    default:            // Para cualquier otro valor
        colorFondo = 'negro';
}
```

*Javascript* permite que los _case_ en lugar de evaluar valores pueda evaluar condiciones lógicas.

```js linenums="1"
switch (true) {
    case age < 18:
        console.log('Eres muy joven para entrar');
        break;
    case age < 65:
        console.log('Puedes entrar');
        break;
    default:
        console.log('Eres muy mayor para entrar');
}
```

## Bucles

### _while_

Realiza el bloque de operaciones mientras se cumpla la condición indicada. Se ejecuta 0 o más veces.

Sintaxis:

```javascript
while (condicion) {
    // sentencias
}
```

Ejemplo:

```js linenums="1"
var value = 1;
while (value <= 5) { // Imprime 1 2 3 4 5
    console.log(value++);
}
```

### _do .. while_

Igual que _while_ pero se ejecuta, al menos, 1 o más veces.

Sintaxis:

```javascript
do {
    // sentencias
} while (condicion)
```

Ejemplo:

```js linenums="1"
var value = 1;
do { // Imprime 1 2 3 4 5
    console.log(value++);
} while (value <= 5);
```

### for

La forma típica de utilizar un bucle `for`, es creando una variable **contador** que controla las veces que se ejecuta bucle:

Sintaxis:

```javascript
for (inicialización; condición; incremento) {
    // sentencias
}
```

Ejemplo:

```js linenums="1"
let datos = [5, 23, 12, 85]
let sumaDatos = 0;

for (let i = 0; i < datos.length; i++) {
    sumaDatos += datos[i];
}  
// El valor de sumaDatos será 125
```

### for .. in

El bucle se ejecuta una vez para cada elemento del un array (o propiedad de un objeto) y se crea una variable contador que toma como valores la posición del elemento en el array.

Sintaxis:

```javascript
for (let contador in array) {
    // sentencias
}
```

Ejemplo:

```js linenums="1"
let datos = [5, 23, 12, 85]
let sumaDatos = 0;

for (let indice in datos) {
    sumaDatos += datos[indice];     // los valores que toma indice son 0, 1, 2, 3
}  
// El valor de sumaDatos será 125
```

También sirve para recorrer las propiedades de un objeto:

```js linenums="1"
let profe = {
    nom: 'Juan',
    ape1: 'Pla',
    ape2: 'Ruiz'
}

let nombre = '';

for (var campo in profe) {
   nombre += profe.campo + ' '; // o profe[campo];
}  
// El valor de nombre será 'Juan Pla Ruiz'
```

### for .. of

Es similar al _`for .. in`_ pero la variable contador en vez de tomar como valor cada índice toma cada elemento. Es nuevo en ES2015:

Sintaxis:

```javascript
for (let valor of array) {
    // sentencias
}
```

Ejemplo:

```js linenums="1"
let datos = [5, 23, 12, 85]
let sumaDatos = 0;

for (let valor of datos) {
    sumaDatos += valor;       // los valores que toma valor son 5, 23, 12, 85
}  
// El valor de sumaDatos será 125
```

También sirve para recorrer los caracteres de una cadena de texto:

```js linenums="1"
let cadena = 'Hola';

for (let letra of cadena) {
    console.log(letra);     // los valores de letra son 'H', 'o', 'l', 'a'
}  
```

## Buenas prácticas

*Javascript*  permite hacer muchas cosas que otros lenguajes no, por lo que se debe tener especial cuidado para no cometer errores de los que suele avisar.

### 'use strict'

Si ponemos siempre esta sentencia al principio de nuestro código el intérprete nos avisará si usamos una variable sin declarar (muchas veces por equivocarnos al escribir su nombre), principalmente se evitan errores de este tipo:
  
```javascript
'use strict';
let x = 3;
y = 4;  // Error: y is not defined
```

### Variables

Algunas de las prácticas que deberíamos seguir respecto a las variables son:

* Elegir un buen nombre es fundamental. Evitar abreviaturas o nombres sin significado (`a`, `b`, `c`, etc.)
* Evitar en lo posible variables globales.
* Usar _let_ para declarar variables y _const_ para constantes.
* Declarar todas las variables al principio.
* Inicializar las variables al declararlas.
* Evitar conversiones de tipo automáticas.
* Usar la notación _camelCase_ para los nombres de las variables.
* Utilizar nombres en inglés siempre que sea posible.

También es conveniente, por motivos de eficiencia no usar objetos `Number`, `String` o `Boolean` sino los tipos primitivos (no usar `let numero = new Number(5)` sino `let numero = 5`) y lo mismo al crear arrays, objetos o expresiones regulares (no usar `let miArray = new Array()` sino `let miArray = []`).

### Constantes

Se puede aplicar lo visto en el apartado anterior a las constantes, excepto en el nombre que se recomienda que sea en mayúsculas y con guiones bajos para separar palabras. Ejemplo:

```javascript
const PI = 3.14159;
const MAXIMO_INTENTOS = 3;
```

### Otras

Algunas reglas más que se deben seguir son:

* Ser coherentes a la hora de escribir código: por ejemplo podemos poner (recomendado) o no espacios antes y después del `=` en una asignación pero debemos hacerlo siempre igual. Existen muchas guías de estilo como por ejemplo:
    - [Google](https://google.github.io/styleguide/javascriptguide.xml).
    - [Idiomatic](https://github.com/rwaldron/idiomatic.js).
    - [Airbnb](https://github.com/airbnb/javascript).
    
    Para obligarnos a seguir las reglas podemos usar alguna herramienta [_linter_](https://www.codereadability.com/what-are-javascript-linters/).

* Es conveniente para mejorar la legibilidad de nuestro código separar las líneas de más de 80 caracteres.
* Usar `===` en las comparaciones.
* Dar un valor por defecto a las variables.
* **Comentar el código** cuando sea necesario, pero mejor que sea lo suficientemente claro como para no necesitar comentarios.
* No mezclar espacios y tabuladores para la indentación.
* Evitar código muerto (código que no se ejecuta) o duplicado.

### Clean Code

Estas y otras muchas recomendaciones se recogen el el libro [Clean Code](https://books.google.es/books?id=hjEFCAAAQBAJ&dq=isbn:9780132350884&hl=es&sa=X&ved=0ahUKEwik8cfJwdLpAhURkhQKHcWBAxgQ6AEIJjAA) de _Robert C. Martin_ y en muchos otros libros y artículos. Aquí tenéis un pequeño resumen traducido al castellano:
- [https://github.com/devictoribero/clean-code-javascript](https://github.com/devictoribero/clean-code-javascript)
