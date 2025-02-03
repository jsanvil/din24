# 5.2 API REST

## Introducción

Una API REST es una interfaz de programación de aplicaciones que se basa en la arquitectura REST (_Representational State Transfer_). Es un estilo de arquitectura que se basa en la comunicación a través de HTTP, utilizando los métodos de este protocolo para realizar operaciones CRUD (_Create, Read, Update, Delete_) sobre recursos.

## Métodos HTTP

Los **métodos** HTTP más comunes utilizados en una API REST son:

- **`GET`**: **Obtiene** un recurso o una colección de recursos.
- **`POST`**: **Crea** un nuevo recurso.
- **`PUT`**: **Actualiza** un recurso.
- **`DELETE`**: **Elimina** un recurso.
- **`PATCH`**: **Actualiza** parcialmente un recurso.

## Endpoints

Un _**endpoint**_ es una URL que se utiliza para acceder a un recurso o a una colección de recursos. Por ejemplo, si tenemos una API REST que gestiona usuarios, podríamos tener los siguientes endpoints:

- `GET /users`: Obtiene todos los usuarios.
- `GET /users/:id`: Obtiene un usuario por su ID.
- `POST /users`: Crea un nuevo usuario.
- `PUT /users/:id`: Actualiza un usuario por su ID.
- `DELETE /users/:id`: Elimina un usuario por su ID.

## Autenticación

La autenticación es un aspecto importante en una API REST, ya que permite controlar el acceso a los recursos. Existen diferentes métodos de autenticación, cómo por ejemplo:

- **Basic Auth**: Se envían las credenciales (usuario y contraseña) en la cabecera de la petición. Es un método sencillo pero menos seguro.
- **API Key**: Se envía una clave de API en la cabecera de la petición. Se utiliza para identificar a la aplicación que realiza la petición.
- **Bearer Token**: Se envía un token de acceso en la cabecera de la petición. Asocian un token con un usuario o aplicación.
- **JWT (JSON Web Token)**: Se envía un token codificado en la cabecera de la petición. Los JWT son tokens que contienen información codificada en formato JSON.
- **OAuth**: Se utiliza un flujo de autorización para obtener un token de acceso. Se utiliza para delegar la autenticación a un proveedor de identidad externo (Google, Facebook, etc.).

## Variables de entorno

Las **variables de entorno** son valores que se utilizan en una aplicación para configurar su comportamiento. Se utilizan para almacenar información sensible, cómo claves de API, tokens de acceso, URLs de servicios, etc. y se acceden desde el código de la aplicación.

En nuestro caso, `electron-vite` cargará variables de entorno desde la raíz del proyecto, y usará diferentes prefijos para limitar el alcance disponible.

Por defecto, las variables con el prefijo `MAIN_VITE_` están disponibles para el proceso principal, `PRELOAD_VITE_` para los scripts de precarga, `RENDERER_VITE_` para los renderizadores y `VITE_` para todos.

```env
# .env
KEY=123                # no disponible
MAIN_VITE_KEY=123      # solo disponible para el proceso principal
PRELOAD_VITE_KEY=123   # solo disponible para los scripts de precarga
RENDERER_VITE_KEY=123  # solo disponible para los renderizadores
VITE_KEY=123           # disponible para todos
```

Para recuperar una variable de entorno en el código de la aplicación, el objeto `process.env` se puede utilizar para acceder a las variables de entorno.

```js title="main/index.js"
console.log(process.env.MAIN_VITE_KEY);
console.log(process.env.VITE_KEY);
```

## fetch()

`fetch()` es una función de JavaScript que se utiliza para realizar peticiones HTTP. Es una API moderna que proporciona una interfaz sencilla y potente para realizar solicitudes de red. `fetch()` devuelve una promesa que resuelve la respuesta de la petición.

### Sintaxis

```js
fetch(url, options)
  .then(response => response.json())
  .then(data => console.log(data))
  .catch(error => console.error(error));
```

Descripción de los elementos de la sintaxis:

- **`fetch()`**: Función para realizar una petición HTTP.
- **`url`**: URL de la petición.
- **`options`**: Opciones de la petición (método, cabeceras, cuerpo, etc.).

    ```js title="Ejemplo de opciones"
    {
      method: 'GET', // 'POST', 'PUT', 'DELETE', etc.
      headers: {
        'Content-Type': 'application/json',
        'Authorization: 'Bearer TOKEN'
        'x-api-key': 'API_KEY'
        // ...
      },
      body: JSON.stringify(data)
    }
    ```

- **`then()`**: Método para manejar la respuesta de la petición.
- **`catch()`**: Método para manejar los errores de la petición.
- **`data`**: Datos de la respuesta de la petición.
- **`error`**: Error de la petición.
- **`response`**: Objeto de la respuesta de la petición (cabeceras, estado, etc.).
    - **`response.ok`**: Propiedad que indica si la petición fue exitosa (código de estado 200-299).
    - **`response.status`**: Código de estado de la respuesta. (200, 404, 500, etc.)
    - **`response.statusText`**: Mensaje de estado de la respuesta. ("OK", "Not Found", "Internal Server Error", etc.)
    - **`response.headers`**: Cabeceras de la respuesta. (Objeto con las cabeceras)
        - _Ejemplo: `response.headers.get('Content-Type')`_
    - **`response.text()`**: Método para obtener el cuerpo de la respuesta en formato texto.
    - **`response.json()`**: Método para obtener el cuerpo de la respuesta en formato JSON.

## Ejemplo de uso

En el repositorio [https://github.com/jsanvil/din25-events-api](https://github.com/jsanvil/din25-events-api) se encuentra la documentación de una API REST que gestiona eventos. En este repositorio se pueden encontrar los endpoints disponibles, así cómo ejemplos de uso de la API.

!!!note "API de eventos"
    La API puede no estar disponible en todo momento y puede tener un límite de peticiones.

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
