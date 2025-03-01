# 1.6 Programación Orientada a Objetos

## Introducción

Desde _ES2015_ la POO en _Javascript_ es similar a como se hace en otros lenguajes:

```js linenums="1" title="Ejemplo de clase en ES2015"
class Alumno {
    constructor(nombre, apellidos, edad) {
        this.nombre = nombre
        this.apellidos = apellidos
        this.edad = edad
    }

    getInfo() {
        return `El alumno ${this.nombre} ${this.apellidos} tiene ${this.edad} años`
    }
}

let alumno = new Alumno('Carlos', 'Pérez Ortiz', 19)

console.log(alumno.getInfo())
// imprime 'El alumno Carlos Pérez Ortíz tiene 19 años'
```

### _this_

Dentro de una función se crea un nuevo contexto y la _`this`_ pasa a hacer referencia a dicho contexto. Si en el ejemplo anterior hiciéramos algo como esto:

```js hl_lines="5" linenums="1"
class Alumno {
    ...
    getInfo() {
        function nomAlum() {
            return this.nombre + ' ' + this.apellidos
            // Aquí this no es el objeto Alumno
        }

        return 'El alumno ' + nomAlum() + ' tiene ' + this.edad + ' años'
    }
}
```

Este código fallaría porque dentro de la función _`nomAlum`_ la variable _`this`_ ya no hace referencia al objeto _`Alumno`_ sino al contexto de la función. Este ejemplo no tiene mucho sentido pero es común en _callbacks_ de eventos. 

Si debemos llamar a una función dentro de un método (o de un _callback_) tenemos varias formas de pasarle el valor de _`this`_:

- Usando una _**arrow function**_ que no crea un nuevo contexto por lo que _`this`_ conserva su valor:

    ```js hl_lines="2" linenums="1"
        getInfo() {
            let nomAlum = () => this.nombre + ' ' + this.apellidos
            
            return 'El alumno ' + nomAlum() + ' tiene ' + this.edad + ' años'
        }
    ```

- Pasándole _`this`_ como parámetro a la función:

    ```js hl_lines="2" linenums="1"
        getInfo() {
            function nomAlum(alumno) {
                return alumno.nombre + ' ' + alumno.apellidos
            }

            return 'El alumno ' + nomAlum(this) +' tiene ' + this.edad + ' años'
        }
    ```

- Guardando el valor en otra variable (como _`that`_):

    ```js hl_lines="2 5" linenums="1"
        getInfo() {
            let that = this;
            
            function nomAlum() {
                return that.nombre + ' ' + that.apellidos
                // Aquí this no es el objeto Alumno
            }

            return 'El alumno ' + nomAlum() +' tiene ' + this.edad + ' años'
        }
    ```

- Haciendo un _bind_ de _this_ en eventos:

    ```js hl_lines="7" linenums="1"
        getInfo() {
            function nomAlum() {
                return this.nombre + ' ' + this.apellidos
                // Aquí this no es el objeto Alumno
            }

            return 'El alumno ' + nomAlum.bind(this)() +' tiene ' + this.edad + ' años'
        }
    ```

## Herencia

Una clase puede heredar de otra utilizando la palabra reservada **extends** y heredará todas sus propiedades y métodos. Podemos sobrescribirlos en la clase hija. Seguimos pudiendo llamar a los métodos de la clase padre utilizando la palabra reservada **`super`**, es lo que haremos si creamos un constructor en la clase hija.

```js linenums="1" title="Ejemplo de herencia"
class AlumnInf extends Alumno {

  constructor (nombre, apellidos, edad, ciclo) {
    super(nombre, apellidos, edad)
    this.ciclo = ciclo
  }

  getInfo() {
    return `${super.getInfo()} y estudia el Grado ${this.getGradoMedio() ? 'Medio' : 'Superior'} de ${this.ciclo}`
  }

  getGradoMedio() {
    return this.ciclo.toUpperCase === 'SMX'
  }
}

let alumnoInf = new AlumnInf('Carlos', 'Pérez Ortiz', 19, 'DAM')
console.log(alumnoInf.getInfo())
// imprime 'El alumno Carlos Pérez Ortíz tiene 19 años y estudia el Grado Superior de DAM'
```

## Métodos estáticos

