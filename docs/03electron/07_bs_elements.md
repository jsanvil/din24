# 3.7 Elemento básicos de Bootstrap

## Introducción

En el apartado anterior hemos visto la maquetación básica de la interfaz. En esta unidad vamos a ver los componentes básicos para crear interfaces de usuario con Bootstrap.

## Texto

El texto es el elemento más común a la hora de presentar información en la interfaz.

Componentes:

- `<p>`: Párrafo
- `<h1>`, `<h2>`, `<h3>`, `<h4>`, `<h5>`, `<h6>`: Títulos
- `<span>`: Texto en línea

_Ejemplo:_

```html
<h2>Esto es un título</h2>
<p>Esto es un párrafo que contiene un <span class="text-info">texto en línea</span> con el color cambiado.</p>
```

_Resultado:_

<div class="container border rounded w-75">
    <h1>Esto es un título</h1>
    <p>Esto es un párrafo que contiene un <span class="text-info">texto en línea</span> con el color cambiado.</p>
</div>

!!! note "Elementos de bloque y en línea"
    Los párrafos y títulos son elementos de bloque, es decir, ocupan todo el ancho disponible. El texto en línea se muestra en la misma línea que el texto anterior y posterior.

    Aunque este comportamiento se puede modificar con CSS.

## Imágenes

Las imágenes se insertan con la etiqueta `<img>`. Esta etiqueta no tiene contenido, solo atributos.

_Ejemplo:_

```html
<img src="https://via.placeholder.com/150" alt="imagen de ejemplo">
```

_Resultado:_

<div class="container border rounded w-75">
    <img src="https://via.placeholder.com/150" alt="imagen de ejemplo">
</div>

## Listas

Las listas se crean con las etiquetas `<ul>` y `<ol>` para listas no ordenadas y ordenadas respectivamente. Cada elemento de la lista se crea con la etiqueta `<li>`.

_Ejemplo:_

```html
<ul>
    <li>Elemento 1</li>
    <li>Elemento 2</li>
    <li>Elemento 3</li>
</ul>
<ol>
    <li>Elemento 1</li>
    <li>Elemento 2</li>
    <li>Elemento 3</li>
</ol>
```

_Resultado:_

<div class="container border rounded w-75">
    <ul>
        <li>Elemento 1</li>
        <li>Elemento 2</li>
        <li>Elemento 3</li>
    </ul>
    <ol>
        <li>Elemento 1</li>
        <li>Elemento 2</li>
        <li>Elemento 3</li>
    </ol>
</div>

## Tablas

Las tablas se crean con la etiqueta `<table>`. Cada fila de la tabla se crea con la etiqueta `<tr>` y cada celda con la etiqueta `<td>`.
Para crear una cabecera de tabla se utiliza la etiqueta `<th>`.

_Ejemplo:_

```html
<table class="table table-striped">
    <thead>
        <tr>
            <th scope="col">Nombre</th>
            <th scope="col">Apellidos</th>
            <th scope="col">Edad</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>Nombre 1</td>
            <td>Apellidos 1</td>
            <td>Edad 1</td>
        </tr>
        <tr>
            <td>Nombre 2</td>
            <td>Apellidos 2</td>
            <td>Edad 2</td>
        </tr>
        <tr>
            <td>Nombre 3</td>
            <td>Apellidos 3</td>
            <td>Edad 3</td>
        </tr>
    </tbody>
</table>
```

_Resultado:_

<div class="container border rounded w-75">
    <table class="table table-striped">
        <thead>
            <tr>
                <th scope="col">Nombre</th>
                <th scope="col">Apellidos</th>
                <th scope="col">Edad</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>Nombre 1</td>
                <td>Apellidos 1</td>
                <td>Edad 1</td>
            </tr>
            <tr>
                <td>Nombre 2</td>
                <td>Apellidos 2</td>
                <td>Edad 2</td>
            </tr>
            <tr>
                <td>Nombre 3</td>
                <td>Apellidos 3</td>
                <td>Edad 3</td>
            </tr>
        </tbody>
    </table>
</div>

## Etiquetas

