# 1.5 _Callbacks_ y promesas

## Callbacks

Este concepto es fundamental para dotar a _Node.js_ (y a _Javascript_ en general) de un comportamiento asíncrono.

Por "comportamiento asíncrono" se entiende que, se llama a una función, y se le deja indicado lo que tiene que hacer cuando termine, y mientras tanto el programa continúa ejecutándose.

Un ejemplo lo tenemos con la función `setTimeout()` de _Javascript_. A esta función le podemos indicar una función a la que llamar, y un tiempo (en milisegundos) que esperar antes de llamarla. Ejecutada la línea de la llamada a _setTimeout_, el programa sigue su curso y cuando el tiempo expira, se llama a la función callback indicada.

En el siguiente ejemplo, se muestra cómo se ejecuta el código de forma secuencial, pero la función `callback()` se ejecuta después de 2 segundos:

```js linenums="1" title="callback.js"
function callback() {
  console.log("callback() llamado")
}

setTimeout(callback, 2000)
console.log("Fin?")
```

Si ejecutamos el ejemplo, veremos que el primer mensaje que aparece es el de "`Fin?`", y pasados dos segundos, aparece el mensaje de "`callback() llamado`". Es decir, hemos llamado a `setTimeout` y el programa ha seguido su curso después, ha escrito "`Fin?`" en la consola y, una vez ha pasado el tiempo estipulado, se ha llamado al _callback_ para hacer su trabajo.
Utilizaremos _callbacks_ ampliamente durante este curso. De forma especial para procesar el resultado de algunas promesas que emplearemos (se verán a continuación), o el tratamiento de algunas peticiones de servicios.

## Promesas

Las promesas son un mecanismo para resolver el problema de asincronía de una forma mucho más elegante y práctica que utilizando funciones _callback_ directamente.

!!! note "Concurrencia"
    Los intérpretes de _Javascript_ suelen ser mono-hilo, es decir, sólo pueden ejecutar una tarea a la vez. Por lo que simulan el trabajo en paralelo mediante la concurrencia, alternando la ejecución de tareas.

Las promesas pueden tener varios estados:

- **`pending`**. (Pendiente) **Estado inicial** de la promesa, antes de ser resuelta o rechazada.
- **`fulfilled`**. (Resuelta) La promesa **se cumple con éxito** y se **resuelve**.
- **`rejected`**. (Rechazada) La promesa **falla** y se **rechaza**.

Con estas sencillas bases, podemos entender el funcionamiento de una promesa en _Javascript_. Antes de empezar, también debemos tener claro que las promesas son objetos, y podemos crearlas y consumirlas.

- **Crearlas**: preparar una función para que use promesas y se puedan consumir.
- **Consumirlas**: utilizar las promesas que hemos creado.

Las promesas en _Javascript_ se representan a través del objeto **`Promise`**, y cada promesa estará en un estado concreto: `pending`, `fulfilled` o `rejected`. Además, cada promesa tiene los siguientes métodos, que podremos utilizar para trabajar con ellas:

- **`.then(resolve)`**: ejecuta la función _callback_ `resolve` cuando la promesa se cumple.
- **`.catch(reject)`**: ejecuta la función _callback_ `reject` cuando la promesa se rechaza.
- **`.then(resolve, reject)`**: Método equivalente a los dos anteriores contenido en un solo método.
- **`.finally()`**: ejecuta la función _callback_ `finally` cuando la promesa se cumple o si se rechaza.

## Consumir promesas

La forma general de consumir una promesa es utilizando el `.then()` con un sólo parámetro, puesto que muchas veces lo único que nos interesa es realizar una acción cuando la promesa se cumpla:

```js linenums="1" title="Ejemplo de promesa"
let promesa = new Promise(resolve => 
  setTimeout(
    () => resolve('¡Promesa cumplida!'),
    2000
  )
);

promesa.then(mensaje => {
  console.log(mensaje)
})
```

Lo que vemos en el ejemplo anterior es que se crea una promesa que se cumple a los 2 segundos, y cuando se cumple, se ejecuta la función _callback_ que muestra el mensaje por consola.

Para tratar el caso de que la promesa se rechace, se utiliza el método `.catch()`:

```js linenums="1" title="Ejemplo de promesa rechazada"
let promesa = new Promise((resolve, reject) => 
  setTimeout(
    () => reject('¡Promesa rechazada!'),
    2000
  )
);

promesa
  .then(mensaje => console.log(`Promise Resolved: ${mensaje}`))
  .catch(error => console.error(`Promise Rejected: ${error}`))

// Promise Rejected: ¡Promesa rechazada!
```

