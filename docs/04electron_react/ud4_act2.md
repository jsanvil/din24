# ✍️ UD4 - Actividad 2: Estados y efectos en React

Acepta la tarea en _GitHub Classroom_ y clona el repositorio en tu máquina local.

- [https://classroom.github.com/a/lpphGTXH](https://classroom.github.com/a/lpphGTXH)

Realiza las actividades en los ficheros indicados y comprueba que funcionan correctamente.

!!! warning
    Es importante evitar el uso de generadores de código automático para realizar las actividades.

    Si tienes dudas, consulta la documentación o pide ayuda al profesor.

    En caso de existir duda ante la copia o el uso de herramientas de generación de código automático, se pedirá una explicación detallada del código por parte del alumnado implicado. En caso de no poder justificarlo, se considerará copia y se considerará la actividad como no realizada para las partes afectadas.

!!! danger "Commit"
    Haz al menos un **commit** por cada apartado.

## Actividad, efectos y estados

1. Crea un nuevo proyecto de _React_ con _Vite_.
2. Crea un componente `<ProductForm>` que tenga un formulario con los campos `name`, `price` y `stock` y un botón para añadir un producto. Utiliza el estado para almacenar los datos del formulario y validar los campos según las siguientes reglas:
    - El campo `name` es obligatorio.
    - El campo `price` es obligatorio y debe ser un número mayor que 0.
    - El campo `stock` es obligatorio y debe ser un número mayor o igual que 0.
3. Crea un componente `<ProductList>` que muestre una lista de productos con su nombre, precio y stock.
4. Conecta los componentes `<ProductForm>` y `<ProductList>` para que al añadir un producto en el formulario se muestre en la lista. Utiliza el estado para almacenar los productos.
5. Cada vez que cambie el lista de productos en `<ProductList>`, guarda la lista en el _localStorage_.
    - `localStorage.setItem('products', JSON.stringify(products))`
6. Carga la lista de productos del _localStorage_ al iniciar la aplicación.
    - `const products = JSON.parse(localStorage.getItem('products')) || []`
7. Añade un encabezado a `<ProductList>` con eventos para ordenar la lista por nombre, precio y stock al hacer clic en el encabezado.
8. Añade un botón a cada item de la lista de `<ProductList>` para eliminar un producto de la lista.