Las etiquetas son elementos que permiten resaltar texto. Se crean con la etiqueta `<mark>`.

_Ejemplo:_

```html
<p>Ejemplo de texto con una <span class="badge bg-secondary">etiqueta</span></p>

<button type="button" class="btn btn-primary">
  Mensajes <span class="badge text-bg-secondary">4</span>
</button>

<button type="button" class="btn btn-primary position-relative">
  Inbox
  <span class="position-absolute top-100 start-100 translate-middle badge rounded-pill bg-danger">
    99+
    <span class="visually-hidden">unread messages</span>
  </span>
</button>
```

_Resultado:_

<div class="container border rounded w-75">
<p>Ejemplo de texto con una <span class="badge bg-secondary">etiqueta</span></p>

<button type="button" class="btn btn-primary">
  Mensajes <span class="badge text-bg-secondary">4</span>
</button>

<button type="button" class="btn btn-primary position-relative">
  Inbox
  <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger">
    99+
    <span class="visually-hidden">unread messages</span>
  </span>
</button>
</div>

## Botones

Los botones son elementos básicos que permiten al usuario interactuar con la aplicación.

Se crean con la etiqueta `<button>` 

_Ejemplo:_

```html
<button class="btn btn-primary">primario</button>
<button class="btn btn-secondary">secundario</button>
<button class="btn btn-success">éxito</button>
<button class="btn btn-danger">peligro</button>
<button class="btn btn-warning">advertencia</button>
<button class="btn btn-info">información</button>
<button class="btn btn-light">claro</button>
<button class="btn btn-dark">oscuro</button>
<button class="btn btn-link">enlace</button>
```

_Resultado:_

<div class="container border rounded d-flex flex-wrap gap-1 p-1 w-75">
    <button class="btn btn-primary">primario</button>
    <button class="btn btn-secondary">secundario</button>
    <button class="btn btn-success">éxito</button>
    <button class="btn btn-danger">peligro</button>
    <button class="btn btn-warning">advertencia</button>
    <button class="btn btn-info">información</button>
    <button class="btn btn-light">claro</button>
    <button class="btn btn-dark">oscuro</button>
    <button class="btn btn-link">enlace</button>
</div>

Para dar interacción a los botones debemos asociarles un evento. Esto se puede hacer con método `addEventListener()`.

_Ejemplo:_

```html
<button id="boton" class="btn btn-primary">primario</button>
```

```javascript
const button = document.getElementById('boton');
button.addEventListener('click', () => {
    console.log('click');
});
```

## Entrada de texto

La etiqueta `<input>` permite al usuario introducir texto en la aplicación, suele ir acompañada de una etiqueta `<label>` que indica el propósito del campo.

_Ejemplo:_

```html
<label for="user" class="col-form-label">Usuario:</label>
<input type="text" class="form-control" id="user" value="usuario1">
<label for="password" class="col-form-label">Contraseña:</label>
<input type="password" class="form-control" id="password" value="no visible">
<label for="email" class="col-form-label">Email:</label>
<input type="email" class="form-control" id="email" value="usuario1@domain.com">
```

<div class="container border rounded d-flex flex-wrap gap-1 p-1 w-75">
    <label for="user" class="col-form-label">Usuario:</label>
    <input type="text" class="form-control" id="user" value="usuario1">
    <label for="password" class="col-form-label">Contraseña:</label>
    <input type="password" class="form-control" id="password" value="no visible">
    <label for="email" class="col-form-label">Email:</label>
    <input type="email" class="form-control" id="email" value="usuario1@domain.com">
</div>

Una práctica muy común es el uso de etiquetas flotantes para indicar el propósito del campo. Esto se puede conseguir con la clase `form-floating` y el atributo `placeholder`.

_Ejemplo:_

```html
<div class="form-floating">
  <input type="email" class="form-control" id="username" placeholder="username" value="usuario1">
  <label for="username">Usuario:</label>
</div>
<div class="form-floating">
  <input type="password" class="form-control" id="password" placeholder="Password">
  <label for="password">Password:</label>
</div>
<div class="form-floating">
  <input type="email" class="form-control" id="email" placeholder="Email">
  <label for="email">Email:</label>
</div>
```

