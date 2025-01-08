# ✍️ UD4 - Actividad 3: Rutas y estado global

Acepta la tarea en _GitHub Classroom_ y clona el repositorio en tu máquina local.

- [https://classroom.github.com/a/skxdK4On](https://classroom.github.com/a/skxdK4On)

Realiza las actividades en los ficheros indicados y comprueba que funcionan correctamente.

!!! warning
    Es importante evitar el uso de generadores de código automático para realizar las actividades.

    Si tienes dudas, consulta la documentación o pide ayuda al profesor.

    En caso de existir duda ante la copia o el uso de herramientas de generación de código automático, se pedirá una explicación detallada del código por parte del alumnado implicado. En caso de no poder justificarlo, se considerará copia y se considerará la actividad como no realizada para las partes afectadas.

!!! danger "Commit"
    Haz al menos un **commit** por cada apartado.

## Actividad estado global

1. Partiendo del proyecto de la actividad anterior, implementa un `store` global con _Redux_ para almacenar el estado de la aplicación, con un _slice_ para gestionar la lista de productos, con las siguientes acciones:
    - `createProduct(product)`: Añadir un producto a la lista.
    - `readProduct(id)`: Leer un producto de la lista.
    - `updateProduct(product)`: Actualizar un producto de la lista.
    - `deleteProduct(id)`: Eliminar un producto de la lista.
2. Integra el _store_ en la aplicación y realiza las operaciones CRUD en la lista de productos.
3. Implementa un componente `ProductDetails` que muestre los detalles de un producto.
4. Utiliza rutas para mostrar la lista de productos y los detalles de un producto.
