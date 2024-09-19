# 1.3 Objetos `{ }`

Em _Javascript_ un objeto es una **colección de propiedades**, donde cada propiedad es una asociación entre una **clave** (nombre) y un **valor**. Los objetos son una de las **estructuras de datos** más importantes en _Javascript_ y se utilizan para almacenar información relacionada.

## Creación de objetos

Existen varias formas de crear objetos en Javascript:

### Notación de objeto literal

La forma más sencilla de crear un objeto es utilizando la notación de objeto literal.

```js linenums="1" title="Ejemplo de objeto literal"
let persona = {
    nombre: 'Juan',
    edad: 30,
    ciudad: 'Madrid'
};
```

Otra forma de crear un objeto para agregar propiedades después es:

```js linenums="1" title="Ejemplo de constructor de objetos"
let persona = {};
persona.nombre = 'Juan';
persona.edad = 30;
persona.ciudad = 'Madrid';
```

### Constructor de objetos

También puedes crear objetos utilizando la función constructora `Object()`.

```js linenums="1" title="Ejemplo de constructor de objetos"
let persona = new Object();
persona.nombre = 'Juan';
persona.edad = 30;
persona.ciudad = 'Madrid';
```

### Constructor de funciones

Puedes definir un constructor de funciones para crear múltiples objetos con la misma estructura.

```js linenums="1" title="Ejemplo de constructor de funciones"
function Persona(nombre, edad, ciudad) {
    this.nombre = nombre;
    this.edad = edad;
    this.ciudad = ciudad;
}

let persona1 = new Persona('Juan', 30, 'Madrid');
let persona2 = new Persona('Ana', 25, 'Barcelona');
```

## Propiedades de objetos

Las propiedades de un objeto son pares clave-valor, donde la clave es una cadena y el valor puede ser cualquier tipo de dato.

### Acceso a propiedades

Puedes acceder a las propiedades de un objeto utilizando la notación de punto o la notación de corchetes. La notación de corchetes es útil cuando la clave es una variable o una cadena que no es un identificador válido.

```js linenums="1" title="Acceso a propiedades"
console.log(persona.nombre); // Notación de punto

console.log(persona['edad']); // Notación de corchetes

let clave = 'ciudad';
console.log(persona[clave]); // Acceso con variable
```

### Modificación de propiedades

Puedes modificar las propiedades de un objeto de la misma manera que accedes a ellas.

```js linenums="1" title="Modificación de propiedades"
persona.edad = 31; // Modificación con notación de punto
persona['ciudad'] = 'Valencia'; // Modificación con notación de corchetes
```

### Eliminación de propiedades

Puedes eliminar propiedades de un objeto utilizando la palabra clave `delete`. Esto elimina la propiedad y su valor asociado.

```js linenums="1" title="Eliminación de propiedades"
delete persona.edad; // Eliminar propiedad 'edad'
```

### Métodos

Los objetos también pueden tener métodos, propiedades que contienen funciones.

```js linenums="1" title="Métodos de objetos"
let persona = {
    nombre: 'Juan',
    edad: 30,
    saludar: function() {
        console.log(`Hola, mi nombre es ${this.nombre}`);
    }
};

persona.saludar(); // Salida: Hola, mi nombre es Juan
```

### Ejemplo completo

```js linenums="1" title="Ejemplo completo de objeto"
function Persona(nombre, edad, ciudad) {
    this.nombre = nombre;
    this.edad = edad;
    this.ciudad = ciudad;
    this.saludar = function() {
        console.log(`Hola, mi nombre es ${this.nombre}`);
    };
}

let persona1 = new Persona('Juan', 30, 'Madrid');
let persona2 = new Persona('Ana', 25, 'Barcelona');

persona1.saludar(); // Hola, mi nombre es Juan
persona2.saludar(); // Hola, mi nombre es Ana

persona1.edad = 31; // Modificar propiedad
console.log(persona1.edad); // 31

delete persona2.ciudad; // Eliminar propiedad
console.log(persona2.ciudad); // undefined
```