<div class="container border rounded gap-1 p-1 w-75">
    <div class="form-floating mb-1">
        <input type="text" class="form-control" id="user" placeholder="username" value="usuario1">
        <label for="user">Usuario:</label>
    </div>
    <div class="form-floating mb-1">
        <input type="password" class="form-control" id="password" placeholder="Password">
        <label for="password">Password:</label>
    </div>
    <div class="form-floating mb-1">
        <input type="email" class="form-control" id="email" placeholder="Email">
        <label for="email">Email:</label>
    </div>
</div>

Para leer o establecer el valor de un campo de texto se utiliza la propiedad `value`.

```javascript
const user = document.getElementById('user');
let usuario = user.value;
user.value = 'nuevo nombre de usuario'
```

### Áreas de texto

Las áreas de texto son similares a los campos de texto, pero permiten introducir texto en varias líneas. Cuando el texto no cabe en el área, se muestra una barra de desplazamiento vertical.

_Ejemplo:_

```html
<label for="demo">Área de texto:</label>
<textarea class="form-control" id="demo" rows="3">Texto de ejemplo.
    Las áreas de texto permiten introducir textos más largos
    y presentarlos en varias líneas.</textarea>
```

<div class="container border rounded d-flex flex-wrap gap-1 p-1 w-75">
    <label for="demo">Área de texto:</label>
    <textarea class="form-control" id="demo" rows="4">Texto de ejemplo. Las áreas de texto permiten introducir textos más largos y presentarlos en varias líneas.</textarea>
</div>

## Checkbox

Las casillas de verificación permiten al usuario seleccionar una o varias opciones de una lista.

- Se crean con la etiqueta `<input>` y el atributo `type="checkbox"`.
- Para seleccionar una casilla por defecto se utiliza el atributo `checked`.
- Los atributos `name` y `value` permiten identificar el valor de la casilla seleccionada.

_Ejemplo:_

```html
<div class="form-check">
  <input class="form-check-input" type="checkbox" id="opcion1" name="opcion1" value="op1">
  <label class="form-check-label" for="opcion1">
    Primera opción
  </label>
</div>
<div class="form-check">
  <input class="form-check-input" type="checkbox" id="opcion2" name="opcion2" value="op2" checked>
  <label class="form-check-label" for="opcion2">
    Segunda opción
  </label>
</div>
```
<div class="container border rounded gap-1 p-1 w-75">
    <div class="form-check">
    <input class="form-check-input" type="checkbox" value="op1" id="opcion1" name="opcion1">
    <label class="form-check-label" for="opcion1">
        Primera opción
    </label>
    </div>
    <div class="form-check">
    <input class="form-check-input" type="checkbox" value="op2" id="opcion2" name="opcion2" checked>
    <label class="form-check-label" for="opcion2">
        Segunda opción
    </label>
    </div>
</div>

Alternativamente se pueden representar con interruptores (switch):

```html
<div class="form-check form-switch">
  <input class="form-check-input" type="checkbox" role="switch" id="opcion1" name="opcion1" value="op1">
  <label class="form-check-label" for="opcion1">
    Primera opción
  </label>
</div>
<div class="form-check form-switch">
  <input class="form-check-input" type="checkbox" role="switch" id="opcion2" name="opcion2" value="op2" checked>
  <label class="form-check-label" for="opcion2">
    Segunda opción
  </label>
</div>
```
<div class="container border rounded gap-1 p-1 w-75">
    <div class="form-check form-switch">
        <input class="form-check-input" type="checkbox" role="switch" value="op1" id="sopcion1" name="opcion1">
        <label class="form-check-label" for="sopcion1">
            Primera opción
        </label>
    </div>
    <div class="form-check form-switch">
        <input class="form-check-input" type="checkbox" role="switch" value="op2" id="sopcion2" name="opcion2" checked>
        <label class="form-check-label" for="sopcion2">
            Segunda opción
        </label>
    </div>
</div>

Para leer o establecer el valor de una casilla de verificación se utiliza la propiedad `checked`.

