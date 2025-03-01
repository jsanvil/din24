# 🔧 Entorno de trabajo

Guía rápida para instalar las herramientas necesarias para trabajar con _**ElectronJS**_.

## Visual Studio Code

Para la instalación de _VSCode_, descargar el paquete de instalación que corresponda al sistema operativo de la página de [Visual Studio Code](https://code.visualstudio.com/Download) y realizar la instalación típica.

### Versión portable

En la [página oficial de descargas](https://code.visualstudio.com/#alt-downloads) disponemos de empaquetados `.zip` para _MS Windows_ y `.tar.gz` para _Linux_.

Sólo hay que descargar el archivo, descomprimir y ejecutar el archivo `code`.

## Node.js npm y nvm

**npm** es el gestor de paquetes de **Node.js**. Para instalarlo se debe seguir la guía en la página de [nodejs.org](https://nodejs.org/es/download/package-manager/).

### Instalación en el perfil local de usuario para sistemas Linux

Alternativamente, **npm** se puede instalar en el perfil local del usuario, para ello utilizaremos ***nvm*** que es un gestor de versiones de *node* que nos permitirá utilizar la versión que escojamos [nvm-sh](https://github.com/nvm-sh/nvm#installation-and-update)

Para instalar ***nvm*** necesitamos ejecutar el siguiente comando, aunque es recomendable consultar la documentación de *nvm* para comprobar que no haya cambiado:

```bash title="Terminal"
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash
```

Cuando termine la instalación de *nvm*, tendremos que **abrir un nuevo terminal** para que reconozca la ruta del ejecutable y proceder a instalar la **última versión LTS de *Node.js*** de la siguiente forma:

```bash title="Terminal"
nvm install --lts
```

### Git, GitHub y GitHub Classroom

- _**Git**_ es un sistema de control de versiones usado comúnmente para código fuente.+
- _**GitHub**_ es una plataforma de desarrollo colaborativo que utiliza _Git_ y que nos permitirá subir nuestro código a la nube.
- _**GitHub Classroom**_ es una herramienta que nos permitirá recibir las tareas y ejercicios de la asignatura.

Por lo tanto será necesario:

- [Crear una cuenta de GitHub](https://github.com/) utilizando la **cuenta de correo corporativa** de la GVA (**_usuario_@alu.edu.gva**).
    * Utiliza el mismo **nombre de usuario** para la cuenta _GitHub_.

    !!! note ""
        _**Ejemplo**: Para la cuenta corporativa es `jacsanvil@alu.edu.gva` el usuario de GitHub debe ser `jacsanvil`_

- [Instalar Git](https://github.com/git-guides/install-git)

    !!! note ""
        Si no estás familiarizado en cómo funciona _git_, se recomienda leer la [Guía de Git](https://github.com/git-guides/). 
    
- Se puede utilizar `git` mediante la terminal o la interfaz gráfica de [GitHub Desktop](https://desktop.github.com/).

- Para tareas sencillas, se recomienda el gestor integrado de _Visual Studio Code_.    

## Electron reloader

Para que los cambios en el código se reflejen en la aplicación, se puede utilizar el paquete [electron-reloader](https://www.npmjs.com/package/electron-reloader) que se instala como dependencia de desarrollo.

```bash title="Terminal"
npm install --save-dev electron-reloader
```

Después, en el archivo `main.js` se añade el siguiente código:

```js title="main.js" linenums="1"
const { app, BrowserWindow } = require('electron')

try {
    require('electron-reloader')(module, {
        debug: true,
        watchRenderer: true
    })
} catch(_) {}

// ...
```

Ahora, cuando lancemos la aplicación con `npm start` se recargará automáticamente cuando se guarden los cambios en el código.
