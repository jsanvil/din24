# 0.2 Creando la primera aplicación en Electron

- [Objetivos](#objetivos)
- [Configurando tu Proyecto](#configurando-tu-proyecto)
- [Iniciando el proyecto con `npm`](#iniciando-el-proyecto-con-npm)
- [Agregando `.gitignore`](#agregando-gitignore)
- [Ejecutar una aplicación Electron](#ejecutar-una-aplicacion-electron)
- [Cargar una html en un *`BrowserWindow`*](#cargar-una-html-en-un-browserwindow)
    - [Importando módulos](#importando-modulos)
    - [Escribir una función reutilizable para instanciar ventanas](#escribir-una-función-reutilizable-para-instanciar-ventanas)
    - [Llamar a su función cuando la aplicación esté lista](#llamar-a-su-funcion-cuando-la-aplicacion-este-lista)
- [Administrar el ciclo de vida de la ventana de la aplicación](#administrar-el-ciclo-de-vida-de-la-ventana-de-la-aplicacion)
    - [Salir de la aplicación cuando todas las ventanas estén cerradas (_Windows y Linux_)](#salir-de-la-aplicacion-cuando-todas-las-ventanas-esten-cerradas-windows-y-linux)
- [Abra una ventana si no hay ninguna abierta (_macOS_)](#abra-una-ventana-si-no-hay-ninguna-abierta-macos)
- [Código final](#codigo-final)
- [Depurando en VS Code](#depurando-en-vs-code)
- [Resumen](#resumen)


## Objetivos

En esta parte se enseñará a configurar un proyecto *Electron* y escribir una aplicación inicial sencilla. Al final de esta sección, se podrá ejecutar una aplicación *Electron* en modo de desarrollo desde el terminal.

## Configurando tu Proyecto

!!! warning "EVITA WSL"
    Si se utiliza un sistema *Windows*, no se debe utilizar el [Subsistema de Windows para Linux](https://learn.microsoft.com/en-us/windows/wsl/about#what-is-wsl-2) (*WSL*), ya que surgirán problemas al intentar ejecutar la aplicación.

## Iniciando el proyecto con `npm`

Las aplicaciones *Electron* se organizan usando ***npm***, con el archivo ***`package.json`*** como punto de entrada. Comienza creando una carpeta e inicializando un paquete ***npm*** dentro de ella con el comando `npm init`.

```bash title="Terminal"
mkdir my-electron-app
cd my-electron-app
npm init
```

Este comando pedirá que configures algunos atributos del **`package.json`**. Hay algunas reglas que seguir en esta guía:

* El punto de entrada de la aplicación debe ser el archivo **`main.js`**.
* *"author"*, *"license"* y *"description"* pueden tener cualquier valor, pero serán necesarios para el empaquetado más adelante.
* Se puede aceptar la configuración por defecto, normalmente indicada entre paréntesis, pulsando la tecla `intro`.

```txt title="Ejemplo del proceso de configuración de `package.json` con `npm init`" hl_lines="14"
This utility will walk you through creating a package.json file.
It only covers the most common items, and tries to guess sensible defaults.

See `npm help init` for definitive documentation on these fields
and exactly what they do.

Use `npm install <pkg>` afterwards to install a package and
save it as a dependency in the package.json file.

Press ^C at any time to quit.
package name: (my-electron-app) 
version: (1.0.0) 
description: 
entry point: (index.js) main.js
test command: 
git repository: 
keywords: 
author: 
license: (ISC) 
About to write to /home/user/my-electron-app/package.json:

{
  "name": "my-electron-app",
  "version": "1.0.0",
  "description": "",
  "main": "main.js",
  "scripts": {
    "test": "echo \"Error: no test specified\" && exit 1"
  },
  "author": "",
  "license": "ISC"
}


Is this OK? (yes) 
```

Ahora, instala *Electron* en las ***`devDependencies`*** de la aplicación, que es la lista de dependencias de paquetes externos de desarrollo exclusivo que no se requieren en producción.

```bash title="Terminal"
npm install electron --save-dev
```


!!! nota "¿Por qué Electron es una dependencia?"
    Esto puede parecer poco intuitivo ya que el código de producción ejecuta API de Electron. Sin embargo, las aplicaciones finales incluirán el binario de *Electron*, eliminando la necesidad de especificarlo como una dependencia de la aplicación binaria final a distribuir en producción.


El archivo `package.json` debería verse así después de inicializar su paquete e instalar *Electron*. 

```json title="package.json"
{
  "name": "my-electron-app",
  "version": "1.0.0",
  "main": "main.js",
  "scripts": {
    "test": "echo \"Error: no test specified\" && exit 1"
  },
  "author": "",
  "license": "ISC",
  "description": "",
  "devDependencies": {
    "electron": "^32.0.2"
  }
}
```

También debe aparecer la carpeta **`node_modules/`** que contiene el ejecutable de *Electron*, así como un archivo de bloqueo **`package-lock.json`** que especifica las versiones de dependencia exactas que se instalarán.

!!! note "Instrucciones de instalación avanzadas"
    Si la instalación de *Electron* falla, se puede consultar la documentación de [Instalación avanzada](https://www.electronjs.org/es/docs/latest/tutorial/installation) para obtener instrucciones sobre cómo descargar *mirrors*, servidores *proxy* y solución de problemas.


## Agregando `.gitignore`

El archivo **`.gitignore`** especifica qué archivos y directorios evitar en el seguimiento con Gi*t. Se debe colocar una copia de la plantilla [GitHub's Node.js gitignore template](https://github.com/github/gitignore/blob/main/Node.gitignore) en la carpeta raíz de tu proyecto para evitar el seguimiento la carpeta _`node_modules/`_ del proyecto.

## Ejecutar una aplicación Electron

El script **`main`** que definiste en **`package.json`** es el punto de inicio de cualquier aplicación. Este script controla el proceso principal, que se ejecuta en un entorno *Node.js* y es responsable de controlar el ciclo de vida de su aplicación, mostrar interfaces nativas, realizar operaciones con privilegios y administrar los procesos de renderizado.

Antes de crear la primera aplicación, primero utilizará un script para asegurar de que el punto de entrada del proceso principal está configurado correctamente. Crea un archivo **`main.js`** en la carpeta raíz del proyecto con una sola línea de código:

```js title="main.js" linenums="1"
console.log('Hola desde Electron 👋')
```

Debido a que el proceso principal es un intérprete de *Node.js*, se puede ejecutar código con el comando `electron`. Para ejecutar este script, agrega **`"electron ."`** al comando de inicio (`"start"`) en el atributo `"scripts"` del archivo `paquete.json`. Este comando le indicará al ejecutable que busque el script principal en el directorio actual y lo ejecute en modo de desarrollo.


```json linenums="1" hl_lines="6" title="package.json"
{
  "name": "my-electron-app",
  "version": "1.0.0",
  "main": "main.js",
  "scripts": {
    "start": "electron .",
    "test": "echo \"Error: no test specified\" && exit 1"
  },
  "author": "",
  "license": "ISC",
  "description": "",
  "devDependencies": {
    "electron": "^32.0.2"
  }
}
```

```bash title="Terminal"
npm run start
```

El terminal debería mostrar "Hola desde Electron 👋." ¡Enhorabuena, has ejecutado tu primera línea de código en Electron! A continuación, veremos como crear interfaces de usuario en HTML y cargarlas en una ventana nativa.

## Cargar una html en un *`BrowserWindow`*

Cada ventana muestra una página web que se puede cargar desde un archivo **HTML** local o desde una dirección web remota. Para este ejemplo, se cargará desde un archivo local. Comienza creando una página web básica en un archivo **`index.html`** en la carpeta raíz del proyecto:

```html linenums="1" title="index.html"
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <meta
      http-equiv="Content-Security-Policy"
      content="default-src 'self'; script-src 'self'"
    />
    <meta
      http-equiv="X-Content-Security-Policy"
      content="default-src 'self'; script-src 'self'"
    />
    <title>Hello from Electron renderer!</title>
  </head>
  <body>
    <h1>Hello from Electron renderer!</h1>
    <p>👋</p>
  </body>
</html>
```

Ahora que tenemos una página web, se puede cargar en una ventana del navegador Electron. Reemplaza el contenido del archivo `main.js` con el siguiente código. Se explicará cada bloque resaltado por separado.

```js linenums="1" hl_lines="1 3-10 12-14" title="main.js"
const { app, BrowserWindow } = require('electron')

const createWindow = () => {
  const win = new BrowserWindow({
    width: 800,
    height: 600
  })

  win.loadFile('index.html')
}

app.whenReady().then(() => {
  createWindow()
})
```

### Importando módulos

```js linenums="1" hl_lines="1" title="main.js (línea 1)"
const { app, BrowserWindow } = require('electron')

...
```

En la primera línea, estamos importando dos módulos Electron con la sintaxis del módulo *CommonJS*:

* **`app`**, controla el ciclo de vida del evento de su aplicación.
* **`BrowserWindow`**, que crea y administra ventanas de aplicaciones.

!!! note "Convenciones de capitalización de nombres"
    Es posible que hayas notado la diferencia de mayúsculas entre **a**pp y los módulos de **B**rowser**W**indow. Electron sigue las convenciones típicas de *JavaScript*, donde los módulos se indican en ***PascalCase*** y son constructores de clases instanciables (por ejemplo, `BrowserWindow`, `Tray`, `Notification`) mientras que los módulos ***camelCase*** no son instanciables (por ejemplo, `app`, `ipcRenderer`, `webContents`).

### Escribir una función reutilizable para instanciar ventanas

La función `createWindow()` carga la página web en una nueva instancia de `BrowserWindow`:

```js linenums="2" hl_lines="2-9" title="main.js (líneas 3-10)"
...
const createWindow = () => {
  const win = new BrowserWindow({
    width: 800,
    height: 600
  })

  win.loadFile('index.html')
}
...
```

### Llamar a su función cuando la aplicación esté lista

```js linenums="11" hl_lines="2-4" title="main.js (líneas 12-14)"
...
app.whenReady().then(() => {
  createWindow()
})
```

Muchos de los módulos principales de son emisores de eventos de *Node.js* que se adhieren a la arquitectura asincrónica basada en eventos de Node. El módulo de aplicación es uno de estos emisores.

`BrowserWindows` solo se puede crear después de que se del evento `ready` del módulo de la aplicación. Puede esperar este evento utilizando la API `app.whenReady()` y llamando a `createWindow()` una vez que se cumpla su promesa.

!!! info "evento `ready`"
    Normalmente los eventos de *Node.js* se escuchan utilizando la función `.on` de un emisor.

    ```js
    app.on('ready', () => {
    // app.whenReady().then(() => {
    createWindow()
    })
    ```

    Sin embargo, *Electron* expone **`app.whenReady()`** para evitar problemas al escuchar directamente el evento `ready`.

En este momento, al ejecutar el comando de `start` de la aplicación debería abrir con una ventana que muestre la página web.

Cada página web que la aplicación muestra en una ventana se ejecutará en un proceso separado llamado _**renderer** process_ (proceso de renderizado) (o simplemente ***renderer*** para abreviar). Los procesos de renderizado tienen acceso a las mismas API de JavaScript y herramientas que se utilizan para el desarrollo web *front-end* típico, como el uso de ***webpack*** para agrupar y minimizar su código o ***React*** para crear interfaces de usuario.

## Administrar el ciclo de vida de la ventana de la aplicación

Las ventanas de las aplicaciones se comportan de manera diferente en cada sistema operativo. En lugar de hacer cumplir estas convenciones de forma predeterminada, *Electron* ofrece la opción de implementarlas en el código de su aplicación si desea seguirlas. Puede implementar convenciones básicas de ventana escuchando los eventos emitidos por la aplicación y los módulos de `BrowserWindow`.

!!! tip "Flujo de control específico"
    La verificación con la variable **`process.platform`** de *Node* puede ayudar a ejecutar código de manera condicional en ciertas plataformas. Se debe tener en cuenta que sólo hay tres plataformas posibles en las que *Electron* puede ejecutarse: `win32` (Windows), `linux` (Linux) y `darwin` (macOS).

### Salir de la aplicación cuando todas las ventanas estén cerradas (_Windows y Linux_)

En *Windows* y *Linux*, cerrar todas las ventanas generalmente cerrará una aplicación por completo. Para implementar este patrón en *Electron*, se debe escuchar el evento **`window-all-closed`** del módulo de la aplicación y llama a **`app.quit()`** para salir de la aplicación si el usuario no está en *macOS*.

```js
app.on('window-all-closed', () => {
  if (process.platform !== 'darwin') app.quit()
})
```

## Abra una ventana si no hay ninguna abierta (_macOS_)

Por el contrario, el comportamiento por defecto de las aplicaciones de *macOS* es que generalmente continúan ejecutándose incluso sin ninguna ventana abierta. Activar la aplicación cuando no hay ventanas disponibles debería abrir una nueva.

Para implementar esta característica, escuchar el evento **`activate`** del módulo de la aplicación y llamar a su método **`createWindow()`** existente si no hay ningún `BrowserWindows` abierto.

Debido a que las ventanas no se pueden crear antes del evento `ready`, solo debería escuchar el evento `activate` después de inicializar la aplicación. Haz esto escuchando solo los eventos de activación dentro del `callback` de `whenReady()`.

```js
app.whenReady().then(() => {
  createWindow()

  app.on('activate', () => {
    if (BrowserWindow.getAllWindows().length === 0) createWindow()
  })
})
```

## Código final

```js linenums="1" title="main.js"
const { app, BrowserWindow } = require('electron')

const createWindow = () => {
  const win = new BrowserWindow({
    width: 800,
    height: 600
  })

  win.loadFile('index.html')
}

app.whenReady().then(() => {
  createWindow()

  app.on('activate', () => {
    if (BrowserWindow.getAllWindows().length === 0) {
      createWindow()
    }
  })
})

app.on('window-all-closed', () => {
  if (process.platform !== 'darwin') {
    app.quit()
  }
})
```

```js linenums="1" title="index.html"
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <meta
      http-equiv="Content-Security-Policy"
      content="default-src 'self'; script-src 'self'" />
    <meta
      http-equiv="X-Content-Security-Policy"
      content="default-src 'self'; script-src 'self'" />
    <title>Hola desde Electron renderer!</title>
  </head>
  <body>
    <h1>Hola desde Electron renderer!</h1>
    <p>👋</p>
    <p id="info"></p>
  </body>
</html>
```

## Depurando en VS Code

Para depurar la aplicación usando *VS Code*, se debe adjuntar VS code para ambos procesos tanto el principal y los renderizadores. Aquí un ejemplo de configuración. Crea un nuevo archivo **`launch.json`** en el directorio **`.vscode\`** del proyecto:

```json title=".vscode/launch.json"
{
  "version": "0.2.0",
  "compounds": [
    {
      "name": "Main + renderer",
      "configurations": ["Main", "Renderer"],
      "stopAll": true
    }
  ],
  "configurations": [
    {
      "name": "Renderer",
      "port": 9222,
      "request": "attach",
      "type": "chrome",
      "webRoot": "${workspaceFolder}"
    },
    {
      "name": "Main",
      "type": "node",
      "request": "launch",
      "cwd": "${workspaceFolder}",
      "runtimeExecutable": "${workspaceFolder}/node_modules/.bin/electron",
      "windows": {
        "runtimeExecutable": "${workspaceFolder}/node_modules/.bin/electron.cmd"
      },
      "args": [".", "--remote-debugging-port=9222"],
      "outputCapture": "std",
      "console": "integratedTerminal"
    }
  ]
}
```

La opción "Main + renderer" aparecerá cuando selecciones "Run and debug" en la barra lateral, lo que le permitirá establecer puntos de interrupción e inspeccionar todas las variables, entre otras cosas, tanto en el proceso principal como en el renderizador.

Lo que hemos hecho en el archivo `launch.json` es crear 3 configuraciones:

* `Main` se utiliza para iniciar el proceso principal y también exponer el puerto 9222 para la depuración remota (`--remote-debugging-port=9222`). Este es el puerto que usaremos para adjuntar el depurador del `Renderer`. Debido a que el proceso principal es un proceso de *Node.js*, el tipo se establece en `node`.
* `Renderer` se utiliza para depurar el proceso de renderizado. Debido a que el proceso principal es el que crea el proceso, tenemos que adjuntarlo (`"request": "attach"`) en lugar de crear uno nuevo. El proceso de renderizado es web, por lo que el depurador que debemos usar es `chrome`.
* `Main + renderer` es una tarea compuesta que ejecuta las anteriores simultáneamente.
 
!!! warning "ADVERTENCIA"
    Debido a que estamos adjuntando un proceso en `Renderer`, es posible que las primeras líneas de su código se omitan ya que el depurador no habrá tenido tiempo suficiente para conectarse antes de que se ejecuten. Puede solucionar este problema actualizando la página o estableciendo un tiempo de espera antes de ejecutar el código en modo de desarrollo.

## Resumen

Las aplicaciones *Electron* se configuran mediante paquetes ***npm***. El ejecutable debe instalarse en las `devDependencies` de su proyecto y puede ejecutarse en modo de desarrollo usando un script en el archivo **`package.json`**.

El ejecutable toma el punto de entrada de *JavaScript* que se encuentra en la propiedad `main` de `paquete.json`. Este archivo controla el **proceso principal**, que ejecuta una instancia de *Node.js* y es responsable del ciclo de vida de su aplicación, mostrando interfaces nativas, realizando operaciones privilegiadas y administrando procesos de renderizado.

Los **procesos de renderizado** (o ***renderers***) son responsables de mostrar contenido gráfico. Puedes cargar una página web en un *renderer* apuntándola a una dirección web o a un archivo HTML local. Los *renderers* se comportan de manera muy similar a las páginas web normales y tienen acceso a las mismas API web.