Observa como hemos indentado los métodos `.then()` y `.catch()`, ya que se suele hacer así para que sea mucho más legible. Además, se pueden encadenar varios `.then()` si se siguen generando promesas y se devuelven con un return:

```js linenums="1" title="Encadenar promesas"
let promesa = new Promise(resolve => 
  setTimeout(
    () => resolve('¡Promesa cumplida!'),
    2000
  )
);

promesa
  .then(mensaje => {
    console.log(`Promise Resolved: ${mensaje}`);
    return '¡Segunda promesa!';
  })
  .then(mensaje => {
    console.log(`Promise Resolved: ${mensaje}`);
    return '¡Tercera promesa!';
  })
  .then(mensaje => console.log(`Promise Resolved: ${mensaje}`))
  .catch(error => console.error(`Promise Rejected: ${error}`))
```

Se añade el método `.finally()` para añadir una función de retorno (_callback function_) que se ejecutará tanto si la promesa se cumple o se rechaza, lo que nos ahorrará tener que repetir la función en el `.then()` como en el `.catch()`.

### Código asíncrono

Algo muy importante, pero que quizás hemos pasado por alto es que el código que ejecutamos en el interior de un `.then()` es código asíncrono **no bloqueante**:

- **Asíncrono**: Porque no se ejecuta inmediatamente, sino cuando la promesa se cumple.
- **No bloqueante**: Porque mientras espera ser ejecutado, no bloquea el resto del programa.

Cuando llegamos a un `.then()`, el sistema no se bloquea, sino que deja la función en estado `pending` hasta que se cumpla la promesa, pero mientras, continua procesando el resto del programa.

Observa el siguiente ejemplo:

```js linenums="1" title="Código asíncrono"
let promesa = new Promise(resolve => 
  setTimeout(
    () => console.log('1. Código asíncrono'),
    2000
  )
);

promesa.then();

console.log("2. Código síncrono")
```

Aunque el `console.log("Código asíncrono")` aparezca unas líneas antes del `console.log("Código síncrono")`, se mostrará más tarde. Esto ocurre porque el `console.log()` del interior del `.then()` no ocurre inmediatamente, y al no ser bloqueante, se continua con el resto del programa hasta que se ejecute, que lo retomará.

## Crear promesas

Ya hemos visto algunos ejemplos de cómo consumir promesas, donde se veía cómo se creaban y se consumían. Ahora vamos a ver cómo se crean.

Para crear una promesa se utiliza el objeto `Promise`, de la siguiente forma `new Promise((resolve, reject) => { })` se le pasa por parámetro una función anónima con dos parámetros de _callback_:

- **`resolve`**. Lo utilizaremos cuando se cumpla la promesa.
- **`reject`**. Lo utilizaremos cuando se rechace la promesa.

Ejemplo de creación de una promesa:

```js linenums="1" title="Crear promesa"
/**
 * Ejemplo donde se va llenando un array con números aleatorios
 * simulando lanzamientos de un dado de 6 caras.
 * 
 * Si aparece un 6 se rechaza la promesa.
 * Si se termina el bucle se resuelve la promesa.
 * 
 * @param {number} iterations - Número de iteraciones a realizar.
 * @returns {Promise} Promesa que se resuelve si no aparece un 6.
 */
const throwDices = (iterations) => {
  return new Promise((resolve, reject) => {
    const numbers = [];

    for (let i = 0; i < iterations; i++) {
      const number = 1 + Math.floor(Math.random() * 6);
      numbers.push(number);
      if (number === 6) {
        reject({
          error: true,
          value: numbers,
          message: 'Se ha sacado un 6"'
        });
        break
      }
    }

    resolve({
      error: false,
      value: numbers
    });
  })  // new Promise
} // throwDices
```

Como se puede observar, la función `throwDices()` devuelve una promesa que se rechaza si en algún momento se saca un `6`, y se resuelve si se termina el bucle.

```js linenums="1" title="Consumir promesa"
throwDices(10)
  .then(result => console.log(`Tiradas correctas: ${result.value}`))
  .catch(err => console.error(`Error: ${err.value} - ${err.message}`))
```

Imagina el caso de que cada lanzamiento del dado (la parte donde genera el número aleatorio) fuera un proceso más costoso que tardara un tiempo considerable, como una petición a un servidor, o una operación de cálculo muy pesada. En ese caso, el código sería bloqueante y la mejor opción sería realizarlo de forma asíncrona, controlada por promesas.

