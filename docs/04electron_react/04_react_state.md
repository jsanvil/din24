# 4.4 Reaccionando a cambios de estado con `useState`

Los componentes a menudo necesitan cambiar lo que se muestra en pantalla como resultado de una interacción. Escribir dentro de un formulario debería actualizar el campo de texto, hacer clic en «siguiente» en un carrusel de imágenes debería cambiar la imagen que es mostrada; hacer clic en un botón para comprar un producto debería actualizar el carrito de compras. En los ejemplos anteriores los componentes deben «recordar» cosas: el campo de texto, la imagen actual, el carrito de compras. En _React_, a este tipo de memoria de los componentes se le conoce como estado.

Vamos a crear un componente que muestre un contador, y que se pueda incrementar o decrementar:

```js title="src/renderer/src/component/Counter.jsx" linenums="1"
export default function Counter() {
  let counter = 0

  function handleIncrement() {
    counter++
  }

  function handleDecrement() {
    counter--
  }

  return (
    <div className="row gap-3">
      <button className="btn btn-success col" onClick={handleIncrement}>
        +1
      </button>
      <button className="btn btn-danger col" onClick={handleDecrement}>
        -1
      </button>
      <h2 className="text-center">Contador: {counter}</h2>
    </div>
  )
}
```

En este ejemplo, el contador se encuentra en una variable `counter`. Cuando se hace clic en los botones, se modifica su valor, pero el componente no se vuelve a renderizar, y no podemos ver los cambios.

Para solucionarlo vamos a utilizar un **estado**. Un estado es un objeto que contiene datos que pueden cambiar durante la vida del componente. Para crear un estado, utilizamos el _hook_ `useState`:

```js title="src/renderer/src/component/Counter.jsx" linenums="1" hl_lines="1 4 7 11 22"
import { useState } from 'react'

export default function Counter() {
  const [counter, setCounter] = useState(0)

  function handleIncrement() {
    setCounter(counter + 1)
  }

  function handleDecrement() {
    setCounter(counter - 1)
  }

  return (
    <div className="row gap-3">
      <button className="btn btn-success col" onClick={handleIncrement}>
        +1
      </button>
      <button className="btn btn-danger col" onClick={handleDecrement}>
        -1
      </button>
      <h2 className="text-center">Contador: {counter}</h2>
    </div>
  )
}
```

`useState` devuelve un array con dos elementos: el estado actual, y una función para actualizar el estado. En este ejemplo, el estado inicial es `0`, y la función para actualizar el estado es `setCounter`. Cuando se llama a `setCounter`, el componente se vuelve a renderizar, y se muestra el nuevo valor del contador.

## Estado inicial

El estado inicial se pasa como argumento a `useState`. En el ejemplo anterior, el estado inicial es `0`:

```js
const [counter, setCounter] = useState(0)
```

El estado inicial puede ser cualquier valor, como un número, un string, un array, un objeto, etc.

## Actualizar el estado

Para actualizar el estado, llamamos a la función que nos devuelve `useState`. En el ejemplo anterior, las funciones para actualizar utilizan `setCounter`:

```js
function handleIncrement() {
  setCounter(counter + 1)
}
function handleDecrement() {
  setCounter(counter - 1)
}
```

La función para actualizar el estado recibe como argumento el nuevo valor del estado. En el ejemplo, el nuevo valor del estado es `counter + 1`.

## Leer el estado

Para leer el estado, utilizamos la variable que nos devuelve `useState`. En el ejemplo anterior, la variable que nos devuelve `useState` es `counter`:

```js
<h2 className="text-center">Contador: {counter}</h2>
```

### Ejemplo estado utilizando una lista

Vamos a crear un componente que muestre una lista de la compra. El componente tendrá un formulario para añadir productos, y un botón para eliminarlas.

```js title="src/renderer/src/component/GroceryList.jsx" linenums="1" hl_lines="1 4 6 11-12 17-20 24 31-39"
import { useState } from 'react'

export default function GroceryList() {
  const [groceries, setGroceries] = useState([])

  function handleSubmit(event) {
    event.preventDefault()
    const form = event.target
    const input = form.elements['itemName']
    if (input.value === '') return
    const newList = [...groceries, input.value]
    setGroceries(newList)
    input.value = ''
    input.focus()
  }

  function handleDelete(index) {
    const newList = groceries.filter((value, i) => i !== index)
    setGroceries(newList)
  }

  return (
    <div className="row gap-3">
      <form className="input-group mb-3" onSubmit={handleSubmit}>
        <input name="itemName" type="text" className="form-control" />
        <button className="btn btn-primary" type="submit">
          Añadir
        </button>
      </form>
      <ul className="list-group">
        {groceries.map((grocery, index) => (
          <li className="list-group-item" key={index}>
            <span>{grocery}</span>
            <button className="btn btn-danger float-end"
                onClick={() => handleDelete(index)}>
              Eliminar
            </button>
          </li>
        ))}
      </ul>
    </div>
  )
}
```

En este ejemplo, se define una variable de estado `groceries` que será un array con las cadenas de texto de los productos. El estado inicial es un array vacío:

```js
const [groceries, setGroceries] = useState([])
```

Cuando se envía el formulario, se captura con el controlador de eventos `onSubmit`, y pasa el control a nuestra función `handleSubmit` que se añade un nuevo elemento al array:

```js
function handleSubmit(event) {
  event.preventDefault()
  const form = event.target
  const input = form.elements['itemName']
  if (input.value === '') return
  const newList = [...groceries, input.value]
  setGroceries(newList)
  input.value = ''
  input.focus()
}
```

