Para provisionar con **Ansible** que es la herramienta con la que estoy más familiriazado un contenedor LXC voy a hacer empleando **Vagrant** para crear y conectar un contenedor LXC con Ubuntu, de este modo podremos probar *playabooks* que diseñamos para práctica anteriores. Entonces lo primero que tenemos que hacer es instalar el plugin de Vagrant para trabajar con LXC:

```bash
vagrant plugin install vagrant-lxc
```

Ahora pasamos a crear dicho contenedor del mismo modo que creábamos máquinas virtuales en las prácticas anteriores, en esta ocasión empleando un *box* de Vagrant que configura un Ubuntu 14.04 que es el S.O. que hemos venido usando en prácticas anteriores, aunque podría usar [otra *box* distinta](https://atlas.hashicorp.com/boxes/search?utf8=%E2%9C%93&sort=&provider=&q=lxc). Emplearemos los dos comando siguientes, en aquel directorio donde queramos emplazar el *Vagrantfile* relativo a este contenedor que vamos a crear:

```bash
vagrant init fgrehm/precise64-lxc
vagrant up --provider=lxc
```
Pese a que se ha intentado realizar este ejercicio no se ha podido completar ya que no se ha podido conectar el contenedor creado con `vagrant up`. Se han intentado seguir lo pasos indicados en un [mensaje](https://github.com/fgrehm/vagrant-lxc/issues/109#issuecomment-21274392) en un issue de GitHub al que se nos envía desde la [documentación de Arch](https://wiki.archlinux.org/index.php/Vagrant#vagrant-lxc), y aunque se han instalado todos los paquetes necesarios (bridge-utils y dnsmasq) no ha sido posible realizar la conexión.
