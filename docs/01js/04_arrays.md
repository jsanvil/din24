# 1.4 Arrays `[ ]`

## Introducción

En _Javascript_ un array es un objeto que permite almacenar una colección de datos. Los arrays son dinámicos, es decir, su tamaño puede cambiar en cualquier momento y pueden contener elementos de diferentes tipos (números, cadenas, objetos, etc.). 

Se recomienda crearlos usando notación JSON (corchetes) en vez de como instancias del objeto Array.

```js linenums="1" title="Ejemplo de creación de arrays"
let a = []
let b = [2,4,6]
```

aunque también podemos crearlos como instancias del objeto Array (NO recomendado):

```js linenums="1" title="Ejemplo de creación de arrays"
let a = new Array()        // a = []
let b = new Array(2,4,6)   // b = [2, 4, 6]
```

Sus elementos pueden ser de cualquier tipo, incluso podemos tener elementos de tipos distintos en un mismo array. Si no está definido un elemento su valor será _undefined_.

```js linenums="1" title="Ejemplo de arrays con diferentes tipos"
let a = ['Lunes', 'Martes', 2, 4, 6]

console.log(a[0])   // imprime 'Lunes'
console.log(a[4])   // imprime 6

a[7] = 'Juan'       // a = ['Lunes', 'Martes', 2, 4, 6, , , 'Juan']

console.log(a[7])   // imprime 'Juan'
console.log(a[6])   // imprime undefined
console.log(a[10])  // imprime undefined
```

Como hemos visto, acceder a un elemento que no existe no provoca un error, devuelve _`undefined`_, pero sí lo provoca acceder a un elemento de algo que no es un array.

!!! info "Operador `?.`"
    En ES2020 (ES11) se ha incluido el operador **`?.`** para evitar tener que comprobar nosotros que sea un array:

    ```javascript
    console.log(alumnos?.[0])
    // si alumnos es un array y tiene un elemento en la posición 0, muestra el elemento
    // y si no muestra undefined
    ```

### Arrays de objetos

Es habitual almacenar datos en arrays en forma de objetos (clave: valor).

```js linenums="1" title="Ejemplo de array de objetos"

let alumnos = [
  {
    id: 1,
    name: 'Marc Peris',
    course: '2nDAW',
    age: 21
  },
  {
    id: 2,
    name: 'Júlia Tortosa',
    course: '2nDAW',
    age: 23
  },
]
```

## Operaciones con Arrays

Vamos a ver los principales métodos y propiedades de los arrays.

### `Array.isArray()`

Es una función que devuelve `true` si el parámetro pasado es un array y `false` si no lo es.

```js linenums="1" title="Ejemplo de Array.isArray()"
let a = [2, 4, 6]
let b = 'Hola'
console.log(Array.isArray(a))   // imprime true
console.log(Array.isArray(b))   // imprime false
```

### `length`

Esta propiedad devuelve la longitud de un array.

```js linenums="1" title="Ejemplo de length"
let a = ['Lunes', 'Martes', 2, 4, 6]
console.log(a.length)  // imprime 5
```

Podemos reducir el tamaño de un array cambiando esta propiedad.

```js linenums="1" title="Ejemplo de cambio de length"
a.length = 3  // ahora a = ['Lunes', 'Martes', 2]
```

### `fill()`

Rellena todos los elementos de un array el valor pasado como parámetro. También se puede especificar el índice de inicio y fin.

```js linenums="1" title="Ejemplo de fill"
let a = [2, 4, 6, 1]
a.fill(0)         // a = [0, 0, 0, 0]

a = [2, 4, 6, 1]
a.fill(0, 1)      // a = [2, 0, 0, 0]

a = [2, 4, 6, 1]
a.fill(0, 1, 3)   // a = [2, 0, 0, 1]

a = [2, 4, 6, 1]
a.fill(0, -2)     // a = [2, 4, 0, 0]
```


### Añadir elementos `push()` y `unshift()`

Se pueden añadir elementos al final de un array con `push` o al principio con `unshift`. Ambos métodos devuelven la nueva longitud del array.

```js linenums="1" title="Ejemplo de añadir elementos"
let a = ['Lunes', 'Martes', 2, 4, 6]
a.push('Juan')   // ahora a = ['Lunes', 'Martes', 2, 4, 6, 'Juan']
a.unshift(7)     // ahora a = [7, 'Lunes', 'Martes', 2, 4, 6, 'Juan']
```

