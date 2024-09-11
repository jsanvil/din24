# 0.1 Introducción a Electron

- [Conocimientos previos](#conocimientos-previos)
- [Herramientas necesarias](#herramientas-necesarias)
    - [Editor de código](#editor-de-código)
    - [Línea de comandos](#línea-de-comandos)
    - [Git y GitHub](#git-y-github)
    - [Node.js y npm](#nodejs-y-npm)

## Requisitos

_**Electron**_ es un _framework_ para crear aplicaciones de escritorio usando ***JavaScript***, ***HTML*** y ***CSS***. Incorpora [_Chromium_](https://www.chromium.org/chromium-projects/) y [_Node.js_](https://nodejs.org/es) en un único archivo binario. Permite crear aplicaciones **multiplataforma** que funcionan en *Windows*, *macOS* y *Linux* con una única base común de código *JavaScript*.

### Conocimientos previos

*Electron* es una capa de envoltorio nativa para aplicaciones web y se ejecuta en un entorno *Node.js*. Se asume que el alumnado ha adquirido los conocimientos básicos de desarrollo web vistos en el módulo de primer curso de DAM "_Lenguajes de marcas y sistemas de gestión de información_" (LMSGI). Como apoyo se recomendan los siguientes recursos:

* [Aprende desarrollo web (MDN Web Docs)](https://developer.mozilla.org/es/docs/Learn)
* [Introducción a Node.js](https://nodejs.dev/en/learn/)

### Herramientas necesarias

#### Editor de código

Es necesario un editor de texto para escribir el código, lo más recomendado es el uso de un IDE (Entorno de Desarrollo Integrado). Se recomienda el uso de [_Visual Studio Code_](https://code.visualstudio.com/), al ser uno de los más utilizados en el mundo del desarrollo, con ls integración de múltiples herramientas que permiten agilizar el trabajo, como el control de versiones *git*, el terminal integrado de línea de comandos o el depurador, entre muchas otras.

#### Línea de comandos

A lo largo del curso se requerirá el uso de varias interfaces de línea de comandos (CLIs). Se pueden teclear estos comandos vía terminal:

* _**Windows**_: _Command Prompt_, _PowerShell_, _Terminal_
* _**macOS**_: _Terminal_
* _**Linux**_: varía dependiendo de la distribución (_ej: Terminal GNOME, Konsole_)

La mayoría de los editores de código también vienen con una terminal integrada.

#### Git y GitHub

***Git*** es un sistema de control de versiones usado comúnmente para código fuente, y ***GitHub*** es una plataforma de desarrollo colaborativa construida además de ella. Aunque ninguno de los dos es estrictamente necesario para construir una aplicación *Electron* usaremos *GitHub* para realizar las entregas. Por lo tanto será necesario:

* [Crear una cuenta de GitHub](https://github.com/) utilizando la **cuenta de correo corporativa** de la GVA (**_usuario_@alu.edu.gva**).
    * Utiliza el mismo **nombre de usuario** para la cuenta *GitHub*.

    !!! note ""
        _**Ejemplo**: Para la cuenta corporativa es `jacsanvil@alu.edu.gva` el usuario de GitHub debe ser `jacsanvil`_

* [Instalar Git](https://github.com/git-guides/install-git)

    !!! note ""
        Si no estás familiarizado en como funciona *git*, se recomienda leer la [Guía de Git](https://github.com/git-guides/). 
    
* Se puede utilizar `git` mediante la terminal o la interfaz gráfica de [GitHub Desktop](https://desktop.github.com/).
* Para tareas sencillas, se recomienda el gestor integrado de *Visual Studio Code*.

### Node.js y npm

Para comenzar a desarrollar una aplicación *Electron* es necesario instalar [Node.js](https://nodejs.org/en/download) y el gestor de paquetes ***npm***. Es recomendable utilizar la última versión con soporte a largo plazo (**_LTS_**).

Para comprobar que *Node.js* se ha instalado correctamente, se puede usar la opción `-v` cuando en los comandos `node` y `npm`. Estos deben imprimir las versiones instaladas.

```bash hl_lines="1 3" title="Terminal"
$ node -v
v20.17.0
$ npm -v
10.8.2
```

!!! note "NOTA"
    Aunque es necesario tener *Node.js* instalado localmente para desarrollar un proyecto en *Electron*, el ejecutable final, viene empaquetado con su propio *Node.js*. Esto significa que **los usuarios finales no necesitan instalar *Node.js*** como requisito para ejecutar la aplicación.

