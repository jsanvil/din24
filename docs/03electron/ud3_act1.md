# ✍️ UD3 - Actividad 1: Document Object Model (DOM)

Acepta la tarea en _GitHub Classroom_ y clona el repositorio en tu máquina local.

- [https://classroom.github.com/a/3tPzjQzi](https://classroom.github.com/a/3tPzjQzi)

Realiza las actividades en los ficheros indicados y comprueba que funcionan correctamente.

!!! warning
    Es importante evitar el uso de generadores de código automático para realizar las actividades.

    Si tienes dudas, consulta la documentación o pide ayuda al profesor.

    En caso de existir duda ante la copia o el uso de herramientas de generación de código automático, se pedirá una explicación detallada del código por parte del alumnado implicado. En caso de no poder justificarlo, se considerará copia y se considerará la actividad como no realizada para las partes afectadas.

!!! danger "Commit"
    Haz al menos un **commit** por cada apartado.

## 1. Seleccionar elementos

Descarga [esta página _html_ de ejemplo](./assets/ejemploDOM.html) en el directorio de la actividad.
    
Crea el archivo **`index.js`** y añade el código necesario para obtener los siguientes elementos y mostrar por consola su contenido con `innerHTML`:

- El elemento con `id` '`input2`'
- La colección de párrafos
- Lo mismo pero sólo de los párrafos que hay dentro del `div` *'lipsum'*
- El formulario (ojo, no la colección con el formulario sino sólo el formulario)
- Todos los elementos `input`
- Sólo los `input` con nombre *'sexo'*
- Los items de lista con clase '`important`' (sólo los `<li>`)
- El **primer párrafo** que hay dentro del `div` con `id` _`'lipsum'`_
- El **segundo párrafo** de _`'lipsum'`_
- El **último item** de la **lista**
- El `label` de *'Escoge sexo'*

## 2. Modificar elementos

Siguiendo con la [página de ejemplo](./ejercicios/ejemploDOM.html) y la estructura del ejercicio anterior, añade el código necesario para realizar las los siguientes operaciones:

- Selecciona y muestra por consola el `innerHTML` de la etiqueta de _'Escoge sexo'_.
- Selecciona y muestra por consola `textContent` de esa etiqueta.
- Modifica el `textContent` de esa etiqueta para que ponga _'Género:'_.
- Selecciona y muestra por consola valor del primer `input` de _'sexo'_.
- Selecciona y muestra por consola valor del _'sexo'_ que esté seleccionado.

## 3. Crear y añadir elementos

Siguiendo con la [página de ejemplo](./ejercicios/ejemploDOM.html) y la estructura del ejercicio anterior, añade el código necesario para añadir a la página:

- Un nuevo párrafo al final del DIV _'lipsum'_ con el texto "Nuevo párrafo **añadido** por javascript" (fíjate que una palabra esta en negrita)
- Un nuevo elemento al formulario tras el _'Dato 1'_ con la etiqueta _'Dato 1 bis'_ y el INPUT con id _'input1bis'_ que al cargar la página tendrá escrito "Hola"

## 4. Generar una tabla de tamaño variable

En esta actividad tendrás que crear una página que permita generar una tabla de tamaño variable, seleccionar una celda al azar y borrar la tabla.

- Crea los archivos **`index.html`** y **`main.js`** en una carpeta aparte llamada **`tabla/`**.
- Dale una estructura básica a la página `index.html` y añade un el script `main.js`.
- Crea los siguientes elementos en la página:
    - Un `<input type="text">` con `id` _`'table_x'`_
    - Un `<input type="text">` con `id` _`'table_y'`_
    - Un botón `<button>` con `id` _`'generar'`_ y texto _`'Generar'`_, añade el atributo `onclick` con el valor _`'generarTabla()'`_
    - Añade un `<button>` con `id` _`'borrar'`_ y texto _`'Borrar'`_, añade el atributo `onclick` con el valor _`'borrarTabla()'`_
    - Un `<div>` con `id` _`'tabla'`_
    - Un `<ol>` con `id` _`'seleccion'`_
- En `main.js` crea una función **_`generarTabla()`_** que:
    - Lea los valores de los `<input>` de _`'table_x'`_ y _`'table_y'`_
    - Cree una tabla de _`table_x`_ filas y _`table_y`_ columnas dentro del `<div>` _`'tabla'`_
    - Cada celda de la tabla tendrá un un `id` _`'celda_x_y'`_ donde _`x`_ es el número de fila y _`y`_ el número de columna. El texto del `<span>` será _`'x,y'`_.
- Función **_`borrar()`_** que:
    - Limpie el contenido del `<div>` _`'tabla'`_, los valores del formulario y el contenido del `<ol>` _`'seleccion'`_.
- Función **_`seleccionaCelda()`_** que:
    - Seleccione una celda al azar de la tabla y cambie su color de fondo, por ejemplo a rojo.
    - Añada un nuevo elemento `<li>` al `<ol>` _`'seleccion'`_ con el texto de la celda seleccionada (_`'x,y'`_).
    - Modifica `index.html` para aparezca un botón _`'Seleccionar'`_ y en el atributo `onclick` valor _`'seleccionaCelda()'`_.
    - Si existen celdas seleccionadas con anterioridad, se debe cambiar el color de fondo a otro distinto de la seleccionada actualmente, por ejemplo a gris.
    - _**Consejo**: resultará más fácil si modificas las **clases** de las celdas en lugar de los estilos directamente._

- _Opcional:_
    - _¿Qué ocurre si se pulsa el botón _`'Generar'`_ sin haber borrado la tabla anterior? Implementa una solución._
