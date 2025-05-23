# 1.2 Funciones

Al igual que en otros lenguajes de programación, en _Javascript_ las funciones son **bloques de código reutilizable** que se pueden llamar para realizar una tarea específica. Permiten dividir el código en partes más pequeñas y fáciles de manejar, lo que facilita la lectura, el mantenimiento y la depuración del código.

Debemos tener en cuenta que las funciones pueden recibir parámetros de **entrada** y devolver valores de **salida**.

Al ser un lenguaje de tipado dinámico, no es necesario especificar el tipo de los parámetros o el tipo de retorno, por lo que se pueden pasar diferentes tipos de datos a las funciones, lo que las hace muy **flexibles** pero también puede llevar a errores si no se manejan adecuadamente.

Se pueden definir funciones de distintas maneras.

## Declaración de función

Se define la función con la palabra clave `function`, seguida del nombre de la función y paréntesis. Dentro de los paréntesis se pueden incluir parámetros.

```js linenums="1" title="Declaración de función"
function nombreFuncion(parametro1, parametro2) {
    // Código a ejecutar
}
```

## Expresión de función

Se define la función como una expresión, que puede ser anónima o nombrada.

```js linenums="1" title="Expresión de función"
const nombreFuncion = function(parametro1, parametro2) {
    // Código a ejecutar
};
```

## Funciones flecha `() => {}`

Son una forma más concisa de escribir funciones en _Javascript_, introducidas en _ES2015_. Se definen utilizando la sintaxis de flecha **`=>`**.

También son conocidas como _arrow functions_, funciones anónimas o funciones lambda.

```js linenums="1" title="Función flecha"
const nombreFuncion = (parametro1, parametro2) => {
    // Código a ejecutar
};
```

Si la función solo contiene una línea de código, se puede omitir el bloque `{ }` y la palabra clave `return`.

```js linenums="1" title="Función flecha abreviada"
const nombreFuncion = (parametro1, parametro2) => resultado;
```

Además, si la función **sólo tiene un parámetro**, se pueden omitir los paréntesis.

```js linenums="1" title="Función flecha abreviada con un solo parámetro"
const nombreFuncion = parametro => resultado;
```

### Comparación de declaración de funciones

En los siguientes ejemplos se muestran diferentes formas de declarar una función que suma dos números. Todas las formas son equivalentes y devuelven el mismo resultado.

```js linenums="1" title="Declaración de función"
function sumar(a, b) {
    return a + b;
}

// uso
sumar(5, 3); // Devuelve: 8
```

```js linenums="1" title="Expresión de función"
const sumar = function(a, b) {
    return a + b;
};

// uso
sumar(5, 3); // Devuelve: 8
```
  
```js linenums="1" title="Función flecha"
const sumar = (a, b) => {
  return a + b;
};

// uso
sumar(5, 3); // Devuelve: 8
```

```js linenums="1" title="Función flecha abreviada. Esta forma es válida si la función solo tiene una línea de código"
const sumar = (a, b) => a + b;

// uso
sumar(5, 3); // Devuelve: 8
```

```js linenums="1" title="Función flecha abreviada con un solo parámetro"
const incrementar = a => a + 1;

// uso
incrementar(5); // Devuelve: 6
```

## Llamar a una función

Para ejecutar una función, se utiliza su nombre seguido de paréntesis. Si la función tiene parámetros, se deben pasar los argumentos correspondientes.

```js linenums="1" title="Llamada a una función"
nombreFuncion(arg1, arg2);
```

## Parámetros y argumentos

Los parámetros son variables que se definen en la declaración de la función, mientras que los argumentos son los valores que se pasan a la función al momento de llamarla.

```js linenums="1" title="Ejemplo de parámetros y argumentos"
function saludar(nombre) {   // parámetro: nombre
    console.log(`Hola, ${nombre}!`);
}

saludar('Juan'); // argumento: 'Juan'
```

Si no se pasan argumentos, los parámetros tendrán el valor `undefined`.

### Acceso a los parámetros

Dentro de la función, se puede acceder a los parámetros como si fueran variables locales, pero también se puede utilizar el array `arguments` para acceder a todos los argumentos pasados a la función.

```js linenums="1" title="Ejemplo de acceso a los argumentos"
function mostrarArgumentos() {
    console.log(arguments.length);
    console.log(arguments);
}

mostrarArgumentos(1, 2, 3); // Salida: 3, [1, 2, 3]
```

### Parámetros por defecto