## .toString() y .valueOf()

Existen métodos predefinidos como `.toString()` y `.valueOf()`, que se utilizan para convertir un objeto a una cadena o a un valor primitivo, respectivamente.

```js linenums="1" title="Ejemplo de .toString()"
let persona = {
    nombre: 'Juan',
    edad: 30,
    toString: function() {
        return `${this.nombre}, ${this.edad} años`;
    }
};

console.log(persona.toString()); // Juan, 30 años
```

```js linenums="1" title="Ejemplo de .valueOf()"
let persona = {
    nombre: 'Juan',
    edad: 30,
    valueOf: function() {
        return this.edad;
    }
};

console.log(persona.valueOf()); // 30
```

## Destructuración de objetos

La destructuración de objetos es una forma de extraer valores de un objeto y asignarlos a variables.

```js linenums="1" title="Ejemplo de destructuración"
let persona = {
    nombre: 'Juan',
    edad: 30,
    ciudad: 'Madrid'
};

let { nombre, edad } = persona; // Destructuración, asigna nombre y edad a variables

console.log(nombre); // Juan
console.log(edad); // 30
```

También puedes asignar un **valor predeterminado** en caso de que la propiedad no exista o **renombrar** la variable.

- El valor predeterminado se asigna si la propiedad no está definida en el objeto.
- Renombrar la variable se hace con la sintaxis `nombre: nuevoNombre`.

```js linenums="1" title="Ejemplo de destructuración con renombrado y valor predeterminado"
let persona = {
    nombre: 'Juan',
    edad: 30,
    ciudad: 'Madrid'
};

let { nombre: name, edad, pais = 'España' } = persona;

console.log(name); // Juan
console.log(pais); // España
```

## Reestructuración de objetos

La reestructuración de objetos es el proceso de crear un nuevo objeto a partir de las propiedades de un objeto existente. Esto se puede hacer utilizando el operador de propagación (**`...`**).

```js linenums="1" title="Ejemplo de reestructuración"
let persona = {
    nombre: 'Juan',
    edad: 30,
    ciudad: 'Madrid'
};

let usuario = {
    ...persona,         // Reestructuración, copia las propiedades de persona
    pais: 'España',
    ocupacion: 'Desarrollador'
};
```

## Estructuras anidadas

Los objetos pueden contener otros objetos, lo que permite crear estructuras de datos más complejas.

```js linenums="1" title="Ejemplo de objeto anidado"
let persona = {
    nombre: 'Juan',
    edad: 30,
    direccion: {
        ciudad: 'Madrid',
        codigoPostal: '28001'
    }
};

console.log(persona.direccion.ciudad); // Salida: Madrid
```

## Serialización de objetos

La serialización es el proceso de **convertir un objeto en una cadena de texto**, lo que permite **almacenar** o **transmitir** el objeto. En _JavaScript_, se puede usar **`JSON.stringify(objeto)`** para serializar un objeto y **`JSON.parse(texto)`** para deserializarlo.

!!!note "Parsear"
    En lenguaje coloquial, "_**parsear**_" o "_**parseo**_" (del inglés _parse_) significa **deserializar**, es decir, convertir una cadena de texto en un objeto.

```js linenums="1" title="Ejemplo de serialización"
let persona = {
    nombre: 'Juan',
    edad: 30
};

let personaString = JSON.stringify(persona); // Serializar
// personaString = '{"nombre":"Juan","edad":30}'

let personaDeserializada = JSON.parse(personaString); // Deserializar
// personaDeserializada = {
//    nombre: 'Juan',
//    edad: 30
// }
```

## Clonación de objetos

En _Javascript_ los objetos se pasan por referencia, lo que significa que si se asigna un objeto a otra variable y se modifica, el objeto original también se verá afectado. Lo mismo ocurre si se pasa un objeto como argumento a una función. Para evitar esto, se puede hacer una copia del objeto.