### Ejemplo de promesa con `fetch()`

En el siguiente ejemplo, se muestra cómo se puede utilizar una promesa para realizar una petición a un servidor y obtener los datos de un fichero JSON.

Utiliza fetch para realizar una petición a un servidor y obtener los datos de un fichero JSON. Si la petición se realiza correctamente, se muestra el contenido del fichero JSON. Si no, se muestra un mensaje de error.

Se utiliza `performance.now()` para medir el tiempo que tarda en terminar la promesa.

```js linenums="1" title="promise.js"
const CATFACT_ENDPOINT = 'https://catfact.ninja/fact'

console.log(`Esperando respuesta de ${CATFACT_ENDPOINT}...\n`)

const startTime = performance.now();

fetch(CATFACT_ENDPOINT)
  .then((response) => response.json() )
  .then((data) => {
    console.log(JSON.stringify(data, null, 2) + '\n')
    console.log(`FACT: ${data.fact}`);
  })
  .catch((error) => console.error(error))
  .finally(() => {
    const endTime = performance.now()
    console.log(`\nTiempo total de ejecución: ${endTime - startTime} ms`)
  })
```

<!-- ```json title="[Resultado](https://catfact.ninja/fact)"
{
  "fact": "The average lifespan of an outdoor-only cat is about 3 to 5 years while an indoor-only cat can live 16 years or much longer.",
  "length": 124
}
``` -->

## Async/Await

El uso de promesas es muy útil, pero a veces puede resultar complicado de leer y entender, especialmente cuando se encadenan muchas promesas. Para facilitar la lectura y escritura de código asíncrono, se introdujo en _ECMAScript 2017_ la sintaxis `async/await`.

Con `async`/`await` seguimos manejando promesas, sin embargo, hay ciertos cambios importantes:

- El código se vuelve **más legible**, ya que se parece más a código síncrono.
- Se puede utilizar `try`/`catch` para gestionar los errores de una forma más cómoda.
- Se puede utilizar `await` para esperar a que se cumpla una promesa, y así evitar el uso de `.then()`.

La palabra clave `await` se utiliza para esperar a que se cumpla una promesa, y así evitar el uso de `.then()`.

La palabra clave `async` se utiliza para definir una función asíncrona, que devolverá una promesa.

```js
async function fetchUsers() {
  const response = fetch('https://jsonplaceholder.typicode.com/users')
  const data = await response
  const json = await data.json()
  console.log(json)
}

fetchUsers()  // no bloqueante

console.log('Fin')
```


<!-- ```json title="[Resultado](https://jsonplaceholder.typicode.com/users')"
  [
    {
      "id": 1,
      "name": "Leanne Graham",
      "username": "Bret",
      "email": "Sincere@april.biz",
      "address": {
        "street": "Kulas Light",
        "suite": "Apt. 556",
        "city": "Gwenborough",
        "zipcode": "92998-3874",
        "geo": {
          "lat": "-37.3159",
          "lng": "81.1496"
        }
      },
      "phone": "1-770-736-8031 x56442",
      "website": "hildegard.org",
      "company": {
        "name": "Romaguera-Crona",
        "catchPhrase": "Multi-layered client-server neural-net",
        "bs": "harness real-time e-markets"
      }
    },
``` -->

Lo que hace `await` (dentro de la función) es detener la ejecución y no continuar. Se espera a que se resuelva la promesa, y hasta que no lo haga, no continua.

`await` sólo se puede utilizar dentro de una función `async`, y si se utiliza fuera de ella, se producirá un error.

```
Uncaught SyntaxError: await is only valid in async functions and the top level bodies of modules
```

Sin embargo, vamos a pararnos un poco a pensar esto desde las bases. Definamos dos funciones básicas exactamente iguales, ambas devuelven lo mismo, pero una es síncrona y otra asíncrona:

```js
function sincrona() { return 42 }
async function asincrona() { return 42 }

console.log(sincrona())   // 42
console.log(asincrona())  // Promise { 42 }
```

En el caso de la función `sincrona()` **devuelve el valor**, sin embargo, en el caso de la función `asincrona()` **devuelve una promesa** que se ha cumplido inmediatamente, con el valor `42`.

Si queremos reescribirlas como _arrow function_, se definiría como vemos a continuación, colocando el `async` justo antes de los parámetros de la _arrow function_:

