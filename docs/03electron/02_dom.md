# 3.2 Document Object Model (DOM)

El **Document Object Model (DOM)** es una interfaz de programación que permite a los programadores acceder y manipular el contenido, estructura y estilo de un documento HTML. En el contexto de Electron, el DOM es la representación de la interfaz de usuario de una aplicación, y se puede acceder a él a través de JavaScript.

El DOM es una **estructura jerárquica de nodos**, donde **cada nodo** representa un un elemento HTML, un texto o un comentario. Los nodos se organizan en un árbol, donde el nodo raíz es el objeto `document`, que representa el documento HTML.

## Acceder al DOM

Para acceder al DOM de una aplicación Electron, podemos utilizar el objeto `document`, que es una propiedad global en el contexto de una página web. Por ejemplo, para acceder a un elemento con el identificador `myElement`, podemos utilizar el método `getElementById`:

```js linenums="1" title="index.html"
<!DOCTYPE html>
<html>
<head>
  <title>Acceder al DOM</title>
  <script defer src="index.js"></script>
</head>
<body>
  <div id="myElement">Hola, mundo!</div>
</body>
</html>
```

```js linenums="1" title="index.js"
const myElement = document.getElementById('myElement')
console.log(myElement.textContent) // Hola, mundo!
```

En este ejemplo, el script `index.js` accede al elemento con el identificador `myElement` y muestra su contenido en la consola.

### Métodos de selección de elementos

* **`.getElementById(id)`**
  
    Devuelve el nodo con la _`id`_ pasada. Sólo se devolverá un nodo, ya que los _`id`_ deben ser únicos en el documento.
    
    _Ej.:_

    ```html title="index.html" hl_lines="1"
    <div id="main">
        <p>Lorem ipsum</p>
    </div>
    ```

    ```js title="main.js" hl_lines="1"
    let nodo = document.getElementById('main');
    // nodo contendrá el nodo cuya id es "main"
    ```

* **`.getElementsByClassName(clase)`**
    
    Devuelve una **colección** (`Set`, no un array) con todos los nodos de la _clase_ indicada.
    
    _Ej.:_

    ```html title="index.html" hl_lines="3 5-6"
    <h2>Lista</h2>
    <ul>
        <li class="fruta">Manzana</li>
        <li class="verdura">Brócoli</li>
        <li class="fruta">Pera</li>
        <li class="fruta">Kiwi</li>
    </ul>
    ```

    ```js title="main.js" hl_lines="1"
    let frutas = document.getElementsByClassName('fruta');
    // nodos contendrá todos los nodos cuya clase es "fruta"

    Array.from(frutas).forEach(fruta => console.log(fruta.textContent));
    ```

    ```txt title="Consola"
      Manzana
      Pera
      Kiwi
    ```

    !!! note "NOTA:"
        las colecciones son similares a arrays (se accede a sus elementos con _`[indice]`_) pero no se les pueden aplicar sus métodos _`filter`_, _`map`_, _`forEach`_, etc. a menos que se conviertan a arrays con _`Array.from()`_

* **`.getElementsByTagName(etiqueta)`**
    
    Devuelve una **colección** (`Set`) con todos los nodos de la _**etiqueta**_ HTML indicada.
    
    _Ej.:_

    ```html title="index.html" hl_lines="3-5 8-9"
    <h2>Lista</h2>
    <ul id="frutas">
        <li>Manzana</li>
        <li>Pera</li>
        <li>Kiwi</li>
    </ul>
    <ul id="verduras">
        <li>Brocoli</li>
        <li>Berenjena</li>
    </ul>
    ```

    ```js title="main.js" hl_lines="1"
    let nodos = document.getElementsByTagName('li');
    // nodos contendrá todos los nodos de tipo <li>

    Array.from(nodos).forEach(nodo => console.log(nodo.textContent));
    ```

    ```txt title="Consola"
      Manzana
      Pera
      Kiwi
      Brócoli
      Berenjena
    ```

* **`.querySelector(selector)`**
    
    Devuelve el **primer nodo** seleccionado por el **_selector_ CSS** indicado.
    
    _Ej.:_

    ```html
    <p class="error">Error</p>
    <div>
      <p class="info">No se ha podido cargar la información</p>
      <p class="error">404</p>
      <p>Ayuda: <a href="#">más información</a></p>
    <div>
    ```

    ```js
    let nodo = document.querySelector('p.error')
    // nodo contendrá el primer párrafo de clase _error_
    console.log(nodo.textContent)
    ```

    ```txt title="Consola"
    404
    ```

