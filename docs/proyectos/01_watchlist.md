# Proyecto 1 - Lista de seguimiento

El objetivo de este proyecto es crear una aplicación en _Electron_ que permita gestionar una lista de seguimiento de libros, juegos, películas y series. La aplicación debe permitir añadir, editar, eliminar y filtrar elementos de la lista. Además, se debe poder guardar y cargar la lista en un fichero json.

- Tendrá un peso del **70%** sobre la calificación de la primera evaluación.
- Fecha límite de entrega **21/11/2024** a las **23:59**.
- _GitHub Classroom_: [https://classroom.github.com/a/jeAbMzt9](https://classroom.github.com/a/jeAbMzt9)

## Requisitos

- **Estructura del proyecto**.
    - El proyecto debe estar bien estructurado en archivos HTML, JS y CSS.
    - Separar el código en módulos bien definidos mediante **import** y **export**.
    - En la lógica de la aplicación, no utilizar frameworks o librerías externas a los proporcionados por Node.js y Electron.
    - Se podrán utilizar librerías de estilos. (Bootstrap, Materialize, etc.)
- **Código estructurado**. Las variables, clases y funciones están bien comentadas. Los nombres de las clases, funciones y variables son descriptivos.
- **Utilizar clases** para representar los elementos de la colección y la lista.
- Los **elementos** tendrán los siguientes **atributos**:
    - **`Name`**. **Obligatorio**. Máximo 50 caracteres. 
    - **`Type`**. `book`, `game`, `movie`.
    - **`Status`**. `completed`, `in_progress`, `pending`. Por defecto, `pending`.
    - **`Rating`**. Calificación del 1 al 5. Si es 0 se considera sin calificar.
    - **`Notes`**. Máximo 200 caracteres.
- **Funcionalidades**:
    - **Listado de elementos**.
        - El estado se debe representar con **colores** y/o **iconos**.
        - Los cambios en los elementos deben **actualizar** la lista automáticamente.
        - Los elementos de la lista deben mostrar los siguientes atributos:
            - **Nombre**.
            - **Tipo**. Icono o texto.
            - **Estado**. Icono o texto.
            - **Calificación**.
        - Los elementos deben tener tres opciones: **editar**, **cambiar estado** y **eliminar**.
        - **Cambiar estado** del elemento. Se debe actualizar la lista al cambiar el estado.
        - **Eliminar** elemento. Debe pedir confirmación al usuario. Se debe actualizar la lista al eliminar un elemento.
        - **Editar** elemento. Mostrará un formulario con los campos del elemento con los valores actuales.
            - Tendrá una opción para **cancelar** la edición.
            - Si hay cambios y se cancela la edición, se debe pedir confirmación al usuario.
            - Se debe validar el formulario y mostrar todos los errores antes de guardar los cambios.
    - **Añadir** nuevo elemento. Mostrará un formulario vacío con los campos del elemento. Se debe validar el formulario y mostrar todos los errores.
    - **Filtros**. Se deben poder combinar varios filtros.
        - **Tipo**. `book`, `game`, `movie`, `serie`.
        - **Estado**. `completed`, `in_progress`, `pending`.
        - **Calificación**. Mínimo y máximo (1-5).
        - **Búsqueda**. Campo de texto.
            - Filtra el listado según se escribe.
            - Si el texto está contenido en `name` o `notes`, se mostrará el elemento.
        - **Botón** para **limpiar** filtros.
    - **Ordenar** elementos, en orden ascendiente y descendiente, por los siguientes atributos:
        - Estado.
        - Nombre.
        - Calificación.
    - **Persistencia**. Leer y escribir la lista de seguimiento en un **fichero json**.
        - Se debe guardar la lista al realizar cambios.
        - Se debe cargar la lista al abrir la aplicación.
        - Las operaciones se deben realizar en segundo plano, sin bloquear la interfaz, y mostrar un mensaje de éxito o error.
- **Documentación**. Incluir fichero **`README.md`** en la raíz del proyecto con la siguiente información:
    - Nombre del proyecto.
    - Nombre y apellidos.
    - Detalles de implementación, decisiones y problemas encontrados.
- **Seguimiento**
    - El repositorio de _GitHub Classroom_ debe reflejar el progreso.
    - Se deben realizar al menos 10 commits.
    - Los commits deben se concisos e informativos.
    - Durante el desarrollo del proyecto, se realizarán reuniones de seguimiento para comprobar el progreso.

## Evaluación

- 10% Añadir nuevo elemento.
- 20% Lista de elementos y acciones.
- 15% Editar elemento.
- 10% Cambiar estado del elemento.
-  5% Eliminar elemento.
- 15% Filtros y búsqueda.
-  5% Ordenar elementos.
- 10% Leer y escribir la lista en un fichero json.
- 10% Estructura, organización y documentación.
