Lo primero que vamos a hacer es añadir una *box* de **Vagrant** configurada con OpenBSD:

```bash
vagrant box add MVOpenBSD https://dl.dropboxusercontent.com/u/12089300/VirtualBox/openbsd53_amd64.box
```
Creamos el directorio donde queramos emplazar el fichero *Vagrantfile* de la máquina virtual con OpenBSD y en estando en él desde terminal ejecutamos los siguientes comandos:

```bash
vagrant init MVOpenBSD
```
para evitar problemas con la sincronización de ficheros tendremos que añadir la siguiente línea al *Vagrantfile*:

```bash
config.vm.synced_folder ".", "/vagrant", type: "rsync"
```
e instalar, en caso de no estar disponible, el paquete `rsync` a nuestra máquina host. Y ya finalmente podemos arrancar la máquina virtual y acceder a ella vía ssh con los comandos `vagrant up` y `vagrant ssh`.
