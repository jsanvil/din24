# 4.1 Introducción a React

En esta sección vamos a aprender a crear aplicaciones de Electron con React. React es una biblioteca de JavaScript para construir interfaces de usuario, y es una de las opciones más populares para crear aplicaciones modernas.

## ¿Qué es React?

En la página oficial de [React](https://react.dev/) se describe como:

> React: The library for web and native user interfaces

React es una biblioteca de código abierto para construir interfaces de usuario. Desarrollado por Meta, creado en 2011 por Jordan Walke. React es una de las opciones más populares para crear aplicaciones modernas, y es ampliamente utilizado por empresas como Meta, Instagram, Airbnb, Netflix, WhatsApp, Twitter, Reddit, Twitch, entre otros.

Los frameworks como Angular y Vue proporcionan una estructura y un conjunto de herramientas para desarrollar aplicaciones completas, y también son excelentes opciones para crear aplicaciones de Electron.

React, por otro lado, es una biblioteca que se centra en la creación de interfaces de usuario. React es una excelente opción para crear aplicaciones de una sola página (SPA) y aplicaciones de Electron, ya que facilita la creación de interfaces de usuario interactivas y dinámicas.

Se escoge React para este curso, por su facilidad de uso, su popularidad y su gran comunidad de desarrolladores, y al ser una librería, se puede integrar fácilmente con otras herramientas y bibliotecas, sin imponer una estructura o un flujo de trabajo específico.

Las desventajas de los frameworks, es que pueden ser más complejos y tener una curva de aprendizaje más pronunciada, además, los cambios de versión pueden requerir una reescritura significativa del código.

## Características

- **Declarativo**: Mediante la extensión de JavaScript llamada JSX, React permite escribir elementos de React como si fueran HTML. JSX es una sintaxis que se compila a JavaScript y permite escribir código más legible y fácil de mantener.r.

  ```jsx title="Ejemplo de un componente de React"
  function App() {
    return <button onClick={() => alert('Hello, World!')}>Click me</button>
  }
  ```

  ```js title="Ejemplo con JavaScript puro (vanilla)"
  const button = document.createElement('button')
  button.textContent = 'Click me'
  button.addEventListener('click', () => alert('Hello, World!'))
  document.body.appendChild(button)
  ```

- **Componentes**: React es una biblioteca de componentes. Cada componente tiene su propio estado y propiedades, y puede ser reutilizado en diferentes partes de la aplicación.

- **Virtual DOM**: React utiliza un DOM virtual para mejorar el rendimiento. En lugar de actualizar el DOM directamente, React actualiza el DOM virtual y luego compara el DOM virtual con el DOM real para determinar qué elementos deben actualizarse.

- **Hooks**: Los Hooks son funciones que permiten "enganchar" funcionalidades de React en componentes funcionales. El hook más popular es `useState`, que permite añadir estado a un componentes para que pueda reaccionar a los cambios.

## Componentes

Un **componente de software** es una **parte** de un sistema más grande que realiza una **función** específica. En React, los componentes son **bloques de construcción** fundamentales. Un componente puede ser una parte de la interfaz de usuario, como un botón o un formulario, o puede ser una parte más grande de la aplicación, como una barra lateral o una página de inicio.

Se utilizan para **dividir la interfaz** de usuario en piezas más pequeñas y manejables. Cada componente tiene su propio **estado** y propiedades, puede ser **reutilizado** en diferentes partes de la aplicación y pueden **anidado** dentro de otros componentes.

## single-page application (SPA)

Una **aplicación de una sola página** (SPA) es una aplicación web o sitio web que interactúa con el usuario dinámicamente, reescribiendo la página actual en lugar de cargar páginas nuevas desde el servidor. Esto permite que la aplicación sea más rápida y más fluida, ya que solo se carga una vez y luego se actualiza dinámicamente.

React es una excelente opción para crear aplicaciones de una sola página, ya que facilita la creación de interfaces de usuario interactivas y dinámicas, por lo que es ideal para aplicaciones Electron que requieren una interfaz de usuario moderna y atractiva.

## Creación de un proyecto de React con Vite

Para utilizar React necesitamos un **empaquetador** que transpile el código a Javascript. En este curso utilizaremos [**_Vite_**](https://vitejs.dev/), un empaquetador de JavaScript moderno que permite utilizar React, Vue y otras bibliotecas en aplicaciones de Electron.

Para crear un proyecto react utilizaremos el comando `npm create vite@latest nombre_del_proyecto`. Creará una **nueva carpeta** con el `./nombre_del_proyecto` y configurará un proyecto de React con Vite.

- Ejecutar el comando para crear un nuevo proyecto:

    ```bash title="Ejecutar en la línea de comandos:" hl_lines="1"
    $ npm create vite@latest react-test-project
    ```

- La primera vez, aparecerá el siguiente mensaje:

    ```bash
    Need to install the following packages:
    create-vite@6.0.1
    Ok to proceed? (y)
    ```

- Seleccionar el framework:

    ```bash hl_lines="4"
    ? Select a framework: › - Use arrow-keys. Return to submit.
        Vanilla
        Vue
    ❯   React
        Preact
        Lit
        Svelte
        Solid
        Qwik
        Angular
        Others
    ```

- Seleccionar el lenguaje:

    ```bash hl_lines="5"
    ? Select a variant: › - Use arrow-keys. Return to submit.
        TypeScript
        TypeScript + SWC
        JavaScript
    ❯   JavaScript + SWC
        React Router v7 ↗
    ```

    _**SWC**_ es un compilador de _JavaScript_/_TypeScript_ escrito en _Rust_ que se ejecuta mucho más rápido que _Babel_.

- Finalmente se creará el proyecto:

    ```bash hl_lines="3"
    Scaffolding project in ./proyecto...

    Done. Now run:

      cd proyecto
      npm install
      npm run dev
    ```

- Instalar dependencias y ejecutar el proyecto:

    ```text hl_lines="1-3 7 14"
    $ cd react-test-project
    $ npm install

    added 212 packages in 4s

    99 packages are looking for funding
      run `npm fund` for details

    $ npm run dev

        VITE v6.0.3  ready in 172 ms

        ➜  Local:   http://localhost:5173/
        ➜  Network: use --host to expose
        ➜  press h + enter to show help

      Shortcuts
      press r + enter to restart the server
      press u + enter to show server url
      press o + enter to open in browser
      press c + enter to clear console
      press q + enter to quit
    ```

    !!! note "`npm run dev`"
        El servidor de desarrollo se ejecuta, por defecto, en el puerto **`5173`**. Para acceder a la aplicación se utiliza la dirección _**`http://localhost:5173`**_.

        Existen una serie de **atajos de teclado** que permiten realizar acciones de forma rápida.

    Si accedemos a la dirección _**`http://localhost:5173`**_ veremos la aplicación de React en funcionamiento.

## Estructura del proyecto (_scaffolding_)

La estructura del proyecto debe ser similar a la siguiente:

```
├── node_modules/
├── public/
│   └── vite.svg
├── src/
│   ├── assets/
│   │   └── react.svg
│   ├── App.css
│   ├── App.jsx
│   ├── index.css
│   └── main.jsx
├── .gitignore
├── eslint.config.js
├── index.html
├── package-lock.json
├── package.json
├── README.md
└── vite.config.js
```

Podemos observer varios archivos de configuración, como _**`package.json`**_, _**`vite.config.js`**_, además de un **`.gitignore`**.

Dentro de `package.json` podemos observar los siguientes scripts:

```json title="package.json" linenums="5"
...
  "scripts": {
    "dev": "vite",
    "build": "vite build",
    "lint": "eslint .",
    "preview": "vite preview"
  },
...
```

- **`dev`**: Ejecuta el servidor de desarrollo.
- **`build`**: Genera la aplicación para producción en el directorio `dist/`.
- **`lint`**: Ejecuta el linter para comprobar el código.
- **`preview`**: Genera la aplicación para producción y la ejecuta en un servidor local.

Por otro lado, en **`index.html`** es muy sencillo. En `<body>` sólo hay dos elementos:

- **`<div id="root"></div>`**: Es el elemento donde se renderizará la aplicación.
- **`<script type="module" src="/src/main.jsx"></script>`**: El punto de entrada de la aplicación es `src/main.jsx`.

```html title="index.html" linenums="1" hl_lines="10-11"
<!doctype html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <link rel="icon" type="image/svg+xml" href="/vite.svg" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Vite + React</title>
  </head>
  <body>
    <div id="root"></div>
    <script type="module" src="/src/main.jsx"></script>
  </body>
</html>
```

La aplicación _**React**_ se encuentra dentro del directorio **`src/`**, que es donde trabajaremos a partir de ahora. En este directorio se encuentran los siguientes archivos:

- **`main.jsx`**: **Punto de entrada** de la aplicación.
- **`App.jsx`**: **Componente principal** de la aplicación.
- **`App.css`**: Estilos del componente principal.
- **`index.css`**: Estilos de la aplicación (`main.jsx`).
- **`assets/`**: Directorio donde se almacenan los recursos.

## Creación de componentes

Si observamos el contenido de **`App.jsx`** veremos el siguiente código:

```js title="src/App.jsx" linenums="1" hl_lines="1-4 10-31 35"
import { useState } from 'react'
import reactLogo from './assets/react.svg'
import viteLogo from '/vite.svg'
import './App.css'

function App() {
  const [count, setCount] = useState(0)

  return (
    <>
      <div>
        <a href="https://vite.dev" target="_blank">
          <img src={viteLogo} className="logo" alt="Vite logo" />
        </a>
        <a href="https://react.dev" target="_blank">
          <img src={reactLogo} className="logo react" alt="React logo" />
        </a>
      </div>
      <h1>Vite + React</h1>
      <div className="card">
        <button onClick={() => setCount((count) => count + 1)}>
          count is {count}
        </button>
        <p>
          Edit <code>src/App.jsx</code> and save to test HMR
        </p>
      </div>
      <p className="read-the-docs">
        Click on the Vite and React logos to learn more
      </p>
    </>
  )
}

export default App
```

Contiene una serie de _imports_, una función que contiene un `return` con código `html` y un `export` al final.

Para crear nuestro propio componente, podemos borrar todo el contenido y dejarlo de la siguiente forma:

```js title="src/App.jsx" linenums="1"
import './App.css'

function App() {
  return (
    <>

    </>
  )
}

export default App
```

**Un componente siempre debe devolver un único elemento**. Si queremos devolver varios elementos, debemos agruparlos dentro de un elemento padre, para solucionarlo, se utiliza el componente [**`<Fragment>`**](https://react.dev/reference/react/Fragment) que suele abreviarse con **`< >`** y **``< />``**.

Ahora vamos a crear un componente que nos muestre un mensaje de bienvenida. Para ello, modificaremos el archivo **`App.jsx`** con el siguiente contenido:

```js title="src/App.jsx" linenums="1" hl_lines="3-9 14"
import './App.css'

function HolaMundo() {
  return (
    <div className="HolaMundo">
      <h1>Hola desde mi primer componente</h1>
    </div>
  )
}

function App() {
  return (
    <>
      <HolaMundo />
    </>
  )
}

export default App
```

Si comprobamos el resultado en el navegador, podremos ver que se muestra el mensaje. De esta forma tan simple hemos creado el componente que podremos reutilizar en cualquier parte de nuestra aplicación.

Por lo general, los componentes no son tan simples, se utilizan para crear estructuras más complejas, como una tarjeta que muestra información de un usuario, un formulario, listados de productos, etc. Además, se suelen crear en archivos separados. 

Ahora vamos a **mover** el componente **`HolaMundo`** a un archivo distinto. Para ello, crearemos la carpeta **`src/components`** y dentro crearemos un nuevo archivo **`HolaMundo.jsx`** con el siguiente contenido:

```js title="src/components/HolaMundo.jsx" linenums="1"
export default function HolaMundo() {
  return (
    <div className="HolaMundo">
      <h1>Hola desde mi primer componente</h1>
    </div>
  )
}
```

Y ahora podemos eliminar la funcion `HolaMundo` del archivo **`App.jsx`** y añadir el import del componente:

```js title="src/App.jsx" linenums="1" hl_lines="2"
import './App.css'
import HolaMundo from './components/HolaMundo'

function App() {
  return (
    <>
      <HolaMundo />
    </>
  )
}

export default App
```

## Props

Los componentes pueden recibir parámetros en forma de **propiedades** (_props_). Las _props_ son **inmutables**, es decir, no se pueden modificar desde el componente. Para modificarlas, se debe hacer desde el componente padre.

Para pasar _props_ a un componente, se utiliza la sintaxis **`<Componente prop1="valor1" prop2="valor2" />`**, con el formato `atributo="valor"` típico de `html`. Para acceder a las _props_ desde el componente, se utiliza el objeto **`props`**.

Vamos a crear un componente que reciba un nombre y un apellido y los muestre en pantalla. Para ello, crearemos el archivo **`src/components/NombreCompleto.jsx`** con el siguiente contenido:

```jsx title="src/components/NombreCompleto.jsx" linenums="1"
export default function NombreCompleto(props) {
    return (
        <p>User: <strong>{props.nombre}</strong> {props.apellido}</p>
    )
}
```

!!!tip "Desestructuración de props"
    En este caso, el componente recibe dos _props_: `nombre` y `apellido`. Para facilitar el acceso a las _props_, se pueden desestructurar en los argumentos de la función.

    ```jsx title="src/App.jsx" linenums="1" hl_lines="1 3"
    export default function NombreCompleto( {nombre, apellido} ) {
        return (
            <p>User: <strong>{nombre}</strong> {apellido}</p>
        )
    }
    ```


Y ahora podemos añadir el componente al archivo **`App.jsx`**:

```jsx title="src/App.jsx" linenums="1" hl_lines="2-3"
import './App.css'
import HolaMundo from './components/HolaMundo'
import NombreCompleto from './components/NombreCompleto'

function App() {
  return (
    <>
      <HolaMundo />
      <NombreCompleto nombre="María" apellido="López" />
      <NombreCompleto nombre="Juan" apellido="Pérez" />
    </>
  )
}

export default App
```

Si comprobamos el resultado en el navegador, vemos que se muestran los nombres y apellidos que hemos pasado como _props_.

## Ejemplo de integración de Bootstrap

Para integrar _Bootstrap_ en nuestro proyecto, debemos instalar las dependencias necesarias. Para ello, ejecutaremos el comando:

```bash
$ npm install bootstrap bootstrap-icons
```

Y ahora podemos utilizar los componentes de _Bootstrap_ en nuestros componentes. Por ejemplo, vamos a crear un componente que muestre una tarjeta con información de un usuario. Para ello, crearemos el archivo **`src/components/TarjetaUsuario.jsx`** con el siguiente contenido:

```js title="src/components/TarjetaUsuario.jsx"
export default function TarjetaUsuario({nombre, apellido, email, telefono}) {
  return (
    <div className="card shadow-sm">
        <div className="card-header text-center">
            <h5 className="card-title">{nombre} {apellido}</h5>
        </div>
        <div className="card-body">
            <h6 className="card-subtitle mb-2 text-muted">
                <a href="#" className="card-link"><i className="bi bi-envelope"></i></a>
                {email}
            </h6>
            <p className="card-text"><a href="#" className="card-link">
                <i className="bi bi-telephone"></i></a> {telefono}
            </p>
            <div className="text-end">
              <button className="btn btn-outline-secondary btn-sm">Añadir <i className="bi bi-plus-circle"></i></button>
            </div>
        </div>
    </div>
  )
}
```

Y ahora podemos añadir el componente al archivo **`App.jsx`** junto a los imports de _Bootstrap_:

```js title="src/App.jsx" linenums="1"
import 'bootstrap/dist/css/bootstrap.min.css';
import 'bootstrap-icons/font/bootstrap-icons.css';
import 'bootstrap';

import TarjetaUsuario from './components/TarjetaUsuario';

function App() {
  return (
    <>
      <div className="container mt-5 d-flex flex-wrap justify-content-center gap-3">
        <TarjetaUsuario nombre="María" apellido="López" email="invalid@email.moc" telefono="123456789" />
        <TarjetaUsuario nombre="Juan" apellido="Pérez" email="invalid@email.moc" telefono="987654321" />
        <TarjetaUsuario nombre="Pedro" apellido="Martín" email="invalid@email.moc" telefono="123123123" />
        <TarjetaUsuario nombre="Ana" apellido="García" email="invalid@email.moc" telefono="123123132" />
        <TarjetaUsuario nombre="Luis" apellido="González" email="invalid@email.moc" telefono="123123123" />
        <TarjetaUsuario nombre="María" apellido="Rodríguez" email="invalid@email.moc" telefono="123123123" />
        <TarjetaUsuario nombre="Carmen" apellido="Fernández" email="invalid@email.moc" telefono="123123123" />
        <TarjetaUsuario nombre="Antonio" apellido="López" email="invalid@email.moc" telefono="123123123" />
        <TarjetaUsuario nombre="José" apellido="Martínez" email="invalid@email.moc" telefono="123123123" />
      </div>
    </>
  );
}

export default App;
```

Si comprobamos el resultado en el navegador, vemos que se muestran las tarjetas con la información de los usuarios.

La principal diferencia es que se han adaptado los atributos `class` a los atributos `className` de _React_ debido a que los archivos _JSX_ se compilan a _JavaScript_ y `class` es una palabra reservada.

## Listas

Una operación muy común en las aplicaciones es mostrar una lista de elementos, que pueden tener origen en una base de datos, un archivo o una llamada a una API.

En _React_, para mostrar una lista de elementos, se utiliza el método `map` de los arrays. Este método recorre cada elemento del array y devuelve un nuevo array con los elementos modificados.

Vamos a crear un componente que muestre una lista de usuarios. Para ello, crearemos el archivo **`src/components/ListaUsuarios.jsx`** con el siguiente contenido:

```jsx title="src/components/ListaUsuarios.jsx"
import TarjetaUsuario from "./TarjetaUsuario"

export default function ListaUsuarios({usuarios}) {
  return (
      <ul className="list-group">
          {usuarios.map((usuario, index) => (
            <li key={index} className="list-group-item">
                <TarjetaUsuario {...usuario} />
              </li>
          ))}
      </ul>
  )
}
```

Recorremos el array de usuarios y por cada usuario, crea un elemento de la lista con el componente `TarjetaUsuario`. El atributo `key` es necesario para que _React_ pueda identificar cada elemento de la lista.

Y ahora podemos añadir el componente al archivo **`App.jsx`**:

```jsx title="src/App.jsx" linenums="1"
import "bootstrap/dist/css/bootstrap.min.css"
import "bootstrap-icons/font/bootstrap-icons.css"
import "bootstrap"

import ListaUsuarios from "./components/ListaUsuarios"

function App() {
  const usuarios = [
    {
      nombre: "María",
      apellido: "López",
      email: "invalid@email.moc",
      telefono: "123456789",
    },
    {
      nombre: "Juan",
      apellido: "Pérez",
      email: "invalid@email.moc",
      telefono: "987654321",
    },
    {
      nombre: "Pedro",
      apellido: "Martín",
      email: "invalid@email.moc",
      telefono: "123123123",
    },
  ]

  return (
    <>
      <h1 className="text-center mt-5">Lista de usuarios</h1>
      <div className="container mt-5 d-flex flex-wrap justify-content-center gap-3">
        <ListaUsuarios usuarios={usuarios} />
      </div>
    </>
  )
}

export default App
```
