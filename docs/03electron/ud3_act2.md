# ✍️ UD3 - Actividad 2: Eventos y formularios

Acepta la tarea en _GitHub Classroom_ y clona el repositorio en tu máquina local.

- [https://classroom.github.com/a/dKdFE5JY](https://classroom.github.com/a/dKdFE5JY)

Realiza las actividades en los ficheros indicados y comprueba que funcionan correctamente.

!!! warning
    Es importante evitar el uso de generadores de código automático para realizar las actividades.

    Si tienes dudas, consulta la documentación o pide ayuda al profesor.

    En caso de existir duda ante la copia o el uso de herramientas de generación de código automático, se pedirá una explicación detallada del código por parte del alumnado implicado. En caso de no poder justificarlo, se considerará copia y se considerará la actividad como no realizada para las partes afectadas.

!!! danger "Commit"
    Haz al menos un **commit** por cada apartado.

## 1. Validación nativa de HTML5

Dentro de la carpeta **`validacionHTML/`** crea un archivo **`index.html`** y construye un formulario de registro con los siguientes campos:

- **`Nombre de usuario`**: Requerido, entre `5` y `20` caracteres, sólo letras y números.
- **`Contraseña`**: Requerido, entre `8` y `20` caracteres, al menos una letra mayúscula, una minúscula y un número.
- **`Repetir contraseña`**: Requerido, misma validación que la contraseña.
- **`E-mail`**: Requerido, debe ser un e-mail válido.
- **`Código postal`**. Numérico, entre `5` y `7` dígitos.
- **`Fecha de nacimiento`**: Debe ser una fecha válida.
- **`Acepto las condiciones`**: Requerido.
- **`Enviar`**. Botón que envía el formulario si es válido.

Utiliza la validación nativa de HTML5.

## 2. Validación de formularios con JavaScript

Dentro de la carpeta **`validacionAPI/`** crea los archivos **`index.html`** y **`main.js`** y construye un formulario de registro con los siguientes campos:

  - **`Nombre de usuario`**: Requerido, entre `5` y `20` caracteres, sólo letras y números.
  - **`Contraseña`**: Requerido, entre `8` y `20` caracteres, al menos una letra mayúscula, una minúscula y un número.
  - **`Repetir contraseña`**: Requerido, debe ser igual a la `contraseña`.
  - **`E-mail`**: Requerido, debe ser un e-mail válido.
  - **`Código postal`**. Debe ser un código postal válido.
  - **`Fecha de nacimiento`**: Debe ser una fecha válida.
  - **`Acepto las condiciones`**: Requerido, _checkbox_ que debe estar marcado.
  - **`Enviar`**. Botón que envía el formulario si es válido.

Utiliza la validación de formularios de HTML5 y la API de validación de formularios de JavaScript.

Utiliza etiquetas `<span class="error">` para mostrar mensajes de error debajo de los campos que no cumplen las reglas de validación.

## 3. Mensajes de error personalizados

Dentro de la carpeta **`validacionMensajes/`** copia los archivos **`index.html`** y **`main.js`** de la actividad anterior y modifica el código JavaScript para que muestre mensajes de error personalizados en lugar de los mensajes por defecto del navegador.

## 4. Validación de campos en tiempo real

Dentro de la carpeta **`validacionTiempoReal/`** copia los archivos **`index.html`** y **`main.js`** de la actividad anterior y modifica el código JavaScript para que valide los campos en tiempo real, mostrando mensajes de error en el momento en que se incumple una regla de validación. Para ello deberás utilizar eventos de formulario y de entrada de texto.

El botón de enviar sólo estará habilitado si el formulario es válido. Esto se puede hacer estableciendo el atributo `disabled="true"` del botón.
