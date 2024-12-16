# 4.5 Responder a cambios externos con  `useEffect`

Para responder a cambios externos en un componente funcional, podemos usar el hook `useEffect`. 

`useEffect` es un _hook_ que nos permite realizar reaccionar a cambios externos en componentes funcionales. Los cambios son operaciones que no afectan directamente al estado del componente, como la suscripción a eventos, la recuperación de datos de una API, la manipulación del DOM, etc.

`useEffect` se ejecuta después de cada renderizado del componente, a menos que se especifique lo contrario. Puede ejecutarse solo una vez después de que el componente se haya renderizado o cada vez que una dependencia cambie.

## Inicialización

Como **primer argumento**, `useEffect` recibe una **función** que contiene la lógica del efecto, es decir, la acción que queremos realizar.

Por ejemplo, si queremos mostrar un mensaje en la consola cada vez que el componente se renderice, podemos hacer lo siguiente:

```jsx
import React, { useEffect } from 'react';

function App() {
  useEffect(() => {
    console.log('Componente renderizado');
  }, []);

  return (
    <div>
      <h1>Hola Mundo</h1>
    </div>
  );
}

export default App;
```

El **segundo argumento** de `useEffect` es una **array de dependencias**. Si el array está vacío, el efecto se ejecutará solo una vez después de que el componente se haya renderizado en el DOM. Si el array contiene elementos, el efecto se ejecutará cada vez que uno de los elementos cambie.

En el ejemplo anterior, hemos pasado un array vacío como segundo argumento, lo que significa que el efecto se ejecutará **solo una vez** después de que el componente se haya renderizado en el DOM.

```jsx
useEffect(() => {
  // lógica del efecto
}, []);
```

La función del primer argumento puede devolver otra función que se ejecutará cuando el componente se desmonte. Esto se conoce como **limpieza de efectos**.

```jsx
useEffect(() => {
  // lógica del efecto

  return () => {
    // Limpieza de efectos
  }
}, []);
```

## Actualización

Como hemos mencionado anteriormente, `useEffect` se ejecuta después de cada renderizado, a menos que se especifique lo contrario con un array de dependencias.

Posibles valores del array de dependencias:

- **`undefined` (sin array)**: el efecto se ejecuta después de cada renderizado.
- **`[]` (array vacío)**: el efecto se ejecuta solo una vez después de que el componente se haya renderizado.
- **`[valor1, valor2, ...]`**: el efecto se ejecuta cada vez que uno de los valores cambie.

Si queremos que el efecto se ejecute cada vez que el estado de un componente cambie, podemos pasar el estado como una dependencia en el array de dependencias. Por ejemplo, si queremos que el efecto se ejecute cada vez que el estado `count` cambie, podemos hacer lo siguiente:

```jsx
import React, { useState, useEffect } from 'react';

function App() {
  const [count, setCount] = useState(0);

  useEffect(() => {
    console.log(`Count: ${count}`);
  }, [count]);

  return (
    <div>
      <p>Count: {count}</p>
      <button onClick={() => setCount(count + 1)}>Increment</button>
    </div>
  );
}

export default App;
```

En este ejemplo, hemos pasado el estado `count` como una dependencia en el array de dependencias. Esto significa que el efecto se ejecutará cada vez que el estado `count` cambie.

```jsx
useEffect(() => {
  // lógica del efecto
}, [count]);
```

## Limpieza de efectos

Es importante limpiar los efectos cuando el componente se desmonta o se actualiza. Para hacer esto, podemos devolver una función de limpieza en la configuración. Esta función se ejecutará cuando el componente se desmonte o se actualice.

Si el efecto se ejecuta solo una vez, la función de limpieza se ejecutará cuando el componente se desmonte. Si el efecto se ejecuta cada vez que una dependencia cambia, la función de limpieza se ejecutará antes de que se ejecute el efecto la próxima vez.

```jsx
import React, { useEffect } from 'react';

function App() {
  useEffect(() => {
    const handleClick = (e) => {
      console.log('Position: ', e.clientX, e.clientY)
    }

    document.addEventListener('click', handleClick)

    return () => {
      document.removeEventListener('click', handleClick)
    }
  }, [])

  return (
    <button>Click me</button>
  )
}

export default App;
```

En este ejemplo, hemos creado una lógica que escucha el evento `click` en el documento. Cuando el botón se hace clic, se muestra un mensaje en la consola.

En el ejemplo anterior, hemos devuelto una función de limpieza que elimina el evento `click` cuando el componente se desmonta. De esta manera, nos aseguramos de que no haya fugas de memoria ni eventos no deseados.

## Ejemplo completo

```jsx
import React, { useState, useEffect } from 'react';

function App() {
  const [count, setCount] = useState(0);

  useEffect(() => {
    console.log(`Count: ${count}`);

    return () => {
      console.log('Componente desmontado');
    }
  }, [count]);

  return (
    <div>
      <p>Count: {count}</p>
      <button onClick={() => setCount(count + 1)}>Increment</button>
    </div>
  );
}

export default App;
```

En este ejemplo, hemos creado un contador que se incrementa cada vez que se hace clic en el botón. Hemos usado `useEffect` para mostrar el valor del contador en la consola cada vez que cambie. También hemos devuelto una función de limpieza que muestra un mensaje en la consola cuando el componente se desmonta.

## Referencias

- [React - Sincronizar con Efectos](https://es.react.dev/learn/synchronizing-with-effects)
- [React - useEffect](https://es.react.dev/reference/react/useEffect)