### Eliminar elementos `pop()` y `shift()`

Se puede borrar el elemento del final de un array con `pop` o el del principio con `shift`. Ambos métodos devuelven el elemento que ha sido eliminado.

```js linenums="1" title="Ejemplo de eliminar elementos"
let a = ['Lunes', 'Martes', 2, 4, 6]
let ultimo = a.pop()         // ahora a = ['Lunes', 'Martes', 2, 4] y ultimo = 6
let primero = a.shift()      // ahora a = ['Martes', 2, 4] y primero = 'Lunes'
```

### [`splice()`](https://developer.mozilla.org/es/docs/Web/JavaScript/Referencia/Objetos_globales/Array/splice)

Permite eliminar elementos de cualquier posición del array y/o insertar otros en su lugar. Devuelve un array con los elementos eliminados.

```js linenums="1" title="Sintaxis de splice"
Array.splice(inicio, cantidad de elementos a extraer, 1º elemento a insertar, 2º elemento a insertar, 3º...)
```

```js linenums="1" title="Ejemplo de splice"
let a = ['Lunes', 'Martes', 2, 4, 6]
let borrado = a.splice(1, 3)       // a = ['Lunes', 6] y borrado = ['Martes', 2, 4]

a = ['Lunes', 'Martes', 2, 4, 6]
borrado = a.splice(1, 0, 45, 56)   // a = ['Lunes', 45, 56, 'Martes', 2, 4, 6] y borrado = []

a = ['Lunes', 'Martes', 2, 4, 6]
borrado = a.splice(1, 3, 45, 56)   // a = ['Lunes', 45, 56, 6] y borrado = ['Martes', 2, 4]
```

### `slice()`

Devuelve un _subarray_ con los elementos indicados pero sin modificar el array original (sería como hacer un `substr` pero de un array en lugar de una cadena).

```js linenums="1" title="Sintaxis de slice"
Array.slice(posicion, num. de elementos a devolver)
```

```js linenums="1" title="Ejemplo de slice"
let a = ['Lunes', 'Martes', 2, 4, 6]
let subArray = a.slice(1, 3)       // ahora a = ['Lunes', 'Martes', 2, 4, 6] y subArray = ['Martes', 2, 4]
```

Es muy útil para hacer una copia de un array:

```js linenums="1"
let a = [2, 4, 6]
let copiaDeA = a.slice()       // ahora ambos arrays contienen lo mismo pero son diferentes arrays
```

### `toString()` y `join()`

Cada objeto (y los arrays son un tipo de objeto) tienen definido el método `.toString()` que lo convierte en una cadena. Este método es llamado automáticamente cuando, por ejemplo, queremos mostrar un array por la consola. En realidad `console.log(a)` ejecuta `console.log(a.toString())`. En el caso de los arrays esta función devuelve una cadena con los elementos del array dentro de corchetes y separados por coma.

Además podemos convertir los elementos de un array a una cadena con `.join()` especificando el carácter separador de los elementos. Si no se especifica, el separador por defecto es la coma (`,`).

```js linenums="1" title="Ejemplo de join"
let a = ['Lunes', 'Martes', 2, 4, 6]
let cadena = a.join('-')       // cadena = 'Lunes-Martes-2-4-6'
cadena = a.join()              // cadena = 'Lunes,Martes,2,4,6'
```

Este método es el contrario del `.split()` que convierte una cadena en un array.

