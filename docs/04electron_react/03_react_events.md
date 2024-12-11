# 4.3 Eventos _React_

_React_ te permite añadir controladores de eventos. Los controladores de eventos son funciones que se ejecutarán en respuesta a interacciones como `click`, `hover`, `focus`, `change`, etc. Recordar que en Javascript se definen con `addEventListener`, pero en _JSX_ se definen directamente como si fueran atributos de los elementos del DOM.

Ejemplo de un botón que muestra una alerta cuando se hace clic:

```jsx title="src/renderer/src/App.jsx" hl_lines="8"
export default function AlertButton() {
  function handleClick() {
    alert('¡Me hiciste click!');
  }

  return (
    <button onClick={handleClick}>
        Clic aquí
    </button>
  );
}
```

En el ejemplo, el controlador de eventos `onClick` hará que se ejecute la función `handleClick` cuando se haga clic en el botón, mostrando un mensaje de alerta.

!!!nota "onClick"
    `onClick` es un atributo especial de _JSX_ que se utiliza para añadir controladores de eventos a los elementos del DOM. En _React_, los nombres de los eventos se escriben en camelCase, por ejemplo, `onClick` en lugar de `onclick`.

    Al contrario que en HTML, donde no se recomienda usar `onclick` en favor de `addEventListener`, debemos recordar que _JSX_ no es _HTML_, el transpilador, en este caso _Vite_, transformará el código _JSX_ a _JavaScript_.

Dentro de los controladores de eventos, podemos indicar el nombre de la función a llamar, como hemos visto, o también podemos ejecutar código directamente:

```jsx
<button onClick={ () => alert('¡Me hiciste clic!') }>
    Clic aquí
</button>
```

En este caso es importante declarar una función anónima con `() =>` para que se ejecute el código cuando se haga clic en el botón, y no cuando se renderice el componente.

### Pasar `props` en los controladores de eventos

Como los controladores de eventos son declarados dentro de un componente, tienen acceso a las props del componente.

Este es un botón que, cuando se hace clic, muestra una alerta con su prop message:

```jsx
function AlertButton({ message, children }) {
  return (
    <button onClick={() => alert(message)}>
      {children}
    </button>
  );
}

export default function App() {
  return (
    <div>
      <AlertButton message="¡Hola!">
        Saludar
      </AlertButton>
      <AlertButton message="Hasta luego">
        Despedirse
      </AlertButton>
    </div>
  );
}
```

!!!note "children"
    `children` es una prop especial que _React_ proporciona a los componentes. Representa el contenido entre las etiquetas de apertura y cierre de un componente. En este caso, `children` representa el texto "Saludar" y "Despedirse".

## Referencias

- [React | Responding to Events](https://react.dev/learn/responding-to-events)
- [React | Children](https://react.dev/reference/react/Children)
