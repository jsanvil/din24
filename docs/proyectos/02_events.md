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

## Sprint 3 - Persistencia y preferencias

(27/01/2025 - 02/02/2025)

- Persistencia de datos en almacenamiento local.
    - Guardar y cargar la lista de eventos en un fichero JSON almacenado en el perfil de usuario.
    - **Operaciones** en segundo plano.
- Guardar las **preferencias** de usuario de forma local.
    - **Filtros** aplicados.
    - **Orden** de la lista de eventos.

## Sprint 4 - Integración con API de eventos

(03/02/2025 - 09/02/2025)

Integrar llamadas a una **API** de eventos.

En este punto, puedes migrar la persistencia de datos a la API o mantener la persistencia local y utilizar la API cómo fuente de datos.

Consultar repositorio: [https://github.com/jsanvil/din25-events-api](https://github.com/jsanvil/din25-events-api) para más información. **`API_KEY` en _Aules_**

El repositorio contiene una API de eventos que se puede utilizar para obtener eventos de ejemplo. No hace falta implementar la API, solo consumirla, pero tienes la opción de implementar tu propia API.
   
!!!note "API de eventos"
    La API puede no estar disponible en todo momento y puede tener un límite de peticiones.

Implementar llamadas a la API desde el proceso principal de _Electron_ y almacenar los eventos en el estado de la aplicación para mostrarlos en la lista.

### API URL

- [https://din25-events.jacinto-sanchez.workers.dev/api/v1/events](https://din25-events.jacinto-sanchez.workers.dev/api/v1/events)

### Endpoints

- `GET /api/v1/events`: Obtener lista de eventos. Soporta parámetros de consulta para búsqueda, filtrado por fecha, paginación y ordenación. (Ver abajo)
- `GET /api/v1/events/:id`: Obtener un evento por id.
- `POST /api/v1/events`: Crear un nuevo evento.
- `PUT /api/v1/events/:id`: Actualizar un evento por id.
- `DELETE /api/v1/events/:id`: Eliminar un evento por id.

### Esquema del evento

```json
{
  "id": "EVENT_ID",
  "title": "Event Title",
  "description": "Event Description",
  "location": "Event Location",
  "date": "2025-01-01 00:00",
  "price": 0.0,
  "image": "https://example.com/image.jpg"
}
```

### Parámetros de consulta

- Filtros:
    - `search`: Buscar eventos que contengan la cadena dada en el nombre o descripción.
    - `min_date`: Filtrar eventos por fecha mínima. (Fecha en formato ISO 8601 o marca de tiempo Unix)
    - `max_date`: Filtrar eventos por fecha máxima. (Fecha en formato ISO 8601 o marca de tiempo Unix)
- Paginación:
    - `limit`: Limitar el número de eventos devueltos. (Entero entre 1 y 10)
    - `offset`: Desplazar el número de eventos devueltos. (Entero >= 0)
- Ordenar:
    - `sort`: Ordenar eventos por un campo. (Cadena) "title" | "location" | "date" | "price"
    - `order`: Ordenar eventos por un campo. (Cadena) "asc" | "desc"

_Ejemplos:_

- `GET /api/v1/events?search=Event`: Buscar eventos que contengan la cadena "Event".
- `GET /api/v1/events?min_date=2025-01-01`: Filtrar eventos por fecha mínima.
- `GET /api/v1/events?max_date=2025-12-31`: Filtrar eventos por fecha máxima.
- `GET /api/v1/events?min_date=2025-01-01&max_date=2025-12-31`: Filtrar eventos por fecha mínima y máxima.
- `GET /api/v1/events?search=Event&min_date=2025-01-01`: Buscar eventos que contengan la cadena "Event" y filtrar por fecha mínima.
- `GET /api/v1/events?limit=10&offset=0`: Limitar el número de eventos devueltos y desplazar los resultados.
- `GET /api/v1/events?sort=title&order=asc`: Ordenar eventos por título en orden ascendente.
- `GET /api/v1/events?sort=date&order=desc`: Ordenar eventos por fecha en orden descendente.
- `GET /api/v1/events?search=Event&min_date=2025-01-01&limit=10&offset=0&sort=title&order=asc`: Buscar eventos que contengan la cadena "Event", filtrar por fecha mínima, limitar el número de eventos devueltos, desplazar los resultados, ordenar por título en orden ascendente.

### Autenticación

Se requiere autenticación mediante token en el **header** para todas las solicitudes.

**`x-api-key`**: Clave API para autenticación.

**🔐 Una `API_KEY` válida estará disponible en el _Moodle_ de los estudiantes.**

_Ejemplo:_

```shell
curl -X POST https://din25-events.jacinto-sanchez.workers.dev/api/v1/events \
-H "x-api-key: API_KEY" \
-H "Content-Type: application/json" \
-d '{"title": "New Event", "description": "This is a new event.", "location": "New Location", "date": "2025-01-01", "price": 0}'
```

```js
fetch(
  'https://din25-events.jacinto-sanchez.workers.dev/api/v1/events',
  {
    method: 'POST',
    headers: {
      'x-api-key': 'API-KEY',
      'Content-Type': 'application/json'
    },
    body: JSON.stringify({
      title: 'New Event',
      description: 'This is a new event.',
      location: 'New Location',
      date: '2025-01-01',
      price: 0
    })
  })
  .then(response => response.json())
  .then(data => console.log(data))
  .catch(error => console.error(error));
```



<!--
## Sprint 5 - Usabilidad y diseño

(10/02/2025 - 16/02/2025)

## Objetivos

- Añadir **estilos** a la aplicación.
- Realizar un **diseño** de la aplicación.
    - **Boceto** de las vistas.
    - **Librerías** de componentes.
    - **Consistencia** y **atractivo** en el diseño.
    - **Usabilidad**.
- Implementar **internacionalización** en la aplicación.
- Añadir **accesibilidad** a la aplicación.
    - **Contraste** de colores.
    - **Teclado** para la navegación.

## Sprint 6 - Pruebas y documentación

(17/02/2025 - 21/02/2025)

## Objetivos

- Realizar **pruebas** de la aplicación.
- **Documentación** del proyecto.
    - **README.md** con los detalles del proyecto.
    - **Comentarios** en el código.
    - **Tags** en los _commits_ de cada _sprint_.
    - **Repositorio** en _GitHub_.
    - **Estilo** de código limpio y ordenado. -->

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