* **`.querySelectorAll(selector)`**
  
    Devuelve una **colección** con todos los nodos seleccionados por el **_selector_ CSS** indicado.
    
    _Ej.:_
  
    ```html
    <p class="error">Error</p>
    <div>
      <p class="info">No se ha podido cargar la información</p>
      <p class="error">404</p>
      <p>Ayuda: <a href="#">más información</a></p>
    <div>
    ```

    ```js
    let nodo = document.querySelectorAll('p.error')
    // nodos contendrá todos los párrafos de clase _error_
    Array.from(nodos).forEach(nodo => console.log(nodo.textContent))
    ```

    ```txt title="Consola"
    Error
    404
    ```

Existen 'atajos' para obtener algunos de los elementos más comunes:

* `document.documentElement`: devuelve el **nodo** del elemento _`<html>`_
* `document.head`: devuelve el **nodo** del elemento _`<head>`_
* `document.body`: devuelve el **nodo** del elemento _`<body>`_
* `document.title`: devuelve el **nodo** del elemento _`<title>`_
* `document.links`: devuelve una **colección** con todos los **hiperenlaces** del documento
* `document.anchors`: devuelve una **colección** con todas las **anclas** del documento
* `document.forms`: devuelve una **colección** con todos los **formularios** del documento
* `document.images`: devuelve una **colección** con todas las **imágenes** del documento
* `document.scripts`: devuelve una **colección** con todos los **scripts** del documento

## Acceso a nodos a partir de otros

Al aplicar estos métodos sobre _`document`_ se seleccionará sobre la página pero podrían también aplicarse a cualquier nodo y en ese caso la búsqueda se realizaría sólo entre los descendientes de dicho nodo.

Ejemplo de búsqueda de un nodo dentro de otro:

```html
<div id="main">
    <p>Texto 1</p>
    <p>Texto 2</p>
    <div>
        <p>Texto 3</p>
    </div>
</div>

<div id="otro">
    <p>Texto 4</p>
</div>
```

```js title="main.js"
let mainContent = document.getElementById('main');
let parrafos = mainContent.getElementsByTagName('p');
Array.from(parrafos).forEach(p => console.log(p.textContent));
```
  
```txt title="Consola"
Texto 1
Texto 2
Texto 3
```

Los siguientes métodos que se aplican sobre un elemento del árbol DOM:

* **`element.parentElement`**
  
    Propiedad que contiene el **elemento padre** de _elemento_.

    ```html title="html"
    <div> <!-- nodo padre -->
        <p id="elemento">Este es el párrafo</p> <!-- elemento seleccionado -->
    </div>
    ```

    ```js title="js"
    let element = documento.getElementById('elemento');
    let parent = element.parentElement;
    // parent es el nodo <div>
    console.log(parent.nodeName); // 'DIV'
    ```

* **`elemento.children`**
  
    Propiedad que contiene la colección con todos los elementos hijo de _elemento_.
    
    **Sólo elementos HTML**, no comentarios ni nodos de tipo texto.

    ```html title="html"
    <div id="elemento"> <!-- nodo padre -->
        <p>Este es el párrafo</p> <!-- elemento hijo -->
        <p>Este es otro párrafo</p> <!-- elemento hijo -->
    </div>
    ```

    ```js title="js"
    let parent = document.getElementById('elemento')
    let children = parent.children
    // children es una colección con los dos párrafos
    Array.from(children).forEach(child => console.log(child.nodeName, child.textContent))
    ```

    ```txt title="Consola"
    "P", "Este es el párrafo"
    "P", "Este es otro párrafo"
    ```


* **`elemento.childNodes`**
    
    Propiedad que contiene la colección con todos los nodos hijos de _elemento_.
    
    **Incluye comentarios y nodos de tipo texto** por lo que no suele utilizarse.

    ```html title="html"
    <div id="elemento"> <!-- nodo padre -->
        <p>Este es el párrafo</p> <!-- elemento hijo -->
        <p>Este es otro párrafo</p> <!-- elemento hijo -->
    </div>
    ```

    ```js title="js"
    let parent = document.getElementById('elemento')
    let children = parent.childNodes
    // children es una colección con los dos párrafos
    Array.from(children).forEach(child => console.log(child.nodeName, child.textContent))
    ```

    ```txt title="Consola"
    "#text", " "
    "#comment", " nodo padre "
    "#text", "
            "
    "P", "Este es el párrafo"
    "#text", " "
    "#comment", " elemento hijo "
    "#text", "
            "
    "P", "Este es otro párrafo"
    "#text", " "
    "#comment", " elemento hijo "
    "#text", "
        "
    ```