```js
const sincrona = () => 42
const asincrona = async () => 42
```

### Await/Async + .then()

En algunos casos, como al usar un `fetch()`, donde tenemos que manejar dos promesas, es posible que nos interese utilizar `.then()` para la primera promesa y `await` para la segunda. De esta forma podemos manejarlo todo directamente, sin tener que guardarlo en constantes o variables temporales que no utilizaremos sino una sola vez:

```js
const USERS_ENDPOINT = 'https://jsonplaceholder.typicode.com/users'

async function requestFirstUser(url) {
  const response = await fetch(url).then(response => response)  
  const user = await response.json()
  return user[0]
}

requestFirstUser(USERS_ENDPOINT)
  .then(data => console.log(data))
  .catch(error => console.error(error))
```

En este caso, observa que se utiliza `.then()` para recibir la respuesta de la petición, pero `await` para esperar a que se resuelva la promesa y obtener los datos en formato JSON.

### Asincronía en async/await

Volvamos al ejemplo de las tiradas de dados. La función `throwDices()` realiza 10 lanzamientos de un dado y nos devuelve los resultados obtenidos o detiene la tarea si se obtiene un `6`. La implementación de la función sufre algunos cambios, simplificándose considerablemente.

- En primer lugar, añadimos la palabra clave `async` antes de los parámetros de la _arrow function_.
- En segundo lugar, desaparece cualquier mención a promesas, se devuelven directamente los objetos, ya que al ser una función `async` se devolverá todo envuelto en una _Promise_.

!!! note "Nombrar funciones asíncronas"
    Es una buena práctica nombrar las funciones asíncronas con el sufijo `Async`, para que sea más fácil identificarlas.

```js linenums="1" title="Crear promesa con async/await"
const throwDicesAsync = async (iterations) => {
  const numbers = [];

  for (let i = 0; i < iterations; i++) {
    const number = 1 + Math.floor(Math.random() * 6)
    numbers.push(number);
    if (number === 6) {
      return {
        error: true,
        value: numbers,
        message: "Se ha sacado un 6"
      };
    }
  }

  return {
    error: false,
    value: numbers
  };
}
```

Pero donde se introducen cambios considerables es en la forma de consumir la promesa, pues no podemos utilizar `await` fuera de una función `async`:

```js linenums="1" title="Consumir promesa con async/await"
const resultado = await throwDicesAsync(10)

// SyntaxError: await is only valid in async functions and the top level bodies of modules
```

Observa que el `await` se utiliza dentro de una función `async`, por lo que la función que lo contenga debe ser asíncrona:

```js linenums="1" title="Consumir promesa con async/await"
async function consumeAsync() {
  const result = await throwDices(10)
  if (!result.error) {
      console.log(`Tiradas correctas: ${result.value}`)
  } else {
      console.error(`Error: ${result.value} - ${result.message}`)
  }
}

consumeAsync()
```

En este caso, la función `throwDicesAsync()` es asíncrona, y por tanto, puede utilizar `await` para esperar a que se cumpla la promesa.

### Manejo de errores

Tanto en las promesas como en las funciones `async`/`await`, se pueden manejar los errores `catch()`.

En el siguiente ejemplo, se muestra cómo se manejan los errores en una promesa y en una función `async`:

```js linenums="1" title="Manejo de errores"
const throwDicesPromise = (iterations) => {
  return new Promise((resolve, reject) => {
    const numbers = []

    for (let i = 0; i < iterations; i++) {
      const number = Math.floor(Math.random() * 6) + 1
      numbers.push(number)

      if (number === 6) {
        reject("Se ha sacado un 6")
      }
    }

    resolve(numbers)
  })
}

const throwDicesAsync = async (iterations) => {
    const numbers = []

    for (let i = 0; i < iterations; i++) {
      const number = Math.floor(Math.random() * 6) + 1
      numbers.push(number)

      if (number === 6) {
        throw new Error('Se ha sacado un 6')
      }
    }

    return numbers
}

throwDicesPromise(5)
  .then((data) => console.log(`Tiradas correctas ${data}`))
  .catch((error) => console.error(`${error}`))

throwDicesAsync(5)
  .then((data) => console.log(`Tiradas correctas ${data}`))
  .catch((error) => console.error(`${error}`))
```

Se puede observar que el manejo de errores es muy similar en ambos casos, y se realiza con el método `.catch()` tanto si se rechaza la promesa como si se lanza un error.