Se pueden establecer valores por defecto para los parámetros en caso de que no se pasen argumentos al llamar a la función.

```js linenums="1" title="Ejemplo de parámetros por defecto"
function saludar(nombre = 'invitado') {
    console.log(`Hola, ${nombre}!`);
}

saludar();      // Hola, invitado!
saludar('Ana'); // Hola, Ana!
```

## Retorno de valores

Las funciones pueden devolver valores utilizando la palabra clave `return`. Cuando se encuentra un `return`, la ejecución de la función se detiene y se devuelve el valor especificado.

```js linenums="1" title="Ejemplo de retorno de valores"
function sumar(a, b) {
    return a + b;
}

console.log(sumar(5, 3)); // Salida: 8
```

```js linenums="1" title="Ejemplo de uso del retorno"
function saludar(nombre) {
    return `Hola, ${nombre}!`;
}

let saludo = saludar('Juan');

console.log(saludo); // Salida: Hola, Juan!
```

```js linenums="1" title="Ejemplo de retorno de valores"
function calcularAreaRectangulo(base, altura) {
    return base * altura;
}

const area = calcularAreaRectangulo(5, 10);

console.log(area); // Salida: 50
```

## Funciones como parámetros

Las funciones también pueden ser pasadas como argumentos a otras funciones. Esto permite crear funciones más flexibles y reutilizables.

```js linenums="1" title="Ejemplo de funciones como parámetros"
function operar(a, b, operacion) {
    return operacion(a, b);
}

function sumar(x, y) {
    return x + y;
}

function restar(x, y) {
    return x - y;
}

console.log(operar(5, 3, sumar)); // Salida: 8
console.log(operar(5, 3, restar)); // Salida: 2
```

## Funciones anónimas

Las funciones anónimas son funciones que no tienen un nombre. Se utilizan comúnmente como argumentos de otras funciones o en expresiones de función.

```js linenums="1" title="Ejemplo de función anónima"
// setTimeout() ejecuta la función después de un cierto tiempo
// se le pasa una función anónima como primer argumento
// y el tiempo en milisegundos como segundo argumento

setTimeout(function() {
    console.log('Hola después de 2 segundos');
}, 2000);
```

```js linenums="1" title="Ejemplo de función anónima con función flecha"
setTimeout(
    () => console.log('Hola después de 2 segundos'),
    2000);
```

## Funciones recursivas

Las funciones recursivas son aquellas que se llaman a sí mismas. Se utilizan para resolver problemas que pueden ser divididos en subproblemas más pequeños.

```js linenums="1" title="Ejemplo de función recursiva"
function factorial(n) {
    if (n === 0) {
        return 1;
    }
    return n * factorial(n - 1);
}

console.log(factorial(5)); // Salida: 120
```

Como se mencionó anteriormente, las funciones flecha son una forma más concisa de escribir funciones en _Javascript_. A continuación, se muestra el ejemplo anterior utilizando una función flecha. Aunque en este ejemplo puede resultar menos legible.

```js linenums="1" title="Ejemplo de función recursiva abreviada"
const factorial = n => n === 0 ? 1 : n * factorial(n - 1);

console.log(factorial(5)); // Salida: 120
```

!!!warning "Recursión"
    Se recomienda tener cuidado con las funciones recursivas, ya que pueden llevar a un desbordamiento de pila si no se manejan adecuadamente. Por lo que es buena práctica evitar la recursión, y si es posible, buscar una solución iterativa.

## Alcance de las funciones

El alcance de una función se refiere a la visibilidad de las variables dentro de la función. Las variables definidas dentro de una función son locales y no son accesibles fuera de ella.

```js linenums="1" title="Ejemplo de alcance de funciones"
function ejemplo() {
    let x = 10; // Variable local
    console.log(x);
}

ejemplo(); // Salida: 10
console.log(x); // Error: x is not defined
```

## Funciones de orden superior

Las funciones de orden superior son aquellas que pueden recibir otras funciones como argumentos o devolver funciones como resultado. Esto permite crear patrones de programación más avanzados.

```js linenums="1" title="Ejemplo de función de orden superior"
function crearMultiplicador(factor) {
    return function(x) {
        return x * factor;
    };
}

const multiplicarPor2 = crearMultiplicador(2);
console.log(multiplicarPor2(5)); // Salida: 10

const multiplicarPor3 = crearMultiplicador(3);
console.log(multiplicarPor3(5)); // Salida: 15
```