* **`elemento.firstElementChild`**
    
    Devuelve el elemento HTML que es el **primer hijo**.

* **`elemento.firstChild`**
  
    Devuelve el nodo que es el **primer hijo**.
    
    Incluye nodos de tipo texto o comentarios.

* **`elemento.lastElementChild`**, **`elemento.lastChild`**
    
    Igual que _`firstElementChild`_ y _`firstChild`_ pero con el **último hijo**.

* **`elemento.nextElementSibling`**
    
    Devuelve el elemento HTML que es el siguiente hermano de _elemento_

* **`elemento.nextSibling`**
    
    Devuelve el nodo que es el siguiente hermano de _elemento_.
    
    Incluye nodos de tipo texto o comentarios.

* **`elemento.previousElementSibling`**, **`elemento.previousSibling`**
  
    Igual pero con el hermano anterior.

* **`elemento.hasChildNodes`**
    
    Indica si _elemento_ tiene o no nodos hijos.

* **`elemento.childElementCount`**
    
    Devuelve el número de nodos hijo de _elemento_.

!!! warning "IMPORTANTE:"
    A menos que interesen comentarios, saltos de página, etc., **siempre** se deben usar los métodos que sólo devuelven elementos HTML, no todos los nodos.

### Propiedades de un nodo

Las principales propiedades de un nodo son:

* **`elemento.innerHTML`**
  
    Todo lo que hay entre la etiqueta que abre _elemento_ y la que lo cierra, incluyendo otras etiquetas HTML.
    
    _Ej.:_

    ```html title="html"
    <div id="txt">
        <p>primer parrafo hijo de div id="txt"</p>
        <p>segundo parrafo hijo de id="txt" txt</p>
    </div>
    ```

    ```js title="js" hl_lines="2"
    txt = document.getElementById("txt");
    console.log(txt.innerHTML);

    /*
    Mostrará por consola:
        <p>primer parrafo hijo de div id="txt"</p>
        <p>segundo parrafo hijo de id="txt" txt</p>
    */
    ```

* **`elemento.textContent`**

    Todo lo que hay entre la etiqueta que abre _elemento_ y la que lo cierra, pero ignorando otras etiquetas HTML.

    Podemos usarlo tanto para leer como para escribir el contenido de un nodo.
    
    _Ej.:_

    ```html title="html"
    <p id="texto">Esto <span>es</span>un texto</p>
    ```

    ```js title="js" hl_lines="2 6"
    // Lee el contenido:
    var text = document.getElementById("texto").textContent;
    // |text| contiene la cadena "Esto es un texto".

    // Escribe el contenido:
    document.getElementById("texto").textContent = "Nuevo texto";

    // Se ha modificado el HTML en tiempo de ejecución,
    // ahora contiene una nueva cadena:
    //     <p id="texto">Nuevo texto</p>
    ```

* **`elemento.value`**
    
    Devuelve la propiedad *`value`* de un `<input>` (en el caso de un `<input>` de tipo text devuelve lo que hay escrito en él).
    
    Como los `<input>` no tienen etiqueta de cierre (`</input>`) no podemos usar _`.innerHTML`_ ni _`.textContent`_.

    _Por ejemplo_ si _`elem1`_ es el nodo `<input name="nombre">` y _`elem2`_ es el nodo `<input type="radio" value="H"> Hombre`

    ```html title="html"
    <form action="#">
        <label for="nombre">Nombre:</label>
        <input type="text" id="nombre" name="nombre">

        <fieldset>
            <legend>Lenguaje favorito:</legend>
            <div>
                <input type="radio" name="fav" id="html" value="HTML">
                <label for="html">HTML</label>
            </div>
            <div>
                <input type="radio" name="fav" id="css" value="CSS">
                <label for="css">CSS</label>
            </div>
            <div>
                <input type="radio" name="fav" id="js" value="JavaScript" checked>
                <label for="js">JavaScript</label>
            </div>
        </fieldset>
    </form>
    ```

    ```js title="js" hl_lines="2 6"
    let inputNombre = document.getElementById('nombre');
    let name = inputNombre.value;
    // | name | Contiene lo que haya escrito en el <input> en ese momento

    let favChecked = document.querySelector('input[name="fav"]:checked');
    let favorite = favChecked.value;
    // | favorite | Contiene "JavaScript"
    ```

Otras propiedades:

* `elemento.innerText`: Se recomienda no usarlo, es similar a _`textContent`_
* `elemento.focus`: da el foco a _elemento_ (para inputs, etc.).
* `elemento.blur`: quita el foco de _elemento_.
* `elemento.clientHeight` / `elemento.clientWidth`: devuelve el alto / ancho visible del _elemento_
* `elemento.offsetHeight` / `elemento.offsetWidth`: devuelve el alto / ancho total del _elemento_
* `elemento.clientLeft` / `elemento.clientTop`: devuelve la distancia de _elemento_ al borde izquierdo / superior
* `elemento.offsetLeft` / `elemento.offsetTop`: devuelve los píxels que hemos desplazado _elemento_ a la izquierda / abajo

## Manipular el árbol DOM

Vamos a ver qué métodos nos permiten cambiar el árbol DOM, y por tanto modificar el HTML de la página:

* **`document.createElement('etiqueta')`**
    
    crea un nuevo elemento HTML con la etiqueta indicada, pero aún no se añade a la página. _Ej.:_

    ```javascript
    let nuevoLi = document.createElement('li');
    ```

* **`document.createTextNode('texto')`**
    
    crea un nuevo nodo de texto con el texto indicado, que luego tendremos que añadir a un nodo HTML. _Ej.:_

    ```javascript
    let textoLi = document.createTextNode('Nuevo elemento de lista');
    ```

* **`elemento.appendChild(nuevoNodo)`**:

    añade _nuevoNodo_ como último hijo de _elemento_. Ahora ya se ha añadido a la página. _Ej.:_

    ```js hl_lines="5 11"
    let nuevoLi = document.createElement('li');
    let textoLi = document.createTextNode('Nuevo elemento de lista');

    // añade el texto creado al elemento <li> creado
    nuevoLi.appendChild(textoLi);

    // selecciona el 1º <ul> de la página
    let miPrimeraLista = document.getElementsByTagName('ul')[0];

    // añade <li> como último hijo de <ul>, es decir al final de la lista
    miPrimeraLista.appendChild(nuevoLi);
    ```

* **`elemento.insertBefore(nuevoNodo, nodo)`**
    
    añade _nuevoNodo_ como hijo de _elemento_ antes del hijo _nodo_. _Ej.:_

    ```js hl_lines="8"
    // selecciona el 1º <ul> de la página
    let miPrimeraLista = document.getElementsByTagName('ul')[0];

    // selecciona el 1º <li> dentro de miPrimeraLista
    let primerElementoDeLista = miPrimeraLista.getElementsByTagName('li')[0];

    // añade <li> al principio de la lista
    miPrimeraLista.insertBefore(nuevoLi, primerElementoDeLista);
    ```

* **`elemento.removeChild(nodo)`**
    
    borra _nodo_ de _elemento_ y por tanto se elimina de la página. _Ej.:_

    ```js hl_lines="8 11"
    // selecciona el 1º <ul> de la página
    let miPrimeraLista = document.getElementsByTagName('ul')[0];

    // selecciona el 1º <li> dentro de miPrimeraLista
    let primerElementoDeLista = miPrimeraLista.getElementsByTagName('li')[0];

    // borra el primer elemento de la lista
    miPrimeraLista.removeChild(primerElementoDeLista);

    // También podríamos haberlo borrado sin tener el padre con:
    primerElementoDeLista.parentElement.removeChild(primerElementoDeLista);
    ```

* **`elemento.replaceChild(nuevoNodo, viejoNodo)`**

    reemplaza _viejoNodo_ con _nuevoNodo_ como hijo de _elemento_. _Ej.:_

    ```js hl_lines="13"
    // crea el nodo
    let nuevoLi = document.createElement('li');
    let textoLi = document.createTextNode('Nuevo elemento de lista');
    nuevoLi.appendChild(textoLi);

    // selecciona el 1º <ul> de la página
    let miPrimeraLista = document.getElementsByTagName('ul')[0];

    // selecciona el 1º <li> de miPrimeraLista
    let primerElementoDeLista = miPrimeraLista.getElementsByTagName('li')[0];

    // reemplaza el 1º elemento de la lista con nuevoLi
    miPrimeraLista.replaceChild(nuevoLi, primerElementoDeLista);
    ```

* **`elementoAClonar.cloneNode(boolean)`**
    
    devuelve una copia de _elementoAClonar_ o de _elementoAClonar_ con todos sus descendientes según le pasemos como parámetro _`false`_ o _`true`_. Luego podremos insertarlo donde queramos.

    !!! warning "MUCHO CUIDADO"
        Si añadimos con el método `appendChild` un nodo que estaba en otro sitio **se elimina de donde estaba** para añadirse a su nueva posición.
        
        Si queremos que esté en los 2 sitios deberé clonar el nodo y luego añadir la copia y no el nodo original.