- `event.preventDefault()` evita que se envíe el formulario para poder manejarlo nosotros.
- `const form = event.target` el evento incluye el elemento que lo ha disparado en la propiedad `target`.
- `form.elements['itemName']` recogemos el elemento del formulario con el nombre `itemName`, en este caso hemos definido un `input` de texto.
- `if (input.value === '') return` si el campo de texto está vacío, no tiene sentido añadir el producto, por lo que se sale de la función.
- `const newList = [...groceries, input.value]` se crea un nuevo array, partiendo del original y añadiendo el nuevo elemento, en este caso el valor del `input` de texto.
- `setGroceries(newList)` se actualiza el estado con el nuevo array y se vuelve a renderizar el componente.
- `input.value = ''` se vacía el campo de texto para poder introducir un nuevo producto.
- `input.focus()` se devuelve el foco en el campo de texto para poder introducir un nuevo producto de forma más rápida.

Cuando se hace clic en el botón de eliminar, se elimina un elemento del array:

```js
function handleDelete(index) {
  const newList = groceries.filter((value, i) => i !== index)
  setGroceries(newList)
}
```

- `const newList = groceries.filter((value, i) => i !== index)` se utiliza el método `filter` para crear un nuevo array con todos los elementos menos el que se quiere eliminar.
  
    Recibe dos parámetros, aunque sólo estamos utilizando el segundo, que es el índice del elemento que queremos borrar de la lista.
    
    El primer parámetro lo utilizaríamos si nuestra lista tuviera identificadores únicos para cada elemento, y quisiéramos eliminar el elemento con un identificador concreto.

    `filter` también se suele utilizar para filtrar los elementos que cumplen una condición, por ejemplo, obtener elementos que contengan una cadena de texto concreta, o que tengan un valor numérico mayor que un número determinado.

Para renderizar la lista, utilizamos el método `map`:

```js
{groceries.map((grocery, index) => (
    <li className="list-group-item" key={index}>
        <span>{grocery}</span>
        <button className="btn btn-danger float-end" onClick={() => handleDelete(index)}>
            Eliminar
        </button>
    </li>
))}
```

`map` recibe como parámetro una función que se ejecutará por cada elemento del array. Esta función recibe como parámetro el elemento del array, y el índice del elemento.

En este ejemplo, la función recibe como parámetro el producto, y el índice del producto. Por cada producto, se renderiza un elemento `li` con el nombre del producto, y un botón para eliminarlo.

Es importante definir la propiedad `key`. Es necesaria para que _React_ pueda identificar cada elemento de la lista, y poder actualizarla correctamente cuando se modifique el estado.

## Estados entre componentes

Para compartir estados entre componentes, podemos crear un componente que contenga el estado, y pasarlo como `props` a los componentes que lo necesiten.

En el ejemplo anterior podemos extraer los elementos de la lista a un componente separado.

```js title="src/renderer/src/component/GroceryItem.jsx" linenums="1"
export default function GroceryItem({ grocery, index, handleDelete }) {
  return (
    <li className="list-group-item">
      <span>{grocery}</span>
      <button className="btn btn-danger float-end" onClick={() => handleDelete(index)}>
        Eliminar
      </button>
    </li>
  )
}
```

Y utilizarlo en el componente `GroceryList`:

```js title="src/renderer/src/component/GroceryList.jsx" linenums="22" hl_lines="11-15"
  return (
    <div className="row gap-3">
      <form className="input-group mb-3" onSubmit={handleSubmit}>
        <input name="itemName" type="text" className="form-control" />
        <button className="btn btn-primary" type="submit">
          Añadir
        </button>
      </form>
      <ul className="list-group">
        {groceries.map((grocery, index) => (
          <GroceryItem
            key={index}
            grocery={grocery}
            index={index}
            handleDelete={handleDelete} />
        ))}
      </ul>
    </div>
  )
```

De esta forma delegamos el comportamiento de cada elemento de la lista a un componente separado, y el componente `GroceryList` se encarga de gestionar el estado general de la lista.

## Diálogo de confirmación

Para eliminar un elemento de la lista, podemos utilizar un diálogo de confirmación, podemos crear nuestro propio componente, o por ejemplo el `Modal` de _Bootstrap_. Para el ejemplo vamos a utilizar ipcRenderer para enviar un mensaje al proceso principal, y que este muestre el diálogo de confirmación del sistema.

En el proceso principal vamos a definir un manejador de eventos para el mensaje `openConfirmationDialog`:

```js title="src/main/index.js"
  ipcMain.handle('openConfirmationDialog', async (event, title, message) => {
    const window = BrowserWindow.getFocusedWindow()
    const result = await dialog.showMessageBox(window, {
      type: 'warning',
      title: title,
      message: message,
      buttons: ['Sí', 'Cancelar'],
      cancelId: 1,
      defaultId: 0
    })
    console.log(result.res)
    return result.response === 0
  })
```

En el script de precarga definimos una función `openConfirmationDialog` que envía un mensaje al proceso principal:

```js title="src/preload/index.js"
const api = {
  openConfirmationDialog: (title, message) =>
    ipcRenderer.invoke('openConfirmationDialog', title, message)
}
```

Por último, desde el componente `GroceryList` podemos utilizar la función `openConfirmationDialog` para mostrar el diálogo de confirmación:

```js title="src/renderer/src/component/GroceryList.jsx"
  async function handleDelete(index) {
    await window.api.openConfirmationDialog(
        groceries[index],
        '¿Seguro de que quieres eliminar este elemento?')
      .then((confirmed) => {
        if (confirmed) {
          const newList = groceries.filter((_value, i) => i !== index)
          setGroceries(newList)
        }
      })
  }
```

## Referencias

- [React | useState](https://react.dev/reference/react/useState)