Se puden hacer dos tipos de clonación: superficial y profunda.

### Clonación superficial

La clonación superficial copia solo el primer nivel de propiedades del objeto y no copia los objetos anidados. Por lo que es útil para objetos simples con propiedades primitivas (números, cadenas, booleanos).

Para hacer una clonación superficial de un objeto, se puede usar el operador de propagación (`...`) o el método `Object.assign()`.


```js linenums="1" title="Ejemplo de clonación superficial"
let persona = {
    nombre: 'Juan',
    edad: 30
};

let copia = { ...persona }; // Copia con operador de propagación
let copia2 = Object.assign({}, persona); // Copia con Object.assign()

copia.nombre = 'Ana'; // Modificar copia
console.log(persona.nombre); // Juan (no se modifica el objeto original)
```

### Clonación profunda

La clonación profunda copia todos los niveles de propiedades de un objeto, incluidos los objetos anidados. Para hacer una clonación profunda, se puede usar `structuredClone()` o `JSON.parse(JSON.stringify(objeto))`.

```js linenums="1" title="Ejemplo de clonación profunda"
let persona = {
    nombre: 'Juan',
    edad: 30,
    direccion: {
        ciudad: 'Madrid',
        codigoPostal: '28001'
    }
};

let copiaProfunda = JSON.parse(JSON.stringify(persona)); // Clonación profunda

copiaProfunda.direccion.ciudad = 'Barcelona'; // Modificar copia profunda
console.log(persona.direccion.ciudad); // Madrid (no se modifica el objeto original)
```

## Iterar sobre objetos

Existen varios métodos para iterar sobre las propiedades de un objeto.

### for...in

El bucle `for...in` permite recorrer todas las propiedades enumerables de un objeto.

```js linenums="1" title="Ejemplo de for...in"
let persona = {
    nombre: 'Juan',
    edad: 30,
    ciudad: 'Madrid'
};

for (let propiedad in persona) {
    console.log(`${propiedad}: ${persona[propiedad]}`);
}

// nombre: Juan
// edad: 30
// ciudad: Madrid
```

### Object.keys()

`Object.keys()` devuelve un array con las claves de un objeto, que se puede usar con `forEach()` o `for...of`.

```js linenums="1" title="Ejemplo de Object.keys()"
let persona = {
    nombre: 'Juan',
    edad: 30,
    ciudad: 'Madrid'
};

Object.keys(persona).forEach(propiedad => {
    console.log(`${propiedad}: ${persona[propiedad]}`);
});

// nombre: Juan
// edad: 30
// ciudad: Madrid
```

### Object.values()

`Object.values()` devuelve un array con los valores de un objeto.

```js linenums="1" title="Ejemplo de Object.values()"
let persona = {
    nombre: 'Juan',
    edad: 30,
    ciudad: 'Madrid'
};

Object.values(persona).forEach(valor => {
    console.log(valor);
});

// Juan
// 30
// Madrid
```

### Object.entries()

`Object.entries()` devuelve un array de pares clave-valor, que se puede usar para iterar sobre las propiedades de un objeto.

```js linenums="1" title="Ejemplo de Object.entries()"
let persona = {
    nombre: 'Juan',
    edad: 30,
    ciudad: 'Madrid'
};

Object.entries(persona).forEach(([clave, valor]) => {
    console.log(`${clave}: ${valor}`);
});

// nombre: Juan
// edad: 30
// ciudad: Madrid
```

### Object.fromEntries(array)

`Object.fromEntries()` permite crear un objeto a partir de un array de pares clave-valor.

```js linenums="1" title="Ejemplo de Object.fromEntries()"
let array = [['nombre', 'Juan'], ['edad', 30], ['ciudad', 'Madrid']];
let persona = Object.fromEntries(array);

console.log(persona);
// { nombre: 'Juan', edad: 30, ciudad: 'Madrid' }
```