**Ejemplo de creación de nuevos nodos**: tenemos un código HTML con un elemento `<div>` que contiene tres párrafos `<p>`.

- Vamos a añadir un nuevo párrafo al final del `<div>` con el texto "`Párrafo añadido al final`"
- Y otro en la segunda posición del `<div>` con el texto "`Este es el <strong>nuevo</strong> segundo párrafo`".

```html linenums="1" title="index.html"
<div id="articulos">
  <p>Este es el primer párrafo que tiene <strong>algo en negrita</strong>.</p>
  <p>Este era el segundo párrafo pero será desplazado hacia abajo.</p>
  <p>Y este es el último párrafo pero luego añadiremos otro después</p>
</div>
```

```js linenums="1" title="main.js"
let miDiv = document.getElementById('articulos')

// Pasos para añadir el último párrafo:
//   <p>Párrafo añadido al final</p>
//
// - Crear un nuevo elemento <p>
// - Crear un nodo de texto con el contenido
// - Añadir el texto al elemento <p>
// - Añadir el elemento <p> al final del <div>

let ultimoParrafo = document.createElement('p')
let ultimoParrafoTexto = document.createTextNode('Párrafo añadido al final')
ultimoParrafo.appendChild(ultimoParrafoTexto)
miDiv.appendChild(ultimoParrafo)

// Pasos para añadir el segundo párrafo:
//   <p>Este es el <strong>nuevo</strong> segundo párrafo</p>
//
// - Crear un nuevo elemento <strong>
// - Crear un nodo de texto con el contenido de la negrita
// - Añadir el texto al elemento <strong>
//
// - Crear un nuevo elemento <p>
// - Crear un nodo de texto con la primera parte del contenido
// - Crear un nodo de texto con la segunda parte del contenido
//
// - Añadir nodo con la primera parte del contenido al elemento <p>
// - Añadir el elemento <strong> al elemento <p>
// - Añadir nodo con la segunda parte del contenido al elemento <p>

let nuevaNegrita = document.createElement('strong')
nuevaNegritaTexto = document.createTextNode('nuevo')
nuevaNegrita.appendChild(nuevaNegritaTexto)

let nuevoSegundoParrafo = document.createElement('p')
let nuevoSegundoParrafoTexto1 = document.createTextNode('Este es el ')
let nuevoSegundoParrafoTexto2 = document.createTextNode(' segundo párrafo')

nuevoSegundoParrafo.appendChild(nuevoSegundoParrafoTexto1)
nuevoSegundoParrafo.appendChild(nuevaNegrita)
nuevoSegundoParrafo.appendChild(nuevoSegundoParrafoTexto2)

let segundoParrafo = miDiv.children[1]
miDiv.insertBefore(nuevoSegundoParrafo, segundoParrafo)
```

[Ejemplo en JSFiddle](https://jsfiddle.net/juansegura/qfcdseua/)

Si utilizamos la propiedad **innerHTML** el código a usar es mucho más simple.

```js linenums="1" title="main.js" hl_lines="3 6"
let miDiv = document.getElementById('articulos')

miDiv.innerHTML += '<p>Párrafo añadido al final</p>'

let nuevoSegundoParrafo = document.createElement('p')
nuevoSegundoParrafo.innerHTML = 'Este es el <strong>nuevo</strong> segundo párrafo'

let segundoParrafo = miDiv.children[1]
miDiv.insertBefore(nuevoSegundoParrafo, segundoParrafo)
```

[Ejemplo en JSFiddle](https://jsfiddle.net/juansegura/x9s7v8kn/)


La forma de añadir el último párrafo (línea #3: `miDiv.innerHTML += '<p>Párrafo añadido al final</p>'`) aunque es válida **no es eficiente** ya que obliga al navegador a volver a renderizar todo el contenido de `miDIV`. Una forma más eficiente sería añadir el párrafo con `appendChild`.

```js linenums="1" hl_lines="3"
let ultimoParrafo = document.createElement('p')
ultimoParrafo.innerHTML = 'Párrafo añadido al final'
miDiv.appendChild(ultimoParrafo)
```

Así sólo debe renderizar el párrafo añadido, conservando todo lo demás que tenga _`miDiv`_.

Podemos ver más ejemplos de creación y eliminación de nodos en [W3Schools](http://www.w3schools.com/js/js_htmldom_nodes.asp).