```javascript
const opcion1 = document.getElementById('opcion1');
let valor = opcion1.checked;
if (!valor.checked)
    opcion1.checked = true;
```

## Radio

Los botones de radio permiten al usuario seleccionar sólo una opción de una lista.

- Se crean con la etiqueta `<input>` y el atributo `type="radio"`.
- Para seleccionar una opción por defecto se utiliza el atributo `checked`.
- Para agrupar los botones de radio se utiliza el atributo `name` con el mismo valor.
- El atributo `value` permite identificar el valor de la opción seleccionada.

```html
<div class="form-check">
    <input class="form-check-input" type="radio" id="mascota-perro" name="mascota" value="perro" checked>
    <label class="form-check-label" for="mascota-perro">
        Perro
    </label>
</div>
<div class="form-check">
    <input class="form-check-input" type="radio" id="mascota-gato" name="mascota" value="gato">
    <label class="form-check-label" for="mascota-gato">
        Gato
    </label>
</div>
<div class="form-check">
    <input class="form-check-input" type="radio" id="mascota-otros" name="mascota" value="otros">
    <label class="form-check-label" for="mascota-otros">
        Otros
    </label>
</div>
```

<div class="container border rounded gap-1 p-1 w-75">
    <div class="form-check">
        <input class="form-check-input" type="radio" id="mascota-perro" name="mascota" value="perro" checked>
        <label class="form-check-label" for="mascota-perro">
            Perro
        </label>
    </div>
    <div class="form-check">
        <input class="form-check-input" type="radio" id="mascota-gato" name="mascota" value="gato">
        <label class="form-check-label" for="mascota-gato">
            Gato
        </label>
    </div>
    <div class="form-check">
        <input class="form-check-input" type="radio" id="mascota-otros" name="mascota" value="otros">
        <label class="form-check-label" for="mascota-otros">
            Otros
        </label>
    </div>
</div>

Para leer o establecer el valor de un botón de radio se utiliza la propiedad `checked`.

```javascript
const perro = document.getElementById('mascota-perro');
let valor = perro.checked;
if (!valor.checked)
    perro.checked = true;
```

## Select

Los selectores permiten al usuario seleccionar una opción de una lista desplegable.

- Se crean con la etiqueta `<select>`.
- El atributo `name` permite identificar el valor de la opción seleccionada.

```html
<select class="form-select" name="opcion">
    <option selected>Selecciona una opción</option>
    <option value="1">Uno</option>
    <option value="2">Dos</option>
    <option value="3">Tres</option>
</select>
```

<div class="container border rounded gap-1 p-1 w-75">
    <select class="form-select" name="opcion">
        <option selected>Selecciona una opción</option>
        <option value="1">Uno</option>
        <option value="2">Dos</option>
        <option value="3">Tres</option>
    </select>
</div>

También se pueden crear selectores múltiples, que permiten al usuario seleccionar varias opciones de una lista desplegable. Para ello se utiliza el atributo `multiple`.

```html
<select class="form-select" name="opcion" multiple>
    <option value="1">Uno</option>
    <option value="2">Dos</option>
    <option value="3">Tres</option>
</select>
```

<div class="container border rounded gap-1 p-1 w-75">
    <select class="form-select" name="opcion" multiple>
        <option value="1">Uno</option>
        <option value="2">Dos</option>
        <option value="3">Tres</option>
    </select>
</div>

Para leer o establecer el valor de un selector se utiliza la propiedad `value`.

```javascript
const selector = document.getElementById('selector');
let valor = selector.value;
if (selector.value != 2)
    selector.value = 2
```

## Slider

Los selectores permiten al usuario seleccionar un valor de una barra deslizante.

- Se crean con la etiqueta `<input>` y el atributo `type="range"`.
- El atributo `name` permite identificar el valor seleccionado.
- Se puede especificar el valor mínimo y máximo con los atributos `min` y `max`.
- El atributo `step` permite especificar el incremento del valor.

```html
<input class="form-range" type="range" min="0" max="100" step="1" name="slider">
```

