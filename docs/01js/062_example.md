# Ejercicio de refuerzo sobre programación asíncrona y orientada a objetos

## 1: Promesa con Retraso Personalizado

Crea una promesa llamada `delayedPromise` que se resuelva después de un tiempo definido por el usuario (en milisegundos) y devuelva un mensaje que diga "`Operación completada`". Si se resuelve en menos de `500 ms`, el mensaje debe ser "`Operación rápida`", y si tarda más, se debe rechazar la promesa con el mensaje "`Operación lenta`".

**Objetivo**: Comprender el manejo básico de promesas con diferentes condiciones de resolución.

## 3: Función Asíncrona con Manejo de Errores

Desarrolla la función asíncrona `handlePromise` que usará `delayedPromise` y recibirá un _callback_. Si la promesa se resuelve exitosamente, ejecuta el _callback_, que imprimirá "`La promesa se ha resuelto con éxito`". Si ocurre un error, imprime "`Error en la promesa`".

**Objetivo**: Aprender a manejar errores en promesas y funciones asíncronas.

## 3: Obtener Información de un Usuario

Crea una promesa `userPromise` que haga una solicitud `fetch()` a la API de un servicio público, como `https://jsonplaceholder.typicode.com/users/1`, y devuelva el objeto JSON del usuario. Consume la promesa y muestra el objeto JSON en la consola, utilizando `JSON.stringify(jsonData, null, 2)`.

**Objetivo**: Familiarizarse con la obtención de datos de una API utilizando `fetch`.

## 4: Función Asíncrona para Mostrar Información del Usuario

Desarrolla la función asíncrona `displayUserInfo` que consuma `userPromise`. Esta función debe extraer y mostrar en consola el nombre del usuario, su correo electrónico y su dirección.

**Formato de salida esperado**:
```
Nombre: Leanne Graham
Correo: Sincere@april.biz
Dirección: 26, Gilbert Avenue
```

**Objetivo**: Aprender a manipular y mostrar datos obtenidos de una API.

## 5: Función Asíncrona para Buscar Posts y Comentarios de un Usuario

Crea una función asíncrona `getUserPosts` que reciba el ID de un usuario y devuelva un objeto con los posts y comentarios de ese usuario. Utiliza las APIs `https://jsonplaceholder.typicode.com/posts?userId=${user_id}&_limit=2` y `https://jsonplaceholder.typicode.com/posts/${postId}/comments?&_limit=2` para obtener los datos. Se limita a 2 posts y 2 comentarios por post para simplificar la salida.

Esta es una tarea más compleja que implica la gestión de múltiples promesas y la combinación de datos de diferentes fuentes. No se pueden obtener los comentarios, primero se deben obtener los posts y luego los comentarios de cada post.

**Formato de salida esperado**:
```
Posts de Leanne Graham:
1. sunt aut facere repellat provident occaecati excepturi optio reprehenderit
   "quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto"

    Comentario: id labore ex et quam laborum
    Comentario: quia et suscipit

2. qui est esse
   "est rerum tempore vitae\nsequi sint nihil reprehenderit dolor beatae ea dolores neque\nfugiat blanditiis voluptate porro vel nihil molestiae ut reiciendis\nqui aperiam non debitis possimus qui neque nisi nulla"

    Comentario: est natus enim nihil est dolore omnis voluptatem numquam
    Comentario: omnis nemo voluptatem est
```


Posts de Ervin Howell:

**Objetivo**: Practicar la manipulación de múltiples promesas y la combinación de datos de diferentes fuentes.

## 6: Clases de Estudiante y Escuela

En el script **`poo.js`**, crea las clases `Student` y `School` según las especificaciones dadas:

### Clase `Student`
- Propiedades: `id`, `name`, `grades`
- Métodos: `addGrade()`, `getAverage()`, `getDescription()`

### Clase `School`
- Propiedades: `name`, `students`
- Métodos: `addStudent()`, `getAllStudents()`, `getStudentById()`

**Ejemplo de uso**:
```javascript
let school = new School("Greenwood High");
school.addStudent(1, "Alice");
school.addStudent(2, "Bob");
console.log(school.getAllStudents());
```

**Objetivo**: Comprender la estructura de clases y la manipulación de objetos en JavaScript.

## 7: Clase de Estudiante con Descuento

Crea la clase `ScholarshipStudent` que extienda de `Student`. Esta clase debe incluir una propiedad para el porcentaje de descuento en las tasas escolares. Añade métodos para calcular el importe a pagar después de aplicar el descuento y mostrar la descripción del estudiante con el descuento.

**Ejemplo de uso**:
```javascript
let scholarshipStudent = new ScholarshipStudent(3, "Charlie", 20);
console.log(scholarshipStudent.getDescription());
console.log("Total a pagar: $" + scholarshipStudent.calculateTuition());
```

**Objetivo**: Aprender sobre herencia en programación orientada a objetos y cómo añadir funcionalidad específica.

## 8: Filtros de Estudiantes

Desarrolla la clase `FilterStudents` que tenga métodos para filtrar y ordenar estudiantes basados en sus calificaciones. Implementa métodos para devolver una descripción de los estudiantes filtrados.

**Ejemplo de uso**:
```javascript
let filterStudents = new FilterStudents(school.getAllStudents());
let filteredStudents = filterStudents.filterByGrade(75, 100);
console.log(filteredStudents.toString());
```

**Objetivo**: Implementar funcionalidades avanzadas de filtrado y ordenación de datos.
