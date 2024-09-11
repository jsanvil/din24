# 0.2.1 Actividad

Para realizar la actividad se debe seguir los siguientes pasos:

1. Acepta la *invitación a la actividad* en GitHub Classroom: [https://classroom.github.com/a/juoyhKUl](https://classroom.github.com/a/juoyhKUl)

    - Selecciona tu correo corporativo del listado.
    - Acepta la actividad.
    
    !!! warning
        Debes utilizar tu **cuenta corporativa** de la GVA

    Con esto lo que se consigue es crear un repositorio remoto donde se subirá el código de la actividad.

    - Copia la URL del repositorio creado.

    !!! note "Ejemplo de URL del repositorio"
        `https://github.com/DAM-DIN-24/ud00-act01-electron-intro-jsanvil`

2. Clona el repositorio en tu máquina local

    Puedes utilizar *VS Code* para clonar el repositorio o la terminal con el comando `git clone <url-repositorio>`

3. Sigue los pasos del punto [0.2 Creando la primera aplicación en Electron](02_electron_firstapp.md) para configurar el entorno de desarrollo y crear un proyecto *Electron*.

    !!! warning ".gitignore"
        No olvides añadir el archivo `.gitignore` en la raíz del proyecto para que no se suban los archivos innecesarios al repositorio.

        [Ejemplo de archivo `.gitignore`](https://raw.githubusercontent.com/github/gitignore/main/Node.gitignore)

4. Realiza los cambios necesarios en el código para que la aplicación muestre un mensaje de bienvenida personalizado.

5. Realiza un *commit* con los cambios realizados y sube el código al repositorio remoto.

    ```bash title="Terminal"
    git add .
    git commit -m "Actividad finalizada"
    git push
    ```

    !!! warning
        Es posible que solicite configuración extra antes de hacer el primer *commit*

        ```bash title="Terminal"
        git config --global user.name "Nombre Apellido"
        git config --global user.email "user@alu.edu.gva.es"
        ```

6. Comprueba que los cambios se han subido correctamente al repositorio remoto.

