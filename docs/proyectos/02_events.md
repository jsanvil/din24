# Proyecto 2 - Gestión de eventos

El objetivo de este proyecto es crear una aplicación en _Electron_ que permita gestionar eventos sociales (conciertos, exposiciones, conferencias, quedadas, talleres, etc.).

El proceso de creación de eventos sociales es una tarea que requiere de una buena organización y planificación. La aplicación permitirá a los usuarios crear, editar, listar, eliminar y filtrar eventos.

Se plantearán una serie de requisitos y funcionalidades que deberán ser implementados en la aplicación.

- Tendrá un peso del **70%** sobre la calificación de la segunda evaluación.
- Fecha límite de entrega **21/02/2025** a las **23:59**.
- _GitHub Classroom_: [https://classroom.github.com/a/4e3M9n71](https://classroom.github.com/a/4e3M9n71)

## Metodología

- **Metodología ágil**. Se utilizarán metodologías ágiles para el desarrollo del proyecto.
    - _Sprints_. Se dividirá el proyecto en sprints de una semana.
    - _Sprint Review_. Reuniones al final de cada sprint para revisar el trabajo realizado.
- **Documentación**.
    - Se deberá incluir un fichero `README.md` en el repositorio con los detalles del proyecto.
    - Incluir **comentarios** al menos en la cabecera de cada uno de los componentes.
- **Código**. Se deberá seguir una estructura de código clara y organizada.
    - **Repositorio**. Utilizar un repositorio de _GitHub_ para el control de versiones.
        - Marcar con _tags_ (etiquetas) los _commits_ de cada _sprint_.
    - **Estilo**.
        - Se deberá seguir un estilo de código limpio y ordenado.
        - Nombres descriptivos y claros.
        - Los **nombres** de las clases, funciones y variables deberán estar en **inglés**.
- **Persistencia**.
    - Utilizar una base de datos externa.
    - Se deberá guardar guardar las preferencias de usuario de forma local.
- **Diseño**.
    - La interfaz deberá seguir un diseño **consistente**, limpio y atractivo.
    - Realizar un boceto previo de cada una de las vistas de la aplicación.
    - Utilizar librerías de componentes.
- **Usabilidad**. Se deben seguir **principios básicos de usabilidad**, justificando las decisiones tomadas en una sección del `README.md`.
- **Accesibilidad**.
    - Usar lenguaje claro y sencillo.
    - Utilizar colores, contrastes y tamaños de letra adecuados.
    - Implementar sistema de navegación mediante teclado.
    - Implementar sistema sistema de localización y cambio de idioma.

## Sprint 1 - Creación de proyecto y componentes

(13/01/2025 - 19/01/2025)

### Objetivos

- Crear **nuevo proyecto** utilizando _**electron-vite**_.
- El modelo de **datos** de un evento (**`EventItem`**) contendrá los siguientes atributos:
    - **`id`**: Cadena de texto única generada automáticamente.
    - **`title`**: Cadena de texto. Máximo 50 caracteres. **Obligatorio**.
    - **`description`**: Cadena de texto. Máximo 200 caracteres.
    - **`location`**: Cadena de texto. Máximo 100 caracteres. **Obligatorio**.
    - **`date`**: Fecha y hora del evento. **Obligatorio**. Por defecto, una semana después de la fecha actual.
    - **`price`**: Número decimal. Precio del evento, en euros. Por defecto, 0 (gratuito). **Obligatorio**.
    - **`image`**: Cadena de texto con la URL de la imagen.
- Utiliza **Redux** para gestionar el estado de la aplicación.
- Crear los siguientes **componentes** y vistas:
    - `EventDetail`: **Vista detallada** de un evento. Mostrará **todos los atributos** del evento.
    - `EventList`: Muestra la lista de eventos.
        - **Limitar la lista a 10 elementos** y añadir un botón para cargar más eventos.
        - `EventListItem`: **Vista de un elemento** de la lista de eventos.
            - Mostrará el **título**, **imagen**, **fecha** y **precio** del evento.
            - Al hacer clic en un elemento, se mostrará la vista detallada del evento.
            - Añadir un botón para **editar** y **eliminar** el evento.
            - Indicar con un **icono** las siguientes características:
                - Si el evento es **gratuito**.
                - Si el evento ha **caducado**, tiene fecha anterior a la actual.
                - Si el evento está **próximo**, en los próximos 7 días.

## Sprint 2 - Editar, detalles, navegación, filtros

(20/01/2025 - 26/01/2025)

- Utiliza **React Router** para la navegación entre las vistas.
- Nuevos componentes:
    - `EventCreate`: **Formulario** para **crear** un evento.
    - `EventEdit`: **Formulario** para **editar** un evento.
    - `EventListFilter`: **Filtros** para la lista de eventos. Mostrará el número de eventos que cumplen los filtros.
        - **Buscar por nombre**, case insensitive y que contenga el texto.
        - Filtrar por **periodo de fechas**.

<!-- - **Funcionalidades**:
    - **Listado de elementos**.
        - El estado se debe representar con **colores** y/o **iconos**.
        - Los cambios en los elementos deben **actualizar** la lista automáticamente.
        - Los elementos de la lista deben mostrar los siguientes atributos:
            - **Nombre**.
            - **Tipo**. Icono o texto.
            - **Estado**. Icono o texto.
            - **Calificación**.
        - Los elementos deben tener tres opciones: **editar**, **cambiar estado** y **eliminar**.
            - **Cambiar estado**. Se debe actualizar la lista al cambiar el estado.
            - **Eliminar**. Debe pedir confirmación al usuario. Se debe actualizar la lista al eliminar un elemento.
            - **Editar**. Mostrará una vista ampliada con todos los atributos del elemento.
    - **Añadir** nuevo elemento. Mostrará un formulario vacío con los campos del elemento. Se debe validar el formulario y mostrar todos los errores.
    - **Editar** elemento. Mostrará un formulario con los campos del elemento con los valores actuales.
        - Tendrá una opción para **cancelar** la edición.
        - Si hay cambios y se cancela la edición, se debe pedir confirmación al usuario.
        - Se debe validar el formulario y mostrar todos los errores antes de guardar los cambios.
    - **Filtros**. Se deben poder combinar varios filtros.
        - **Tipo**. `book`, `game`, `movie`.
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

Para la evaluación del proyecto se tendrán en cuenta los siguientes ponderaciones teniendo en cuenta el alcance de los requisitos:

- **5%** Estructura del proyecto
- **85%** Funcionalidades
    - _25%_ Listado de elementos
        - 10% Mostrar
        - 5% Cambiar estado
        - 5% Eliminar
        - 5% Editar
    - _10%_ Añadir
    - _15%_ Editar
    - _15%_ Filtros
    - _10%_ Ordenar
    - _10%_ Persistencia
- **5%** Documentación
- **5%** Seguimiento

Se evaluará en modo desarrollo y la aplicación debe poder abrirse sin errores de inicio.

Se aceptarán entregas tardías con una penalización del 10% por día. -->