```js linenums="1" title="Ejemplo de split"
let notas = '5-3.9-6-9.75-7.5-3'
let arrayNotas = notas.split('-')        // arrayNotas = [5, 3.9, 6, 9.75, 7.5, 3]
let cadena = 'Que tal estás'
let arrayPalabras = cadena.split(' ')    // arrayPalabras = ['Que`, 'tal', 'estás']
let arrayLetras = cadena.split('')       // arrayLetras = ['Q','u','e`,' ','t',a',l',' ','e',s',t',á',s']
```

### `sort()`

**Ordena** los elementos del array. Modifica el array original y la referencia del array modificado.

```js linenums="1" title="Ejemplo de sort"
let a = ['hola','adios','Bien','Mal',2,5,13,45]
let b = a.sort()       // b = [13, 2, 45, 5, "Bien", "Mal", "adios", "hola"]
```

También se puede pasar como **parámetro** una **función** que le decida cómo ordenar los elementos. La función recibe **dos parámetros** que son los **elementos a comparar** y **devuelve un número** que indica cómo se deben ordenar los elementos:

- Si la función devuelve un **número negativo**, el **primer elemento** se coloca antes que el segundo.
- Si la función devuelve un **número positivo**, el **segundo elemento** se coloca antes que el primero.
- Si la función devuelve **0**, no se cambia el orden.

```js linenums="1" title="Ejemplo de sort con función"
let a = ['hola','adios','Bien','Mal'];
let test = a.sort(function(elem1, elem2) {
  if (elem1.toLocaleLowerCase() < elem2.toLocaleLowerCase())
    return -1
  if (elem1.toLocaleLowerCase() > elem2.toLocaleLowerCase())
    return 1
  return 0
});       // b = ["adios", "Bien", "hola", "Mal"]
```

Como más se utiliza esta función es para ordenar arrays de objetos. Por ejemplo si tenemos un objeto _`alumno`_ con los campos _`name`_ y _`age`_, para ordenar un array de objetos _`alumno`_ por su edad haremos:

```js linenums="1" title="Ejemplo de sort con objetos"
let alumnos = [
  { id: 1, name: 'Javier', age: 21 },
  { id: 2, name: 'Júlia', age: 23 },
  { id: 3, name: 'Marc', age: 20 }
]

let alumnosOrdenado = alumnos.sort(function(alumno1, alumno2) {
  return alumno1.age - alumno2.age
})

console.log(alumnosOrdenado)

// let alumnos = [
//   { id: 3, name: 'Marc', age: 20 }
//   { id: 1, name: 'Javier', age: 21 },
//   { id: 2, name: 'Júlia', age: 23 },
// ]
```

Otra forma de hacerlo es usando _arrow functions_.

```js linenums="1" title="Ejemplo de sort con arrow function"
let alumnosOrdenado = alumnos.sort((alumno1, alumno2)  => alumno1.age - alumno2.age)
```

Si lo que queremos es ordenar por un campo de texto debemos usar la función _toLocaleCompare_.

```js linenums="1" title="Ejemplo de sort con toLocaleCompare"
let alumnos = [
  { id: 1, name: 'Javier', age: 21 },
  { id: 2, name: 'Júlia', age: 23 },
  { id: 3, name: 'Marc', age: 20 }
]

let alumnosOrdenado = alumnos.sort((alumno1, alumno2)  => alumno1.name.localeCompare(alumno2.name))

console.log(alumnosOrdenado)

// alumnosOrdenado = [
//   { id: 3, name: 'Marc', age: 20 },
//   { id: 1, name: 'Javier', age: 21 },
//   { id: 2, name: 'Júlia', age: 23 }
// ]
```

### `concat()`

Permite unir dos o más arrays. Devuelve un nuevo array.

```js linenums="1" title="Ejemplo de concat"
let a = [2, 4, 6]
let b = ['a', 'b', 'c']
let c = a.concat(b)       // c = [2, 4, 6, 'a', 'b', 'c']
```

### `reverse()`

Invierte el orden de los elementos de un array. Modifica el array original y devuelve el array modificado.

```js linenums="1" title="Ejemplo de reverse"
let a = [2, 4, 6]
let b = a.reverse()       // b = [6, 4, 2]
```

### `toReversed()`

Es similar a `reverse()`, pero no modifica el array original, sino que devuelve un nuevo array invertido.

### `indexOf()`

devuelve la primera posición del elemento pasado como parámetro o `-1` si no se encuentra en el array.

### `lastIndexOf()`

devuelve la última posición del elemento pasado como parámetro o `-1` si no se encuentra en el array.

### `includes()`

Devuelve `true` si el elemento pasado como parámetro se encuentra en el array o `false` si no

```js linenums="1" title="Ejemplo de includes"
let a = [2, 4, 6]
console.log(a.includes(4))   // imprime true
console.log(a.includes(5))   // imprime false
```

### `forEach()`

Podemos iterar por los elementos de un array usando el método `forEach`. De forma opcional, podemos llevar un seguimiento del índice al que está accediendo en cada momento, e incluso recibir el array como tercer parámetro.

Es importante recalcar que si se modifican los elementos de un array en un `foreach` los cambios no se guardan en el array, es decir, no podemos modificar el propio array dentro de un `foreach`.

```js linenums="1" title="Ejemplo de forEach() simple"
let a = [2, 4, 6]
a.forEach(function(elemento) {
  console.log(elemento)
})
```

```js linenums="1" title="Ejemplo de forEach() en forma de arrow function"
let a = [2, 4, 6]
a.forEach((elemento) => console.log(elemento))
```

```js linenums="1" title="Ejemplo de forEach() con índice"

