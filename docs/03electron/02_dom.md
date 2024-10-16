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
        <li>Brócoli</li>
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
    <h2 class="error">Error</h2>
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
    <h2 class="error">Error</h2>
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
        <p class="elemento">Este es el párrafo</p> <!-- elemento seleccionado -->
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
    
    Devuelve la colección con todos los hijos de _elemento_.
    
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
    "P", "Este es el párrafo"
    "#text", "
      "
    "P", "Este es otro párrafo"
    "#text", "
      "
    "#comment", " comentario "
    "#text", "
    "
    ```

* **`elemento.firstElementChild`**
    
    Devuelve el elemento HTML que es el **primer hijo** de _elemento_ 

* **`elemento.firstChild`**
  
    Devuelve el nodo que es el **primer hijo** de _elemento_.
    
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