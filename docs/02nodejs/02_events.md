# 2.2 Eventos en Node.js

## Introducción

Muchos objetos en _Node.js_ emiten eventos, por ejemplo:

- `net.Server` emite un evento cada vez que se establece una conexión.
- `fs.readStream` emite un evento cuando se abre un archivo.

Todos los objetos que emiten eventos son instancias de **`events.EventEmitter`**. Puede usar este módulo haciendo **require ("events")**

Puede adjuntar funciones a los objetos, para que se ejecuten cuando se genere un evento. Estas funciones se denominan oyentes o _listeners_.

## Módulo de eventos

Los eventos están en un módulo separado que tenemos que requerir en nuestros programas creados con _Node.js_. Lo hacemos con la instrucción "`require`":

```js
const events = require('events');
```

Dentro de este o módulo dispones de una serie de utilidades para trabajar con eventos. Primero veamos el emisor de eventos, que se encuentra en la propiedad **`EventEmitter`**:

```js
let EmisorEventos = events.EventsEmitter
```

## Definir un evento

En _Node.js_ existe un bucle de eventos, de manera que cuando se declara un evento, el sistema escucha a medida que ocurre, para luego ejecutar una función. Esta función se conoce como "_callback_" o como "_event handler_" y contiene el código que queremos que se ejecute cuando se produzca el evento al que lo hemos asociado.

Primero tendremos que instanciar un objeto de la clase `EventEmitter`, que hemos guardado en la variable `EmisorEventos` antes.

```js
let ee = new EmisorEventos();
```

Luego tendremos que usar el método **`on()`** para definir las funciones del manejador de eventos, o su equivalente **`addEventListener()`**. Para emitir un evento usamos el método **`emit()`**.

Por ejemplo, vamos a emitir un evento llamado "`datos`", con este código.

```js
ee.emit('datos', Date.now())
```

Ahora vamos a crear una función de controlador de eventos asociada con el evento definido en "`datos`".

```js
ee.on('datos', función (fecha) {
    console.log (fecha)
})
```


Si queremos aprovechar algunas de las características más interesantes de las aplicaciones de _Node.js_, puede ser útil usar `setInterval()` para que podamos ir enviando datos de vez en cuando:

```js
setInterval(function () {
    ee.emit('datos', Date.now())
}, 500);
```

Con esto ya habremos construido un ejemplo de _Node.js_ totalmente funcional. El código completo sería el siguiente:

```js linenums="1"
const events = require('events');

let EmisorEventos = events.EventEmitter;
let ee = new EmisorEventos();

ee.on('datos', function (fecha) {
    console.log(fecha)
})

setInterval(function () {
    ee.emit('datos', Date.now())
}, 500);
```

## Asociar eventos a objetos

Creamos una clase que define a una persona y vamos a hacer que esta persona tenga emisores de eventos asociados a la herencia.

```js linenums="1" title="persona.js"
const events = require('events')

class Person extends events.EventEmitter {
    constructor(name) {
        super()
        this.name = name
    }
}

let manu = new Person('Manu')
let boris = new Person('Boris')
let people = [manu, boris]

people.forEach(function(person) {
    person.on('talk', function(message) {
        console.log(person.name + ' says: ' + message)
    })
})

manu.emit('talk', 'I hope you study node')
boris.emit('talk', 'sure, I will')
```

De esta manera, cada vez que se emita el evento `talk`, se mostrará un mensaje en la consola con el nombre de la persona que ha emitido el evento y el mensaje que ha enviado.

