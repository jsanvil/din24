# 4.6 Estado global con Redux

El estado global de una aplicación es el conjunto de datos que se comparte entre todos los componentes de la aplicación.

A medida que una aplicación crece, la gestión del estado se vuelve más complicada, ya que los componentes necesitan compartir datos y comunicarse entre sí, llevando a problemas de _prop drilling_.

React incluye _Context API_ para compartir datos entre componentes, pero no es suficiente para aplicaciones grandes y complejas. Para gestionar el estado de una aplicación de forma eficiente, podemos utilizar _Redux_.

_Redux_ es una biblioteca de gestión de estado que nos permite almacenar y gestionar el estado de nuestra aplicación de forma centralizada. Redux es muy útil en aplicaciones grandes y complejas, ya que facilita la gestión de los datos y la comunicación entre componentes.

En este apartado vamos a ver cómo añadir Redux a nuestra aplicación de _React_.

## Instalación

Para añadir Redux a nuestra aplicación de _React_, necesitamos instalar las siguientes dependencias:

- `@reduxjs/toolkit`: Es un conjunto de herramientas que facilitan la gestión de estado con Redux.
- `react-redux`: Es una biblioteca que nos permite conectar Redux con _React_.

```bash
$ npm install @reduxjs/toolkit react-redux
```

## Crear un _store_

El _store_ es el objeto central de Redux que almacena el estado de la aplicación. Para crear un _store_, necesitamos importar la función `configureStore` de `@reduxjs/toolkit` y pasarle un objeto con los _reducers_ de la aplicación.

Un _reducer_ es una función que recibe el estado actual y una acción, y devuelve un nuevo estado. Los _reducers_ son funciones puras, es decir, no deben modificar el estado actual, sino devolver un nuevo estado.

Vamos a crear un _reducer_ simple que almacene un contador:

```jsx title="src/renderer/src/store.js"
import { configureStore } from '@reduxjs/toolkit'

const initialState = {
  counter: 0,
};

function counterReducer(state = initialState, action) {
  switch (action.type) {
    case 'INCREMENT':
      return { ...state, counter: state.counter + 1 }
    case 'DECREMENT':
      return { ...state, counter: state.counter - 1 }
    default:
      return state;
  }
}

export const store = configureStore({
  reducer: {
    counter: counterReducer,
  },
});
```

En el ejemplo, hemos creado un _reducer_ `counterReducer` que almacena un contador. El _reducer_ recibe el estado actual y una acción, y devuelve un nuevo estado. En este caso, el _reducer_ incrementa o decrementa el contador según la acción recibida.

Hemos creado un _store_ con `configureStore` y le hemos pasado el _reducer_ `counterReducer`.

## Conectar Redux con _React_

Para conectar Redux con _React_, necesitamos envolver nuestra aplicación con el componente `Provider` de `react-redux` y pasarle el _store_ como prop.

```jsx title="src/renderer/src/index.js"
import React from 'react';
import ReactDOM from 'react-dom';
import { Provider } from 'react-redux';
import { store } from './store';
import App from './App';

ReactDOM.render(
  <Provider store={store}>
    <App />
  </Provider>,
  document.getElementById('root')
);
```

En el ejemplo, hemos envuelto nuestra aplicación con el componente `Provider` y le hemos pasado el _store_ como prop.

## Acceder al estado de Redux

Para acceder al estado de Redux en un componente de _React_, podemos utilizar el _hook_ `useSelector` de `react-redux`.

```jsx title="src/renderer/src/App.jsx"
import React from 'react';
import { useSelector } from 'react-redux';

export default function App() {
  const counter = useSelector(state => state.counter);

  return (
    <div>
      <p>Counter: {counter}</p>
      <button>Increment</button>
      <button>Decrement</button>
    </div>
  );
}
```

En el ejemplo, hemos utilizado el _hook_ `useSelector` para acceder al estado `counter` del _store_. El _hook_ recibe una función que recibe el estado completo y devuelve el valor que queremos seleccionar.

## Despachar acciones

Para despachar acciones en Redux, podemos utilizar el _hook_ `useDispatch` de `react-redux`.

```jsx title="src/renderer/src/App.jsx"
import React from 'react';
import { useSelector, useDispatch } from 'react-redux';

export default function App() {
  const counter = useSelector(state => state.counter);
  const dispatch = useDispatch();

  const increment = () => {
    dispatch({ type: 'INCREMENT' });
  }

  const decrement = () => {
    dispatch({ type: 'DECREMENT' });
  }

  return (
    <div>
      <p>Counter: {counter}</p>
      <button onClick={increment}>Increment</button>
      <button onClick={decrement}>Decrement</button>
    </div>
  );
}
```

En el ejemplo, hemos utilizado el _hook_ `useDispatch` para obtener la función `dispatch` que nos permite despachar acciones en Redux. Hemos creado dos funciones `increment` y `decrement` que despachan las acciones `INCREMENT` y `DECREMENT` respectivamente.

## Ejemplo completo

```jsx title="src/renderer/src/store.js"
import { configureStore } from '@reduxjs/toolkit'

const initialState = {
  counter: 0,
};

function counterReducer(state = initialState, action) {
  switch (action.type) {
    case 'INCREMENT':
      return { ...state, counter: state.counter + 1 }
    case 'DECREMENT':
      return { ...state, counter: state.counter - 1 }
    default:
      return state;
  }
}

export const store = configureStore({
  reducer: {
    counter: counterReducer,
  },
});
```

```jsx title="src/renderer/src/index.js"
import React from 'react';
import ReactDOM from 'react-dom';
import { Provider } from 'react-redux';
import { store } from './store';
import App from './App';

ReactDOM.render(
  <Provider store={store}>
    <App />
  </Provider>,
  document.getElementById('root')
);
```

```jsx title="src/renderer/src/App.jsx"
import React from 'react';
import { useSelector, useDispatch } from 'react-redux';

export default function App() {
  const counter = useSelector(state => state.counter);
  const dispatch = useDispatch();

  const increment = () => {
    dispatch({ type: 'INCREMENT' });
  }

  const decrement = () => {
    dispatch({ type: 'DECREMENT' });
  }

  return (
    <div>
      <p>Counter: {counter}</p>
      <button onClick={increment}>Increment</button>
      <button onClick={decrement}>Decrement</button>
    </div>
  );
}
```

En el ejemplo, hemos creado un contador con Redux. Hemos creado un _reducer_ `counterReducer` que almacena el contador, un _store_ con `configureStore` y hemos conectado Redux con _React_ utilizando el componente `Provider` y los _hooks_ `useSelector` y `useDispatch`.

## Referencias

- [Redux](https://redux.js.org/)

