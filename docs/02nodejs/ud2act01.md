# ✍️ UD2 - Actividad 1: Módulos y eventos en Node.js

Acepta la tarea en _GitHub Classroom_ y clona el repositorio en tu máquina local.

- [https://classroom.github.com/a/3tPzjQzi](https://classroom.github.com/a/3tPzjQzi)

Realiza las actividades en los ficheros indicados y comprueba que funcionan correctamente.

!!! warning
    Es importante evitar el uso de generadores de código automático para realizar las actividades.

    Si tienes dudas, consulta la documentación o pide ayuda al profesor.

    En caso de existir duda ante la copia o el uso de herramientas de generación de código automático, se pedirá una explicación detallada del código por parte del alumnado implicado. En caso de no poder justificarlo, se considerará copia y se considerará la actividad como no realizada para las partes afectadas.

!!! danger "Commit"
    Haz al menos un **commit** por cada apartado.

## 1. Proyecto npm

Crea una carpeta llamada 📂 `npmproject` y utilizando el comando `npm init` para crear un nuevo proyecto en Node.js. Deja los valores por defecto que te plantea el asistente, y pon tu nombre como autor.

**⚠️ Recuerda ignorar la carpeta `node_modules/` en el archivo `.gitignore` ⚠️**

Después, instala el paquete "_**lodash**_" como se ha explicado en los apuntes, consulta su documentación (https://lodash.com/docs/), para hacer un programa en un archivo "`index.js`" que, dado un vector de nombres de personas, los muestre por pantalla separados por comas.

Deberás definir manualmente el array de nombres dentro del código. Por ejemplo, para el array `["Nacho", "Ana", "Mario", "Laura"]`, la salida del programa deberá ser:

```plaintext
Nacho,Ana,Mario,Laura
```

!!! note "Método join"
    Revisa el método **`join`** dentro de la documentación de _**lodash**_, puede serte muy útil para este ejercicio.


## 2. Saludo al usuario

Realizar el ejercicio dentro de la carpeta 📂 `os/`.

Crea un archivo `system_greeting.js` que salude al usuario que ha accedido a la aplicación.

Se debe utilizar el módulo `os` para obtener el nombre del usuario [os.userInfo()](https://nodejs.org/api/os.html#os_os_userinfo_options).

Por ejemplo, si el usuario es `John`, el mensaje de saludo será `¡Hola, John!`.

!!! note "userInfo()"
    La función `os.userInfo()` devuelve información sobre el usuario actual del sistema operativo.

    Para obtener el nombre del usuario, se debe acceder a la propiedad `username` del objeto devuelto.

## 3. Módulo de productos

Crear el ejercicio dentro de la carpeta 📂 `modules/`.

Crea un módulo `products.js` que gestione un listado de productos.

El módulo debe tener las siguientes funciones:

- `addProduct(product)`: Añade un producto al listado.
- `getProducts()`: Devuelve el listado de productos.
- `deleteProduct(id)`: Elimina un producto del listado.

El objeto `product` debe tener la siguiente estructura:

```json
{
  "id": 1,
  "name": "Product 1",
  "price": 10
}
```

Crear un archivo `index.js` que importe el módulo `products.js` y realice las siguientes operaciones:

1. Añadir tres productos al listado.
2. Mostrar el listado de productos.
3. Eliminar el producto con `id` igual a 2.
4. Mostrar el listado de productos actualizado.

## 4. Eventos

Realizar el ejercicio dentro de la carpeta 📂 `events/`.

Crear un archivo `index.js` e implementa las siguientes funciones:

- `newUser(name)`: Añade un nuevo usuario y emite el evento `newUser` con el nombre del usuario.
- `onNewUser(name)`: Muestra un mensaje por consola con el nombre del usuario añadido.
- `removeUser(name)`: Elimina un usuario y emite el evento `removeUser` con el nombre del usuario.
- `onRemoveUser(name)`: Muestra un mensaje por consola con el nombre del usuario eliminado.
- `listUsers()`: Muestra un listado de los usuarios actuales.

Realiza las siguientes operaciones:

1. Añadir dos usuarios: `John`, `Alice` y `Bob`. Deben mostrarse los mensajes correspondientes al añadir cada usuario.
2. Listar los usuarios actuales.
3. Eliminar el usuario `John`. Debe mostrarse el mensaje correspondiente.
4. Listar los usuarios actuales.

```plaintext title="Salida esperada"
Nuevo usuario: John
Nuevo usuario: Alice
Nuevo usuario: Bob
Usuarios actuales: John, Alice, Bob
Usuario eliminado: John
Usuarios actuales: Alice, Bob
```

## 5. Ficheros

Realizar el ejercicio dentro de la carpeta 📂 `files/`.

Crear un archivo `index.js` que lea el contenido del archivo `users.json` y muestre por consola el contenido del archivo.

El archivo `users.json` tiene el siguiente contenido:

```json
[
  {
    "name": "John",
    "age": 30
  },
  {
    "name": "Alice",
    "age": 25
  }
]
```

Crea una función `addUser(user)` que añada un nuevo usuario al archivo `users.json`.

Después de añadir el usuario, muestra por consola el contenido actualizado del archivo.

```plaintext title="Salida esperada"
[
  {
    "name": "John",
    "age": 30
  },
  {
    "name": "Alice",
    "age": 25
  },
  {
    "name": "Bob",
    "age": 35
  }
]
```

Crea la función `deleteUser(name)` que elimine un usuario del archivo `users.json`.

Después de eliminar el usuario, muestra por consola el contenido actualizado del archivo, y si el usuario no existe, muestra un mensaje de error.
