En nuestro caso hemos optado por desplegar una máquina virtual local para hacer
estos ejercicios así como futuras pruebas. Para  ello usamos VirtualBox junto a
Vagrant. Lo primero que hemos de hacer es crear un máquina virtual con Vagrant,
cargaremos una *box* de Vagrant con una versión básica de Ubuntu (64b).

```bash
mkdir ubuntu64
vagrant init precise64
vagrant up
vagrant ssh
```
Con los dos últimos comandos lo que hacemos es arrancar la máquina virtual (que
se arrancará en VirtualBox) y nos conectamos por ssh a la máquina para simplemente
comprobar que efectivamente funciona (ya hemos instalado en un ejercicio anterior
chef en esta máquina virtual para poder provisionarla usando chef). Ahora vamos
a ver cómo configuramos el directorio *ubuntu64* para almacenar la receta con la que
provisionaremos chef en esta máquina virtual (**MV**).

```bash
cd ubuntu64/
mkdir -p cookbooks/nginx/recipes
cd cookbooks/nginx/recipes
touch default.rb
```
y ahora configuramos el archivo [default.rb](default.rb) que hemos creado previamente para provisionar
todo aquello que deseamos:

```ruby
["nginx", "emacs"].each do |p|
  package p do
    action :install
  end
end
directory '/home/vagrant/CC'
file '/home/vagrant/CC/apuntes.md' do
  mode '0777'
end
```

Esta recera se ocupa de instalar los paquetes nginx y Emacs en la máquina virtual, además crea el directorio */home/vagrant/CC* y en él el archivo *apuntes.md* que al no especificar nada tendrá como dueño y grupo a *root* y los permisos que le damos son de lectura, escritura y ejecución a todo usuario de la máquina. Combiene señalar que el dar los permisos con una cadena y no con un entero, que también es posible, hace que dicho número sea interpretado de la misma forma que si lo pusiéramos en el comando `chmod`.

Una vez que tenemos configurada esta receta tendremos que configurar el archivo
*Vagrantfile* para poder provisionar la MV con chef empleando Vagrant a modo de intermediario (usando la receta que acabamos de editar):

```
Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/trusty64"
  config.vm.provision "chef_solo" do |chef|
    chef.add_recipe "nginx"
  end
end
```
las líneas que nosotros hemos añadido al archivo *Vagrantfile* (el archivo ya se inicializa
con un contenido básico al hacer vagrant init) second

```
config.vm.provision "chef_solo" do |chef|
  chef.add_recipe "nginx"
end
```

Las cuales le dicen a la MV cargue con `chef-solo` la receta *default* que está en el directorio
*nginx* dentro del directorio *cookbooks* (si quisiéramos emplear recetas en un directorio
distinto a *cookbooks*, que es el que se asume por defecto, no tendríamos más que añadir la
línea chef.cookbooks_path = "pathAOtroDirectorio"). Entonces una vez que tengamos
esto configurado no tenemos más que o bien lanzar nuevamente la MV con `vagrant up --provision`
o en caso de que la máquina ya esté arrancada ejecutar `vagrant provision`. Tenemos
que ejecutar uno de estos dos comandos ya que hemos lanzado anteriormente la VM
y por tanto ya se da como "aprovisionada", entonces el flag --provision fuerza
a que se ejecute los comandos de provisionamiento configurados en el *Vagrantfile*.