<div class="container border rounded gap-1 p-1 w-75">
    <input class="form-range" type="range" min="0" max="100" step="1" name="slider">
</div>

Para leer o establecer el valor de un selector se utiliza la propiedad `value`.

```javascript
const slider = document.getElementById('slider');
let valor = slider.value;
if (slider.value < 50)
    slider.value = 50
```

## Formularios

Los formularios son elementos que permiten al usuario introducir datos en la aplicación.

Se crean con la etiqueta `<form>`. Los campos de texto, áreas de texto y botones se incluyen dentro del formulario.

Podemos añadir el atributo `required` a los campos de texto para indicar que son obligatorios.

```html

_Ejemplo:_

```html
<form>
    <div class="mb-3">
        <label for="user" class="col-form-label">Usuario:</label>
        <input type="text" class="form-control" id="user" value="usuario1" required>
    </div>
    <div class="mb-3">
        <label for="password" class="col-form-label">Contraseña:</label>
        <input type="password" class="form-control" id="password" value="no visible">
    </div>
    <div class="mb-3">
        <label for="email" class="col-form-label">Email:</label>
        <input type="email" class="form-control" id="email" value="">
    </div>
    <div class="mb-3">
        <label for="demo">Área de texto:</label>
        <textarea class="form-control" id="demo" rows="3">Texto de ejemplo. Las áreas de texto permiten introducir textos más largos y presentarlos en varias líneas.</textarea>
    </div>
    <button type="submit" class="btn btn-primary">Enviar</button>
</form>
```

<div class="container border rounded gap-1 p-1 w-75">
    <form class="row g-3">
        <div class="col-4">
            <label for="name" class="col-form-label">Nombre</label>
            <input required type="text" class="form-control" id="name" value="">
        </div>
        <div class="col-8">
            <label for="surname" class="col-form-label">Apellidos</label>
            <input type="text" class="form-control" id="surname" value="">
        </div>
        <div class="col-6">
            <label for="user" class="col-form-label">Usuario</label>
            <input type="text" class="form-control" id="user" value="">
        </div>
        <div class="col-6">
            <label for="password" class="col-form-label">Contraseña</label>
            <input type="password" class="form-control" id="password" value="">
        </div>
        <div class="mb-3 col-12">
            <label for="email" class="col-form-label">Email:</label>
            <input type="email" class="form-control" id="email" value="">
        </div>
        <div class="col-12">
        <div class="form-check col-12">
            <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault1">
            <label class="form-check-label" for="flexRadioDefault1">
                Default radio
            </label>
        </div>
        <div class="form-check col-12">
            <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault2" checked>
            <label class="form-check-label" for="flexRadioDefault2">
                Default checked radio
            </label>
        </div>
        </div>
        <div class="col-12">
            <div class="form-check">
                <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
                <label class="form-check-label" for="flexCheckDefault">
                    Acepto las condiciones
                </label>
            </div>
        </div>
        <div class="col-12">
            <button cla type="submit" class="btn btn-primary">Enviar</button>
            <button type="reset" class="btn btn-secondary">Restablecer</button>
        </div>
    </form>
</div>

### Validación de formularios

Los formularios se pueden validar con JavaScript. Para ello se utiliza el método `checkValidity()` del formulario. [_Ejemplo_](https://getbootstrap.com/docs/5.3/forms/validation/)

```javascript
const form = document.querySelector('form');
form.addEventListener('submit', (event) => {
    if (!form.checkValidity()) {
        event.preventDefault();
        event.stopPropagation();
    }
    form.classList.add('was-validated');
});
```

- El método `checkValidity()` devuelve `true` si el formulario es válido y `false` en caso contrario.
- El método `preventDefault()` evita que se envíe el formulario.
- El método `stopPropagation()` evita que se propague el evento.
- La clase `was-validated` permite mostrar los mensajes de error.
- Los mensajes de error se muestran con la clase `invalid-feedback`.

## Referencias

- [Bootstrap](https://getbootstrap.com/)
- [Electron](https://electronjs.org/)
- [W3Schools](https://www.w3schools.com/)
- [MDN Web Docs](https://developer.mozilla.org/es/)