Desde ES2015 podemos declarar métodos estáticos, pero no propiedades estáticas. Estos métodos se llaman directamente utilizando el nombre de la clase y no tienen acceso al objeto _`this`_ (ya que no hay objeto instanciado).

```js hl_lines="3"
class User {
    ...
    static getRoles() {
        return ["user", "guest", "admin"]
    }
}

console.log(User.getRoles())
// ["user", "guest", "admin"]

let user = new User("john")
console.log(user.getRoles())
// Uncaught TypeError: user.getRoles is not a function
```

## Método _toString()_

Al convertir un objeto a string (por ejemplo al concatenarlo con un _String_) se llama al método **_.toString()_** del mismo, que por defecto devuelve la cadena `[object Object]`. Podemos sobrecargar este método para que devuelva lo que queramos:

```js linenums="1"
class Alumno {
    ...
    toString() {
        return this.apellidos + ', ' + this.nombre
    }
}

let alumno = new Alumno('Carlos', 'Pérez Ortiz', 19);

console.log(alumno.toString()) // 'Pérez Ortiz, Carlos'
console.log(alumno) // Alumno { nombre: 'Carlos', apellidos: 'Pérez Ortiz', edad: 19 }
console.log(alumno + '') // 'Pérez Ortiz, Carlos'
console.log(`${alumno}`) // 'Pérez Ortiz, Carlos'
```

Este método también es el que se usará si queremos ordenar una array de objetos (recordad que _`.sort()`_ ordena alfabéticamente para lo que llama al método _`.toString()`_ del objeto a ordenar). Por ejemplo, tenemos el array de alumnos _`misAlumnos`_ que queremos ordenar alfabéticamente. Si la clase _`Alumno`_ no tiene un método _`toString`_ habría que hacer como vimos los contenidos acerca de arrays:

```js linenums="1"
misAlumnos.sort(function(alum1, alum2) {
  return alum1.apellidos.localeCompare(alum2.apellidos)
});
```

Pero con el método _`toString()`_ que hemos definido antes podemos hacer directamente:

```js
misAlumnos.sort() 
```

Para ordenar por otro critério distinto de `toString()` debemos indicarlo:

```js
misAlumnos.sort(function(alum1, alum2) {
    return alum1.edad - alum2.edad
})
```

## Método _valueOf()_

Al comparar objetos (con `>`, `<`, `==`, `===`, etc.) se usa el valor devuelto por el método _`.toString()`_ pero si definimos un método **_`.valueOf()`_** será este el que se usará en comparaciones:

```javascript
class Alumno {
    ...
    valueOf() {
        return this.edad
    }
}

let alumno1 = new Alumno('Carlos', 'Pérez Ortiz', 19)
let alumno2 = new Alumno('Ana', 'Abad Tudela', 23)
console.log(alumno1 < alumno2)     // imprime true ya que 19 < 23
```

## Propiedades privadas

En _ES2019_ se añadió el _hastag_ `#` para declarar variables privadas en las clases. Estas variables solo son accesibles desde la clase en la que se declaran.

También se pueden definir _getters_ y _setters_ para acceder a estas variables privadas.

```js linenums="1" title="Ejemplo de clase con propiedades privadas getters y setters"
class Alumno {
    // propiedad privada
    #dni

    constructor(nombre, apellidos, edad, dni) {
        this.nombre = nombre
        this.apellidos = apellidos
        this.edad = edad
        this.#dni = dni
    }

    // se define un getter para acceder a la variable privada
    get dni() {
        return this.#dni
    }

    // se define un setter para modificar la variable privada
    set dni(dni) {
      if (this.#validateDni(dni)) {
        this.#dni = dni
      }
      else {
        throw new Error('DNI no válido')
      }
    }

    // método privado
    #validateDni(dni) {
        // código para validar el DNI ...
        return true
    }
}

let alumno = new Alumno('Carlos', 'Pérez Ortiz', 19, '12345678A')

// no se puede acceder a la propiedad privada
console.log(alumno.#dni) // Uncaught SyntaxError: Private field '#dni' must be declared in an enclosing class

// uso del getter
console.log(alumno.dni) // imprime '12345678A'

// uso del setter
alumno.dni = '87654321B' // cambia el DNI
```