let a = ['Lunes', 'Martes', 2, 4, 6]
a.forEach((elemento, indice) => {
  console.log(`Elemento en la posición ${indice}: ${elemento}`)
})
```

El parámetro array es opcional, pero puede ser útil si queremos acceder a otros elementos del array sobre el que estamos iterando.

```js linenums="1" title="Ejemplo de forEach() con array"
let a = [2, 4, 6]
a.forEach((elemento, indice, array) => {
  console.log(`Elemento en la posición ${indice}: ${elemento}`)
  console.log(`Siguiente elemento: ${array[indice + 1]}`)
  
  array[indice] = elemento * 2 // esto no modifica el array original
})
```

### `find()`

Devuelve el primer elemento que cumple con la condición especificada en la función de prueba, o `undefined` si no se encuentra ninguno.

```js linenums="1" title="Ejemplo de find"
let alumnos = [
  { id: 1, name: 'Marc', age: 21 },
  { id: 2, name: 'Júlia', age: 23 },
  { id: 3, name: 'Javier', age: 20 }
]

let alumno = alumnos.find(alumno => alumno.age < 22) // devuelve { id: 1, name: 'Marc', age: 21 }
```

### `filter()`

Devuelve un nuevo array con todos los elementos que cumplen la condición especificada en la función de prueba.

```js linenums="1" title="Ejemplo de filter()"
let alumnos = [
  { id: 1, name: 'Marc', age: 21 },
  { id: 2, name: 'Júlia', age: 23 },
  { id: 3, name: 'Javier', age: 20 }
]

let alumnosMenores = alumnos.filter(alumno => alumno.age < 22) // devuelve [{ id: 1, name: 'Marc', age: 21 }, { id: 3, name: 'Javier', age: 20 }]
```

### `every()`

Devuelve `true` si todos los elementos del array cumplen con la condición especificada en la función de prueba, o `false` si al menos uno no la cumple.

```js linenums="1" title="Ejemplo de every()"
let alumnos = [
  { id: 1, name: 'Marc', age: 21 },
  { id: 2, name: 'Júlia', age: 23 },
  { id: 3, name: 'Javier', age: 20 }
]

let todosMayores = alumnos.every(alumno => alumno.age >= 18) // devuelve true
```

### `some()`

Devuelve `true` si al menos un elemento del array cumple con la condición especificada en la función de prueba, o `false` si ninguno la cumple.

```js linenums="1" title="Ejemplo de some()"
let precios = [10, 20, 30]

let hayPreciosAltos = precios.some(precio => precio > 25) // devuelve true
```

### `map()`

Devuelve un nuevo array con los resultados de la función aplicada a cada elemento del array original.

```js linenums="1" title="Ejemplo de map()"
let precios = [10, 20, 30]

let preciosConIVA = precios.map(precio => precio * 1.21) // devuelve [12.1, 24.2, 36.3]
```

### `reduce()`

Ejecuta una **función reductora** sobre cada elemento del array, **devolviendo** como resultado **un único valor**.

Tiene dos parámetros:

- **Función reductora**: recibe cuatro parámetros: el **acumulador**, el **elemento actual**, el **índice** y el **array**.
- **Valor inicial del acumulador** (opcional).

```js linenums="1" title="Sintaxis de reduce"
arr.reduce(callback(acumulador, valorActual[, índice[, array]])[, valorInicial])
```

```js linenums="1" title="Ejemplo de reduce"
let precios = [10, 20, 30]
let valorInicial = 0

let total = precios.reduce(
  (acumulador, precio) => acumulador + precio,  // función reductora (primer parámetro)
  valorInicial)                                 // valor inicial del acumulador (segundo parámetro)

// total = 60
```

```js linenums="1"
let notas = [5, 3.9, 6, 9.75, 7.5, 3]

let media = notas.reduce((acumulador, nota, index, array) => acumulador + nota / array.length, 0)
// media = 5.858333333333333
```

### `reduceRight()`

Es similar a `reduce()`, pero itera sobre el array de derecha a izquierda.

```js linenums="1" title="Ejemplo de reduceRight"
let precios = [10, 20, 30]

let total = precios.reduceRight((acumulador, precio) => acumulador + precio, 0) // devuelve 60
```
