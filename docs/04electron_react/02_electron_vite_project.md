# 4.2 Integración de _React_ en _Electron_

## Introducción

Hemos visto una breve introducción a _React_ y el empaquetador _Vite_, pero de poco nos sirve si no lo integramos en una aplicación _Electron_ para poder construir aplicaciones de escritorio. Para ello, utilizaremos [electron-vite](https://electron-vite.org/), que nos proporciona una plantilla de proyecto con todo lo necesario para empezar a trabajar.

## Integración de React en Electron

Según la documentación oficial ([Scaffolding your first electron-vite project](https://electron-vite.org/guide/#scaffolding-your-first-electron-vite-project)) podemos crear la estructura de un nuevo projecto mediante el siguiente comando:

```bash
$ npm create @quick-start/electron
```

Donde:

- `npm create @quick-start/electron`: crea un proyecto _Electron_ con _electron-vite_
- Parámetros opcionales:
    - `NOMBRE_PROYECTO`: nombre que queramos darle al proyecto, creará un directorio con ese nombre.
    - `-- --template react` indicando que utilice plantilla de proyecto con _React_

Aparecerá un asistente que nos guiará en la creación del proyecto.

```bash title="Nombre del proyecto" hl_lines="4"
> npx
> create-electron

? Project name: › mi-proyecto
```
Seleccionar el _framework_ que queremos utilizar, en este caso _React_:

```bash title="Seleccionar Framework" hl_lines="4"
? Select a framework: › - Use arrow-keys. Return to submit.
    vanilla
    vue
❯   react
    svelte
    solid
```

Por último, hará una serie de preguntas, a las que responderemos `No`, para no añadir _TypeScript_, ni el _plugin_ de actualización de _Electron_, ni el _proxy_ de descarga de _Electron_.

```bash title="TypeScript, Electron updater y Electron mirror" hl_lines="1-3 9-11"
? Add TypeScript? › No
? Add Electron updater plugin? › No
? Enable Electron download mirror proxy? > No

Scaffolding project in ./mi-proyecto...

Done. Now run:

  cd mi-proyecto
  npm install
  npm run dev
```



!!! note "Nota"
    No vamos a utilizar _TypeScript_, ni el _plugin_ de actualización de _Electron_, ni el _proxy_ de descarga de _Electron_.

    - _Typescript_ es un lenguaje de programación que es una extensión de _JavaScript_ que añade tipos de datos. Es muy utilizado en proyectos de _JavaScript_ de gran tamaño, pero no es necesario para proyectos pequeños.

    - El _plugin_ de actualización de _Electron_ permite actualizar la aplicación automáticamente cuando hay una nueva versión disponible.

    - El _proxy_ de descarga de _Electron_ permite descargar _Electron_ desde un servidor local, en lugar de desde los servidores oficiales.

Una vez terminado, nos situamos en el directorio del proyecto, instalamos las dependencias, abrimos el proyecto en _vscode_ e iniciamos la aplicación:

```bash
$ cd mi-proyecto
$ npm install
$ code .
$ npm run dev
```

## Estructura de archivos

La estructura de archivos que nos proporciona _electron-vite_ es la siguiente:

```text hl_lines="5 7 9-10"
.
├── 📂 build/
├── 📂 resources/
├── 📂 src/        <---------------- Código fuente
│   ├── 📂 main/       <------------ Proceso principal de Electron
│   │   └── index.js
│   ├── 📂 preload/    <------------ Script de precarga
│   │   └── index.js
│   └── 📂 renderer/   <------------ Proceso de renderizado
│       ├── 📂 src/        <-------- Proyecto React
│       │   ├── 📂 assets/     <---- Recursos (css, imágenes, ...)
│       │   ├── 📂 components/ <---- Componentes React
│       │   │   └── Versions.jsx
│       │   ├── App.jsx    <-------- Componente principal
│       │   └── main.jsx   <-------- Punto de entrada de la aplicación React
│       └── index.html
|
├── electron-builder.yml   <-------- Configuración de electron-builder
├── electron.vite.config.mjs  <------ Configuración de vite
├── package.json    <--------------- Dependencias y scripts
└── README.md
```

La aplicación electron se sitúa en `src/`, y está dividida en tres partes:

- `src/main/`: código del proceso principal de Electron
- `src/preload/`: código que precarga
- `src/renderer/src/`: código de la aplicación _React_

Como vemos, se ha movido el código de la aplicación _React_ a `src/renderer/src/`.

## Scripts de la npm

- **`npm run dev`**: inicia la aplicación en modo desarrollo
- `npm start`: inicia la aplicación en modo producción
- `npm run build`: crea ejecutables e instaladores para la aplicación, es un proceso que puede tardar varios minutos.
    - **`npm run build:win`**: crea ejecutables e instaladores para Windows
    - **`npm run build:linux`**: crea ejecutables e instaladores para Linux
    - `npm run build:mac`: crea ejecutables e instaladores para macOS. **Sólo se puede ejecutar en un sistema macOS.**

## Código de la aplicación

El **proceso principal** de _Electron_ se encuentra en `src/main/index.js`.

El **proceso de renderizado** de _Electron_ se encuentra en `src/renderer/main.html` que es la página que cargará la ventana principal de la aplicación. `src/renderer/main.html` carga el módulo `src/renderer/src/main.jsx`, y este, carga el componente `src/renderer/src/App.jsx` que contiene la aplicación _React_.

El **script de precarga** se encuentra en `src/preload/index.js`. Como vimos, este script se ejecuta en el proceso de renderizado antes de cargar el código de la aplicación _React_, y tiene la siguiente estructura:

```js title="src/preload/index.js" linenums="1" hl_lines="5 12-13"
import { contextBridge, ipcRenderer } from 'electron'
import { electronAPI } from '@electron-toolkit/preload'

// Custom APIs for renderer
const api = {}

// Use `contextBridge` APIs to expose Electron APIs to
// renderer only if context isolation is enabled, otherwise
// just add to the DOM global.
if (process.contextIsolated) {
  try {
    contextBridge.exposeInMainWorld('electron', electronAPI)
    contextBridge.exposeInMainWorld('api', api)
  } catch (error) {
    console.error(error)
  }
} else {
  window.electron = electronAPI
  window.api = api
}
```

expone dos objetos en el contexto global del proceso de renderizado:

- `electron`: utiliza el módulo `@electron-toolkit/preload` que expone las API de _Electron_ en el proceso de renderizado.

    _Por ejemplo_, para enviar un mensaje al proceso principal: `window.electron.ipcRenderer.send('setWindowTitle', 'Mi aplicación')` desde el proceso de renderizado, sin tener que declarar el módulo `ipcRenderer` en el script de precarga.

- `api`: podemos definir aquí nuestras propias funciones que queramos exponer en el proceso de renderizado, de la forma que vimos en apartado [3.5 Comunicación entre procesos](../03electron/05_ipc.md).

## Hot Reloading

Incluye _hot reloading_ tanto en el proceso principal como en el de renderizado. Al realizar cambios en el código, la aplicación se recarga automáticamente. Por lo que, en principio, no es necesario reiniciar la aplicación para ver los cambios.

## Referencias

- [electron-vite](https://electron-vite.org/)
- [Scaffolding your first electron-vite project](https://electron-vite.org/guide/#scaffolding-your-first-electron-vite-project)
- [Features | electron-vite](https://electron-vite.org/guide/features)
- [React](https://react.dev/)
- [Vite](https://vite.dev/)
- [electron-builder](https://www.electron.build)
- [electron-builder Configuration](https://www.electron.build/configuration)
