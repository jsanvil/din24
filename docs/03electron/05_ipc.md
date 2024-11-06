# 3.5 Comunicación entre procesos

_Electron_ hereda su **arquitectura multiproceso de _Chromium_**, lo que hace que el marco sea muy similar a un navegador web moderno.

## ¿Por qué no un solo proceso?

Los navegadores web son aplicaciones increíblemente complicadas. Aparte de su capacidad principal para mostrar contenido web, tienen muchas responsabilidades secundarias, como administrar múltiples ventanas (o pestañas) y cargar extensiones de terceros.

Anteriormente, los navegadores solían utilizar un único proceso para toda esta funcionalidad. Aunque este patrón significaba menos sobrecarga para cada pestaña abierta, también significaba que un sitio web que fallaba o se bloqueaba afectaría a todo el navegador.

## El modelo multi proceso

Para resolver este problema, el equipo de _Chromium_ decidió que cada pestaña se mostraría en su propio proceso, limitando el daño que un código malicioso o con errores podría causar a la aplicación en su conjunto. Un único proceso del navegador controla estos procesos, así como el ciclo de vida de la aplicación en su conjunto. El diagrama de [_Chrome Comic_](https://www.google.com/googlebooks/chrome/med_04.html) visualiza este modelo.

Las aplicaciones _Electron_ están estructuradas de manera muy similar. El desarrollador controla dos tipos de procesos: [**principal**](#el-proceso-principal) (_main process_) y [**renderizado**](#el-proceso-de-renderizado) (_renderer process_).

<figure markdown="span">
    ![Arquitectura detallada en Electron](./assets/react_process.png){ width=95% }
    <figcaption>Arquitectura detallada en Electron</figcaption>
</figure>

## El proceso principal

Cada aplicación de _Electron_ tiene **un único proceso principal**, que actúa como punto de entrada de la aplicación. El proceso principal **se ejecuta en un entorno _Node.js_**, lo que significa que tiene la capacidad de requerir módulos y utilizar todas las API de _Node.js_.

### Gestión de ventanas

El propósito principal del proceso principal es **crear y administrar ventanas** de aplicaciones con el módulo **`BrowserWindow`**.

Cada instancia de la clase `BrowserWindow` crea una ventana de aplicación que carga una página web en un **proceso de renderizado independiente**. Se puede interactuar con este contenido web desde el proceso principal utilizando el objeto **`webContents`** de la ventana.

```js title="main.js" linenums="1"
const { BrowserWindow } = require('electron')

const win = new BrowserWindow({ width: 800, height: 1500 })
win.loadURL('https://github.com')

const contents = win.webContents
console.log(contents)
```

!!! note "Nota:"
    También se crea un proceso de renderizado para webs incrustadas como el módulo `BrowserView`. El objeto `webContents` también es accesible para contenido web incrustado.

Debido a que el módulo `BrowserWindow` es un `EventEmitter`, también puede agregar controladores para varios eventos de usuario (_por ejemplo, minimizar o maximizar la ventana_).

Cuando una instancia de `BrowserWindow` se destruye, su proceso de renderizado también finaliza.

### Ciclo de vida de la aplicación

El proceso principal también controla el ciclo de vida de su aplicación a través del **módulo `app`** de _Electron_. Este módulo proporciona un gran conjunto de eventos y métodos que se pueden utilizar para agregar un comportamiento personalizado de la aplicación (_por ejemplo_, cerrar la aplicación mediante código, modificar el _dock_ de la aplicación o mostrar un panel _'Acerca de'_).

Como ejemplo práctico, la aplicación que se muestra en la guía de inicio rápido utiliza `app` para crear una experiencia de ventana de aplicación más nativa.

```javascript title="main.js"
// cerrando la aplicación cuando no queden ventanas abiertas en plataformas no macOS
app.on('window-all-closed', () => {
  if (process.platform !== 'darwin') app.quit()
})
```

### Aplicaciones nativas

Para ampliar las funciones de _Electron_ más allá de ser un contenedor de _Chromium_ con contenidos web, el proceso principal también agrega API personalizadas para interactuar con el sistema operativo del usuario. _Electron_ expone varios módulos que controlan la funcionalidad nativa del escritorio, como menús, cuadros de diálogo e íconos de bandeja del sistema.

Para obtener una lista completa de los principales módulos de proceso de _Electron_, se puede consultar la [documentación API](https://www.electronjs.org/docs/latest/api/app).

## El proceso de renderizado

Cada aplicación de _Electron_ genera **un proceso de renderizado independiente para cada `BrowserWindow`** (y cada web embebida). Un renderizador es responsable de representar contenido web. A todos los efectos, el código ejecutado en los procesos de renderizado debe comportarse de acuerdo con los estándares web.

Por lo tanto, todas las interfaces de usuario y las funciones de las aplicaciones dentro de una única ventana del navegador deben escribirse con las mismas herramientas y paradigmas que utiliza en la web.

Lo mínimo que debe comprender es:

- Un archivo HTML es su punto de entrada para el proceso de renderizado.
- Se puede agregar código _JavaScript_ para la interactividad.
- El estilo de la interfaz de usuario se agrega mediante hojas de estilo en cascada (CSS).

Además, esto también significa que **el renderizador no tiene acceso directo a `require`** o otras API de _Node.js_.

!!! warning "ATENCIÓN"
    Los procesos de renderizado se pueden generar con un entorno _Node.js_ completo para facilitar el desarrollo. Históricamente, esta solía ser la opción predeterminada, pero esta función estaba deshabilitada por razones de seguridad.

Pero entonces, ¿cómo las interfaces de usuario del proceso de renderizado pueden interactuar con _Node.js_ y la funcionalidad de escritorio nativa de _Electron_ si solo se puede acceder a estas funciones desde el proceso principal?. De hecho, no existe una forma directa de importar los _scripts_ de contenido de _Electron_.

## Scripts de precarga

Los _scripts_ de precarga contienen código que se ejecuta en un proceso de renderizado antes de que su contenido web comience a cargarse. Estos scripts se ejecutan dentro del contexto del renderizador, pero se les otorgan más privilegios al tener acceso a las API de _Node.js_.

Se puede adjuntar un _script_ de precarga al proceso principal en el constructor `BrowserWindow` en la opción **`webPreferences`**.

```javascript title="main.js" hl_lines="4-6"
const { BrowserWindow } = require('electron')
// ...
const win = new BrowserWindow({
  webPreferences: {
    preload: 'path/to/preload.js'
  }
})
// ...
```

Debido a que el script de precarga comparte una interfaz `Window` global con los renderizadores y puede acceder a las API de _Node.js_, sirve para mejorar su renderizador al exponer API arbitrarias en el `window` global que luego puede consumir su contenido web.

Aunque los scripts de precarga comparten un `window` global con el renderizador al que están adjuntos, no puede adjuntar directamente ninguna variable desde el script de precarga a `window` debido al valor predeterminado de **`contextIsolation`**.

En el siguiente ejemplo, se intenta adjuntar una variable `myAPI` al `window` global desde el script de precarga, pero no se puede acceder a ella desde el script de renderizado:

```js title="preload.js"
window.myAPI = {
  desktop: true
}
```

```js title="renderer.js"
console.log(window.myAPI)
// => undefined
```

El aislamiento de contexto significa que los scripts de precarga están aislados del ámbito principal del renderizador para evitar la filtración de API privilegiadas en el código del contenido web.

En su lugar, se utiliza el módulo `contextBridge` para lograr esto de forma segura:

```js title="preload.js"
const { contextBridge } = require('electron')

contextBridge.exposeInMainWorld('myAPI', {
  desktop: true
})
```

```js title="renderer.js"
console.log(window.myAPI)
// => { desktop: true }
```

Esta característica es increíblemente útil para dos propósitos principales:

- Al **exponer las funciones** de **`ipcRenderer`** al renderizador, puede utilizar la comunicación entre procesos (IPC) para activar las tareas principales del proceso desde el renderizador (y viceversa).
- Si se está desarrollando una aplicación de _Electron_ para una aplicación web existente alojada en una URL remota, se pueden **agregar propiedades personalizadas al `window`** global del renderizador que se pueden usar para la lógica del escritorio en el lado del cliente.

## Comunicación entre procesos

La comunicación entre procesos (IPC _Inter Process Communication_) es una parte clave de la creación de aplicaciones de escritorio. Debido a que los procesos principal y de renderizado tienen diferentes responsabilidades, IPC es la única forma de realizar muchas tareas, como llamar a una API nativa desde su interfaz de usuario o activar cambios en su contenido web desde menús nativos.

### Canales IPC

Los procesos se comunican pasando mensajes a través de "canales" definidos por el desarrollador con los módulos **`ipcMain`** y **`ipcRenderer`**. Estos canales son **arbitrarios** (podemos nombrarlos como queramos) y **bidireccionales** (podemos usar el mismo nombre de canal para ambos módulos).

Repasaremos algunos patrones IPC fundamentales con ejemplos concretos que podemos usar como referencia para el código de una aplicación.

### Patrón 1: Renderizador a principal (unidireccional)

Para enviar un mensaje IPC unidireccional desde un proceso de renderizador al proceso principal, se puede usar **`ipcRenderer.send`** para enviar un mensaje que captura en **`ipcMain.on`**.

Normalmente se utiliza este patrón para activar una acción en el proceso principal, como guardar un archivo o mostrar un cuadro de diálogo, desde una acción del usuario en el renderizador.

Para demostrar este patrón, se crea una aplicación que utiliza IPC para actualizar el título de la ventana de la aplicación desde el proceso de renderizado.

#### 1. Escuchar eventos con `ipcMain.on`

En el proceso principal, se crea un _listener_ para el evento '`set-title`' con `ipcMain.on`:

```js title="main.js" hl_lines="1 14-18 21" linenums="1"
const { app, BrowserWindow, ipcMain } = require('electron')
const path = require('node:path')

function createWindow () {
  const mainWindow = new BrowserWindow({
    webPreferences: {
      preload: path.join(__dirname, 'preload.js')
    }
  })

  mainWindow.loadFile('index.html')
}

function handleSetTitle (event, title) {
  const webContents = event.sender
  const win = BrowserWindow.fromWebContents(webContents)
  win.setTitle(title)
}

app.whenReady().then(() => {
  ipcMain.on('set-title', handleSetTitle)
  createWindow()

  app.on('activate', function () {
    if (BrowserWindow.getAllWindows().length === 0) createWindow()
  })
})

app.on('window-all-closed', function () {
  if (process.platform !== 'darwin') app.quit()
})
```

```js title="preload.js"
const { contextBridge, ipcRenderer } = require('electron')

contextBridge.exposeInMainWorld('electronAPI', {
  setTitle: (title) => ipcRenderer.send('set-title', title)
})
```

```html title="index.html" linenums="1" hl_lines="10-12"
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <meta http-equiv="Content-Security-Policy" content="default-src 'self'; script-src 'self'">
    <title>Set windows title IPC!</title>
  </head>l
  <body>
    <label for="title">Title:</label>
    <input type="text" id="title" />
    <button id="btn" type="button" onclick="setTitle()">Set</button>
    <script src="./renderer.js"></script>
  </body>
</html>
```


La función `handleSetTitle` tiene dos parámetros: un evento con estructura [`IpcMainEvent`](https://www.electronjs.org/docs/latest/api/structures/ipc-main-event) y una cadena de texto `title`. Cada vez que llega un evento `set-title`, esta función encontrará la instancia de `BrowserWindow` adjunta al remitente del mensaje y utilizará `win.setTitle` en ella.

#### 2. Exponer `ipcRenderer.send` en el script `preload.js`

Para enviar mensajes al _listener_ creado anteriormente, puede se usa `ipcRenderer.send`. Debemos elegir qué API exponer desde el script de precarga utilizando `contextBridge`.

El script de precarga, expondrá el método `setTitle` en proceso de renderizado.

```javascript title="preload.js" linenums="1" hl_lines="4"
const { contextBridge, ipcRenderer } = require('electron')

contextBridge.exposeInMainWorld('electronAPI', {
  setTitle: (title) => ipcRenderer.send('set-title', title)
})
```

En este punto, el proceso de renderizado puede llamar a `window.electronAPI.setTitle` para enviar un mensaje IPC al proceso principal.

#### 3. Crear el proceso de renderizado en la interfaz de usuario

En el archivo HTML cargado en `BrowserWindows`, se añade una interface básica consistente en una entrada de texto y un botón.

```html title="index.html" linenums="1" hl_lines="10-12"
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <!-- https://developer.mozilla.org/en-US/docs/Web/HTTP/CSP -->
    <meta http-equiv="Content-Security-Policy" content="default-src 'self'; script-src 'self'">
    <title>Hello IPC!</title>
  </head>
  <body>
    Title: <input id="title"/>
    <button id="btn" type="button">Set</button>
    <script src="./renderer.js"></script>
  </body>
</html>
```

Para hacer los elementos interactivos, añadimos algunas líneas de código a `renderer.js`, que aprovecha la API expuesta por el script de precarga.

```javascript title="renderer.js" linenums="1" hl_lines="5"
const setButton = document.getElementById('btn')
const titleInput = document.getElementById('title')
setButton.addEventListener('click', () => {
  const title = titleInput.value
  window.electronAPI.setTitle(title)
})
```

En este punto, se puede ejecutar la aplicación y probar el botón. Al hacer clic en el botón, se enviará un mensaje IPC al proceso principal, que establecerá el título de la ventana en el valor del campo de entrada.

### Patrón 2: Renderizador a principal (bidireccional)

Para enviar un mensaje IPC bidireccional entre dos procesos, se puede usar `ipcMain.handle` para crear un _listener_ que devuelva un valor. Luego, se puede usar `ipcRenderer.invoke` para llamar a la función y obtener el valor devuelto.

Este patrón se puede utilizar para obtener información del proceso principal, como el nombre de usuario del sistema operativo, desde el proceso principal.

Para demostrar este patrón, crearemos una aplicación que utiliza IPC para abrir un cuadro de diálogo de sistema y devolver el archivo seleccionado al proceso de renderizado.

#### 1. Crear un _listener_ con `ipcMain.handle`

En el proceso principal, se crea la función `handleFileOpen()` que llama a `dialog.showOpenDialog` que muestrá un diálogo y devuelve el primer archivo seleccionado. Esta función se utiliza como _listener_ cuando un mensaje `ipcRenderer.invoke` se envía con el evento `dialog:openFile` que escucha `ipcMain.handle`:

```javascript title="main.js" hl_lines="1 4-9 21" linenums="1"
const { app, BrowserWindow, ipcMain, dialog } = require('electron')
const path = require('node:path')

async function handleFileOpen () {
  const { canceled, filePaths } = await dialog.showOpenDialog()
  if (!canceled) {
    return filePaths[0]
  }
}

function createWindow () {
  const mainWindow = new BrowserWindow({
    webPreferences: {
      preload: path.join(__dirname, 'preload.js')
    }
  })
  mainWindow.loadFile('index.html')
}

app.whenReady().then(() => {
  ipcMain.handle('dialog:openFile', handleFileOpen)
  createWindow()
  app.on('activate', function () {
    if (BrowserWindow.getAllWindows().length === 0) createWindow()
  })
})

app.on('window-all-closed', function () {
  if (process.platform !== 'darwin') app.quit()
})
```

!!! info "`dialog:`"
    El prefijo `dialog:` no tiene efecto en el código. Se utiliza para mejorar la legibilidad.

#### 2. Exponer `ipcRenderer.invoke` en el script `preload.js`

Para llamar a la función creada anteriormente, se puede usar `ipcRenderer.invoke`. Debemos elegir qué API exponer desde el script de precarga utilizando `contextBridge`.

El script de precarga, expondrá el método `openFile` en proceso de renderizado.

```javascript title="preload.js" linenums="1" hl_lines="4"
const { contextBridge, ipcRenderer } = require('electron')

contextBridge.exposeInMainWorld('electronAPI', {
  openFile: () => ipcRenderer.invoke('dialog:openFile')
})
```

#### 3. Crear el proceso de renderizado en la interfaz de usuario

Finalmente, screamos el HTML a cargar en `BrowserWindows`, que contiene un botón que, al hacer clic, llamará a `window.electronAPI.openFile` y mostrará el resultado en un elemento `<span>`.

```html title="index.html" linenums="1" hl_lines="10-12"
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <!-- https://developer.mozilla.org/en-US/docs/Web/HTTP/CSP -->
    <meta http-equiv="Content-Security-Policy" content="default-src 'self'; script-src 'self'">
    <title>Dialog</title>
  </head>
  <body>
    <button type="button" id="btn">Open a File</button>
    File path: <span id="filePath"></span>
    <script src='./renderer.js'></script>
  </body>
</html>
```

La interfaz consiste en un botón que utilizaremos para enviar un mensaje IPC al proceso principal y un elemento `<span>` que utilizaremos para mostrar el resultado. Para hacer los elementos interactivos, añadimos algunas líneas de código a `renderer.js`, que aprovecha la API expuesta por el script de precarga.

```javascript title="renderer.js" linenums="1" hl_lines="5"
const btn = document.getElementById('btn')
const filePathElement = document.getElementById('filePath')

btn.addEventListener('click', async () => {
  const filePath = await window.electronAPI.openFile()
  filePathElement.innerText = filePath
})
```

En el código de arriba, se utiliza `await` para esperar el resultado de `window.electronAPI.openFile()` y luego se establece el resultado en el elemento `<span>`.

### Patrón 3: Principal a renderizador

Para enviar un mensaje desde el proceso principal a un proceso de renderizado, necesitamos especificar qué ventana de renderizado recibirá el mensaje. Los mensajes se envían a través de [`WebContents`](https://www.electronjs.org/docs/latest/api/web-contents) que se pueden obtener de `BrowserWindow`. Esta instancia de `WebContents` contiene un método [`send`](https://www.electronjs.org/docs/latest/api/web-contents#contentssendchannel-args) que puede usarse del mismo modo que `ipcRenderer.send` en el proceso de renderizado.

Para demostrar este patrón, crearemos un contador de números controlado por el menú nativo del sistema operativo.

#### 1. Enviar mensajes con el módulo `webContents`

Para esta demo, necesitamos crear un menú personalizado en usando el módulo `Menu` que usa `webContents.send` para enviar un mensaje IPC desde el proceso principal al proceso renderizador objetivo.

```javascript title="main.js" hl_lines="1 11-25 27 35-37" linenums="1"
const { app, BrowserWindow, Menu, ipcMain } = require('electron')
const path = require('node:path')

function createWindow () {
  const mainWindow = new BrowserWindow({
    webPreferences: {
      preload: path.join(__dirname, 'preload.js')
    }
  })

  const menu = Menu.buildFromTemplate([
    {
      label: app.name,
      submenu: [
        {
          click: () => mainWindow.webContents.send('update-counter', 1),
          label: 'Increment'
        },
        {
          click: () => mainWindow.webContents.send('update-counter', -1),
          label: 'Decrement'
        }
      ]
    }
  ])

  Menu.setApplicationMenu(menu)
  mainWindow.loadFile('index.html')

  // Open the DevTools.
  mainWindow.webContents.openDevTools()
}

app.whenReady().then(() => {
  ipcMain.on('counter-value', (_event, value) => {
    console.log(value) // will print value to Node console
  })
  createWindow()

  app.on('activate', function () {
    if (BrowserWindow.getAllWindows().length === 0) createWindow()
  })
})

app.on('window-all-closed', function () {
  if (process.platform !== 'darwin') app.quit()
})
```

#### 2. Exponer `ipcRenderer.on` en el script `preload.js`

Como en los ejemplos anteriores, usamos los módulos `contextBridge` y `ipcRenderer` para exponer la funcionalidad IPC en el proceso de renderizado.

```javascript title="preload.js" linenums="1" hl_lines="4"
const { contextBridge, ipcRenderer } = require('electron')

contextBridge.exposeInMainWorld('electronAPI', {
  onUpdateCounter: (callback) => ipcRenderer.on('update-counter', callback)
})
```

#### 3. Crear el proceso de renderizado en la interfaz de usuario

Para terminar de unirlo todo, creamos la interfaz HTML que contiene un elemento `<span>` que se actualizará con el valor del contador.

```html title="index.html" linenums="1" hl_lines="10-11"
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <!-- https://developer.mozilla.org/en-US/docs/Web/HTTP/CSP -->
    <meta http-equiv="Content-Security-Policy" content="default-src 'self'; script-src 'self'">
    <title>Menu Counter</title>
  </head>
  <body>
    Current value: <span id="counter">0</span>
    <script src="./renderer.js"></script>
  </body>
</html>
```

Finalmente, para hacer que los valores se actualicen en el documento HTML, añadimos algunas líneas de código a `renderer.js`, que aprovecha la API expuesta por el script de precarga.

```javascript title="renderer.js" linenums="1" hl_lines="4-6"
const counter = document.getElementById('counter')

window.electronAPI.onUpdateCounter((_event, value) => {
  const oldValue = Number(counter.innerText)
  const newValue = oldValue + value
  counter.innerText = newValue.toString()
})
```

En el código anterior, se utiliza `window.electronAPI.onUpdateCounter` para registrar un _listener_ para el evento `update-counter` que actualiza el valor del elemento `<span>`.

### Patrón 4: Renderizador a renderizador

No existe una forma directa para enviar mensajes estre procesos de renderizado. Para conseguirlo tenemos dos opciones:

- Usar el proceso principal como intermediario. Esto implica enviar un mensaje desde cada renderer al proceso principal, que reenviará el mensaje al renderer objetivo.
- Pasar un [`MessagePort`](https://www.electronjs.org/docs/latest/tutorial/message-ports) desde el proceso principal a los dos renderers. Esto permite una comunicación directa entre los procesos renderizadores después de una configuración inicial.

### Serialización de objetos

La implementación IPC utiliza el estándar HTML [`Structured Clone Algorithm`](https://developer.mozilla.org/en-US/docs/Web/API/Web_Workers_API/Structured_clone_algorithm) para serializar los objetos pasados entre procesos. Esto significa que los objetos que se envían a través de IPC deben ser compatibles con este algoritmo.

En particular, los objetos DOM (ej. `Element`, `Location` y `DOMMatrix`), objetos Node.js con clases C++ (ej. `process.env`, miembros de `Stream`), y objetos Electron con clases C++ (ej. `WebContents`, `BrowserWindow` y `WebFrame`) no son serializables con el algoritmo de clonación estructurada.

