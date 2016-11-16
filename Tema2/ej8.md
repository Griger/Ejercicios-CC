Ya en el [ejercicio 2](ej2.md) hice provisionamiento a través de Vagrant usando en esa ocación Chef. Recordemos cómo quedó el *Vagrantfile* tras esto:

```
Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/trusty64"
  config.vm.provision "chef_solo" do |chef|
    chef.add_recipe "nginx"
  end
end
```
ahora vamos a añadir unas líneas más a este archivo de modo que añadamos el servidor Apache a nuestra máquina virtual. Ya hemos instalado nginx con la [receta chef](default.rb) en el ejercicio anterior, así que ahora vamos a provisionar nuestra máquina con un servidor web distinto empleando para ello la línea de órdenes. Los archivos de configuración vagrant admiten diversos provisionadores distintos, sin más que añadir nuevas líneas de provisionamiento a ellos, indicándole cuál será el provisionador a emplear en ese momento:

```
Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/trusty64"
  config.vm.provision "chef_solo" do |chef|
    chef.add_recipe "nginx"
  end

  config.vm.provision "shell",
    inline: "apt-get -y install apache2"
end
```
Observemos dos detalles a tener en cuenta del archivo anterior: en primer lugar observamos que hemos de habilitar en el comando de instalación, `apt-get`, que se responda sí (yes) a las preguntas que se nos hagan durante la instalación, si no hacemos esto cuando `apt-get` nos pregunte no podremos responderle ya que se hace de un modo automático y el provisionamiento fallará. Por otro lado observemos que no necesitamos acompañar el comando con `sudo` cuando nos conectamos vía ssh con Vagrant a la máquina virtual lo hacemos con un usuario con privilegios de root automáticamente.

Ahora bien, esto sería si quisiéramos realizar el provisionamiento con un simple comando de consola, veamos como lo hacemos si queremos hacerlo empleando un script de shell:

```
Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/trusty64"
  config.vm.provision "chef_solo" do |chef|
    chef.add_recipe "nginx"
  end

  config.vm.provision "shell",
    path: "scriptApache.sh"
end
```
aquí hemos cambiado la provisión que hacíamos de Apache mediante un comando shell por la ejecución de un script de shell que se va a encargar de instalar apache en caso de ser necesario así como crear un par de directorios que pueden ser de utilidad para el despliegue de una web en Apache:

```shell
apt-get -y install apache2
mkdir -p /var/www/nameit.com/public_html
mkdir /var/www/nameit.com/logs
```
