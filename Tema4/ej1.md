Para instalar lxc en Arch emplearemos los dos comandos siguientes, una para instalar LXC y otro para instalar un módulo recomendado:

```bash
pacaur -S lxc
pacaur -S arch-install-scripts
```

Además, al intentar crear un contenedor no dará un fallo diciendo que nos falta el comando debootstrap lo que hemos instalado con el comando `sudo pacman -S debootstrap` y ya hemos podido configurar el primer contenedor con Ubuntu que no da ningún problema al conectar con ella.

Además es de destacar que en el caso de Arch por cuestiones de seguridad, que se aclaran en la [documentación](https://wiki.archlinux.org/index.php/Linux_Containers), los namespaces de usuario no están habilitados con lo que hemos de acceder a los contenedores, según dice en la documentación, con privilegios de superusuario.
